# Stage 1: Build dengan Bun
FROM oven/bun:latest AS builder

WORKDIR /app
COPY . .
RUN bun install
RUN bun run build

# Stage 2: Serve dengan Bun
FROM oven/bun:latest

WORKDIR /app
COPY --from=builder /app /app

EXPOSE 3000
CMD ["bun", "dev:v2"]
