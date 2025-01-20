# Use Python as the base image
FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive

# Install system dependencies
# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get -y install git && git --version

# Set the working directory
WORKDIR /app

# Copy the repository code into the container
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the default FastAPI port
EXPOSE 8000

# Command to run the FastAPI application
CMD ["python", "-m", "fastapi"]
