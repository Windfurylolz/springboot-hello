#!groovy

pipeline {
   agent {
      label 'master'
   }
  options {
     buildDiscarder(logRotator(numToKeepStr: '5'))
     timestamps()
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t windfurylolz/springboot-helloworld . '
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push windfurylolz/springboot-helloworld'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
