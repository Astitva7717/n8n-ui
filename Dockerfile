# Use Debian-based Node instead of Alpine
FROM node:22.16.0

WORKDIR /app

# Install system dependencies n8n needs
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install pnpm
RUN npm install -g pnpm@10.18.3

# Copy everything
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build
RUN pnpm build

# Expose port
EXPOSE 5678

# Start command
WORKDIR /app/packages/cli
CMD ["pnpm", "start"]
