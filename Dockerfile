FROM node:22.16.0-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@10.18.3

# Copy everything (includes patches, packages, etc.)
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build
RUN pnpm build

# Start command
WORKDIR /app/packages/cli
CMD ["pnpm", "start"]
