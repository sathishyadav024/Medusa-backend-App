# Use the official Node.js image as the base
FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./
# Copy the .env file
COPY .env .env

# Install dependencies
RUN npm install && npm install @medusajs/medusa @medusajs/event-bus-local @medusajs/cache-inmemory

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build
# Set environment variables for PostgreSQL
ENV DATABASE_URL=database-2.cpccemasuynv.ap-south-1.rds.amazonaws.com
# Expose the port the app runs on
EXPOSE 9000

# Start the application
CMD ["npm", "start"]

