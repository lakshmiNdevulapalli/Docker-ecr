pipeline {
  agent any
  stages {
    stage('Image Preaparation') {
      parallel {
        stage('Image-Version Preaparation') {
          steps {
            script {
              VERSION = "${BUILD_ID}"
            }

          }
        }
        stage('Build Image') {
          steps {
            script {
              docker.build("test-ecr:$VERSION","test-ecr:latest", ".")
            }

          }
        }
      }
    }
    stage('Docker Push') {
      steps {
        script {
          docker.withRegistry("https://091376544728.dkr.ecr.us-west-2.amazonaws.com/test-ecr", "ecr:us-west-2:40f4bd13-2224-43b8-9956-2fd199895b3d") {
            docker.image("test-ecr:$VERSION").push()
          }
        }

      }
    }
  }
  environment {
    VERSION = 'latest'
  }
}