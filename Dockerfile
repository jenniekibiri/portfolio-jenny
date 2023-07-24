FROM node:alpine

# Install Gatsby CLI globally using npm
RUN npm install -g gatsby-cli

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock to container
COPY package.json yarn.lock ./

# Install project dependencies
RUN yarn install

# Copy the rest of the project files to the container
COPY . .

# Clean Gatsby cache
RUN gatsby clean

# Build the Gatsby project
RUN gatsby build

# Expose port 9000 (assuming it's the correct port for Gatsby)
EXPOSE 9000

# Start the Gatsby development server
CMD ["gatsby", "serve", "-H", "0.0.0.0"]
