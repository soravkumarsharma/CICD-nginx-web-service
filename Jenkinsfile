def dockerRun='docker run -p 80:80 -d --name my-service soravkumarsharma/nginx-web-pipeline:latest'
def dockerRemove='docker container rm -f my-service'
def dockerImageRemove='docker rmi soravkumarsharma/nginx-web-pipeline:latest'
pipeline{
    agent any
    stages{
        stage("Pull the Source Code from the GitHub"){
            steps{
                git url:"https://github.com/soravkumarsharma/CICD-nginx-web-service.git", branch:"main"
            }
        }
        stage("Build the Docker image from the Dockerfile"){
            steps{
                sh "docker build -t $JOB_NAME:v.$BUILD_ID ."
                sh "docker tag $JOB_NAME:v.$BUILD_ID soravkumarsharma/$JOB_NAME:v.$BUILD_ID"
                sh "docker tag $JOB_NAME:v.$BUILD_ID soravkumarsharma/$JOB_NAME:latest"
            }
        }
        stage("Push the Dockerimage in the DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubpass', usernameVariable: 'dockerhubuser')]) {
                sh "docker login -u $dockerhubuser -p $dockerhubpass"
                sh "docker push soravkumarsharma/$JOB_NAME:v.$BUILD_ID"
                sh "docker push soravkumarsharma/$JOB_NAME:latest"
                sh "docker rmi $JOB_NAME:v.$BUILD_ID soravkumarsharma/$JOB_NAME:v.$BUILD_ID soravkumarsharma/$JOB_NAME:latest"
                } 
            }
        }
        stage("Deploy the Dockerimage from Dockerhub to Ec2 Docker-host"){
            
            steps{
                sshagent(['dockerHostLogIn']) {
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.7.38 ${dockerRemove}"
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.7.38 ${dockerImageRemove}"
                sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.7.38 ${dockerRun}"
                }
            }
        }
    }
}
