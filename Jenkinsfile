pipeline {
    agent any
    
    tools {
        maven 'Maven'
    }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        DOCKER_IMAGE_NAME = 'landonessex/comp367'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Maven Project') {
            steps {
                sh '${MAVEN_HOME}/bin/mvn clean package'
            }
        }
        
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE_NAME}:latest ."
            }
        }
        
        stage('Docker Push') {
            steps {
                sh "docker push ${DOCKER_IMAGE_NAME}:latest"
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
}
