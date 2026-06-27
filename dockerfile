# Stage 1: Build & install dependencies
FROM node:20-alpine AS builder
WORKDIR /app
COPY src/package*.json ./
# Swapping to standard install but restricting to production dependencies
RUN npm install --only=production
COPY src/ ./

# Stage 2: Production Hardened Minimal Distroless Layer
FROM gcr.io/distroless/nodejs20-debian12
WORKDIR /app

# Pull over ONLY the clean dependencies and source files from the builder
COPY --from=builder /app /app

# Run the system context explicitly on port 80
EXPOSE 80
ENV PORT=80

# Execute Node directly to bypass npm shell wrappers
CMD ["server.js"]