# Stage 1: Build
FROM oven/bun:latest AS builder
WORKDIR /app
COPY . .

WORKDIR /app/packages/gitbook-v2/openNext
RUN bun install
RUN bun run build

# Stage 2: Serve
FROM oven/bun:latest
WORKDIR /app

COPY --from=builder /app/packages/gitbook-v2/openNext /app

ENV PORT=3000
EXPOSE 3000

CMD ["bun", "start"]
