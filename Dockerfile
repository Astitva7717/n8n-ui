FROM node:22.16.0-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@10.18.3

# Copy package files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY packages ./packages

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build
RUN pnpm build

# Start command
WORKDIR /app/packages/cli
CMD ["pnpm", "start"]
