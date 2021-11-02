# homework is a rubby application running on Kubernetes (minikube environment)
## Overview
This project is prepared for a special purpose. Main repository is on https://github.com/sawasy/http_server and forked to make changes on it.

The application is presented as a simple web service that returns a web page with the following message if you call with /healthcheck path:
```
OK
```

Otherwise returns wşth the following message
```
Well, hello there!
```

/healthcheck path is designed to use within liveness and rediness probes for containers.


## Description of files

`Dockerfile` : Dockerfile is used to create docker image for the initial tests used during fixing of http_server.rb code

`http_server.rb` : Rubby code for http server

`homework-dockerfile` : Dockerfile is used to create docker image for the minikube

`homework-deployment.yaml` : YAML file to be used for the deployment package

`homework-service.yaml` : YAML file to be used for the service package

`homework-all.yaml` : YAML for contains both deployment and service packages

`http_server_failuretests.rb` : Rubby code for http server (Testing purposes)

`homework-dockerfile-failuretest` : Dockerfile is used to create docker image for the minikube testing purposes

`homework-all-failuretests.yaml` : YAML for contains both deployment and service packages for testing purposes

`HomeworkDocumentation.docx` : Detailed documentation of homework

## Assumptions
* Using similar environment written on documentation

## Prerequisites
* Usage of minkube

## Deploying the application
* Clone the git URL
* Verify minikube installation from the terminal
```
minikube kubectl -- get po -A
```
* Run following to spin up deployment and service
```
minikube kubectl -- create -f homework-all.yaml
```
* Use followig command to see the deployment, service, pods
```
minikube kubectl -- get deployment
minikube kubectl -- get service
minikube kubectl -- get pods
```
* Get the service URL by using the following command

```
minikube service homework --url
```
* Connect the application  by using curl or any browser
```
url/healthcheck
url/anyother
```

* All the deployments can be deleted by using the following command

```
minikube kubectl -- delete -f homework-all.yaml
```



## Testing availability of the application with buggy code
Repeat the same procedure to test the availability with the `homework-all-failuretests.yaml` file.
Please follow the steps in the document in detail



# http_server
#A dead simple Ruby web server.
#Serves on port 80.
#/healthcheck path returns "OK"
#All other paths return "Well, hello there!"

#`$ ruby webserver.rb`
