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
              docker.build("docker-ecr:$VERSION", ".")
            }

          }
        }
      }
    }
    stage('Docker Push') {
      steps {
        script {
          docker.withDockerRegistry(credentialsId: 'ecr:us-west-2:40f4bd13-2224-43b8-9956-2fd199895b3d', '091376544728.dkr.ecr.us-west-2.amazonaws.com/test-ecr', toolName: 'docker'){
            docker.image("docker-ecr:$VERSION").push()
          }
        }

      }
    }
  }
  environment {
    VERSION = 'latest'
  }
}