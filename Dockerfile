FROM node:16-alpine

# Set work directory
WORKDIR /app

# Install PM2 globally
RUN npm install -g pm2

# Install dependencies for your Node.js app
COPY package.json ./
RUN npm install

# Install additional system dependencies
RUN apk update && \
    apk add imagemagick ffmpeg speedtest-cli neofetch

# Copy your application code
COPY . .

# Expose PM2 port
EXPOSE 3000

# Start your application with PM2
CMD ["pm2-runtime", "start", "npm", "--", "start"]