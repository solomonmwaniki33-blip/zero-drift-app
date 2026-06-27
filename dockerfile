# syntax=docker/dockerfile:1

FROM node:20-alpine AS builder
WORKDIR /app
COPY src/package.json src ./
RUN npm install --omit=dev && npm cache clean --force
COPY src/ ./

FROM gcr.io/distroless/nodejs20-debian12:nonroot
WORKDIR /app
COPY --from=builder --chown=nonroot:nonroot /app /app
ENV PORT=3000
EXPOSE 3000
USER nonroot
CMD ["server.js"]