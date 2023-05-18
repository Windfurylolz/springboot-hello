#!groovy

pipeline {
   agent {
      label 'master'
      }
   options {
      timestamps()
   }
   environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
   stages {
      stage("Create docker image") {
         steps {
            echo "----creating docker image----"
            sh 'docker build . '
        }
      }
    }
      stage('Login') {
         steps {
            echo "---Logging to Dockerhub---"
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
      stage('Push') {
         steps {
            echo "---Pushing to Dockerhub---"
            sh 'docker push windfurylolz/springboot-helloworld'
      }
    }
  }
