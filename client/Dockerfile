# Dockerfile for Front-End Application

# Use an official Node.js image as a parent image
FROM node:10.18.0

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of your application code to the container
COPY ./ ./

# Build the application
RUN npm run build

# Install Nginx to serve the built front-end
FROM nginx:latest
COPY --from=0 /usr/src/app/build /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80
