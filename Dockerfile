# This file is the main docker file configurations

# Official Node JS runtime as a parent image
FROM node:12.15.0-alpine

# Set the working directory to ./app
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN apk add --no-cache git

# Install any needed packages
RUN npm config set unsafe-perm true
RUN npm install 

# Audit fix npm packages
RUN npm audit fix

# Bundle app source
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.js when the container launches
CMD ["npm", "start"]
