# Packaging a python flask app into docker

## Prep
Run `docker pull python:3-slim` at the start of the presentation to start pulling the base image. This might take a while on slower internet. 

## Part 1
### Creating the dockerfile
Create an empty file called `Dockerfile` and add the following commands to it:

1. Set the base image  
    `FROM python:3-slim`
2. Change the working directory  
    `WORKDIR /usr/src/app`
3. Install the dependencies  
    `COPY requirements.txt .`  
    `RUN pip install -r requirements.txt`
4. Add the application files  
    `COPY app.py .`
5. Expose a port for the app to run on  
    `EXPOSE 5000`
6. Set the run command  
    `CMD ["python", "./app.py"]`

### Building the image
Run `docker build . -t my-flask-app` to build your image

### Running the image 
1. Run `docker run -d -p 5000:5000 my-flask-app` to run a container from your image
2. Go to http://localhost:5000 in your browser to access the app. 

## Part 2

### Change your image
1. Change the 'Hello World!' return message in app.py to another image
2. Run `docker build . -t my-flask-app` to rebuild your image. Note how the first few steps are read from the cache instead of being rebuilt. 

### Run another container instance 
1. Run `docker run -d -p 5001:5000 my-flask-app` to run another container from your image. Note how we are now binding it to port 5001
2. Go to  http://localhost:5001 in your browser to access the new app. 
2. Go to  http://localhost:5000 in your browser and note that the original app is still running too. 

### Cleaning up
1. Run `docker ps` to list the running containers
2. For each running container:
    1. Copy the CONTAINER ID
    2. Run `docker stop <id>` to stop it
    3. Run `docker rm <id>` to remove it
3. Run `docker image rm my-flask-app` to remove the image
