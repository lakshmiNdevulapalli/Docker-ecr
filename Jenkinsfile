pipeline {
  agent any
  stages {
    stage('Image Preaparation') {
      parallel {
        stage('Image-Version Preaparation') {
          steps {
            script {
              VERSION = "${BUILD_ID}:latest"
            }

          }
        }
        stage('Build Image') {
          steps {
            script {
              docker.build("test-ecr:$VERSION", ".")
              docker.build("test-ecr:latest", ".")
            }

          }
        }
      }
    }
  }
  environment {
    VERSION = 'latest'
  }
}