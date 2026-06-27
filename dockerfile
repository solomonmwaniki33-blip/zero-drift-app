# Stage 1: Build & install dependencies
FROM node:20-alpine AS builder
WORKDIR /app
COPY src/package*.json ./
RUN npm install
COPY src/ ./

# Stage 2: Minimalist, clean production container
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 80
ENV PORT=80
CMD ["npm", "start"]