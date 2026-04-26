# Start from the official Ubuntu base image
FROM ubuntu:20.04  

# Set the working directory inside the container
WORKDIR /app  

# Copy current directory contents into the container
COPY . .  

# Install necessary packages
RUN apt-get update && apt-get install -y curl  

# Define the default command to run when the container starts
CMD ["echo", "Hello from my Docker container!"]
