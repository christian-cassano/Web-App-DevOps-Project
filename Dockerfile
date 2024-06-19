# Start by choosing an official Python runtime as the parent image.
# You can use python:3.8-slim, which is a suitable choice for a Flask application.
# If you are using a M1/M2 chip Mac, use the following image instead:
# --platform=linux/amd64 public.ecr.aws/docker/library/python:3.9.10-slim-buster
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy Application Files
COPY . /app

# Install system dependencies and ODBC driver
RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \  
    apt-get clean

# Install Python Packages from requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Expose Port 5000
EXPOSE 5000

# Define Startup Command
CMD ["python", "app.py"]