FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y     python3 python3-pip python3-dev     build-essential cmake git

# Set working directory
WORKDIR /app

# Copy source
COPY . .

# Build the wheel
RUN pip install --upgrade pip setuptools wheel
RUN pip wheel . -w dist
