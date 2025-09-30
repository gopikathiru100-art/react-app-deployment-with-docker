# Use latest LTS Node instead of old Node 14
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Build the React app
RUN npm run build

# Use Nginx to serve the production build
FROM nginx:stable-alpine

# Copy build output to Nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
