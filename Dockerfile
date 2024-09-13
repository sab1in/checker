# Stage 1: Build the React application
FROM node:10.18.0 AS build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY client/package*.json .

# Install dependencies
WORKDIR /usr/src/app/client
RUN npm install --legacy-peer-deps

# Copy the rest of your application code to the container
COPY client/. .

# Build the application
RUN npm run build

# Stage 2: Serve the React application using Nginx
FROM nginx:latest

# Copy the build artifacts from the first stage
COPY --from=build /usr/src/app/client/build /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

