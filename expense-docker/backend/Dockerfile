FROM node:20 AS builder
WORKDIR /opt/server
# Copy package.json and install dependencies first for better caching
COPY package.json .
RUN npm install --production

# Copy application files
COPY *.js .


# Second stage: use Alpine for a smaller image
FROM node:20.18.0-alpine3.20
WORKDIR /opt/server

# Create a non-root user and group
RUN addgroup -S expense && adduser -S expense -G expense
    

# Copy only necessary files from the builder stage
COPY --from=builder /opt/server /opt/server

# Set permissions for the /opt/server directory
RUN chown -R expense:expense /opt/server

# Expose the application port and set the user
EXPOSE 8080
ENV DB_HOST="mysql"
USER expense
CMD ["node", "index.js"]


# Before best practices implemented
# FROM node:20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "index.js"]
