# Easycrm
Easycrm is a customer relationship management web application with MongoDB Atlas database. This application enables the functinality of the basic CRUD to manage customer relationship. Easycrm is hosted on AWS ECS Fargate via Terraform to set up application loadbalancer, ecs, mongodb atlas database, network and security group by IaS. By doing so, it provides high availabity and auto-scaling feature for the web application for further development and operation. 

## Tool:
- Runtime: Node.js
- SCM: Bitbucket
- Database: MongoDB
- CI/CD Pipeline: Jenkins
- Docker registry: Docker hub
- Orchestration: Amazon ECS Fargate 

## Terraform
Infra-as-code scripts can be found in "infra" file; all varaibles are written in default.tfvars and can be easily configured for infrastructure.
## Terraform scripts directory structure ##
```
  infra
    |---modules
        |---alb
            |---main.tf
            |---output.tf
            |---variables.tf
        |---ecs
            |---main.tf
            |---outputs.tf
            |---variables.tf
        |---mongodb
            |---main.tf
            |---output.tf
            |---variables.tf
        |---network
            |---main.tf
            |---output.tf
            |---variables.tf
        |---sg
            |---main.tf
            |---output.tf
            |---variables.tf
    |---default.tfvars
    |---main.tf
    |---output.tf
    |---provider.tf
    |---variables.tf
```
## Mongodb Atlas
The project is deployed with Mongodb Atlas. Mongodb altas enables the high availability with replica and backup; the database can be easily scale up and down; the security setting is set up for the database. It also provides live metrics to monitor the health check endpoint.

## Pipeline
There are three pipeline for this project to automate continuous integration and deployment: <br />
1. easycrm_infra (Jenkinsfile_infra) <br />
2. easycrm_ci (Jenkinsfile) <br />
3. easycrm_cd (Jenkinsfile_cd) <br />
Those CI/CD configuration files can be found in "cicd" file 

### Key feature of pipelines
- Set boolean parameters for infrascture to give option to apply terraform or   destroy the infrastructure
- Added post stage to email the status of build to multiple teams and custom contents 
- Added sanity checking in easycrm_cd to check before deploying

### Guide
1. Using Jenksfile_infra to build easycrm_infra pipeline for setting up the infrastructure for the project
2. Using Jenksfile to build easycrm_ci pipeline to dockerise the app, test and integrate the development and push the image to the dockerhub
3. Using Jenksinfilel_cd to build easycrm_cd pipelline to deploy the docker image to the production environment 
4. Set easycrm to watch main branch in "Build when a change is pushed to BitBucket" in Jenkins "Build Triggers" to allow automatic triger; <br />
   Set easycrm_cd to watch easycrm_ci in "Build after other projects are built" in Jenkins "Build Triggers"
5. Configure the Environment variables in Global properties or parameters in "Builld with Parameters" to define email setting in the post stage of the pipeline

