#!groovy

pipeline {
   agent {
      label 'master'
      }
   options {
      timestamps()
   }
   stages {
      stage("create docker image") {
         steps {
            echo "----creating docker image"
            sh 'docker build . '
        }
      }
    }
  }
}
