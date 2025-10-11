# Base Image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Expose app port
EXPOSE 3000

# Health check — using wget instead of curl
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --spider --quiet http://localhost:3000/healthz || exit 1

# Start the app
CMD ["npm", "start"]
