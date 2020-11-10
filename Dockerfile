# Set the base image
FROM python:3-slim

# Change the working directory
WORKDIR /usr/src/app

# Install our dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy our application files
COPY app.py .

# Expose a port for the app to run on
EXPOSE 5000

# Set the run command for containers
CMD ["python", "./app.py"]

# Use `docker build . -t my-flask-app` to build your image