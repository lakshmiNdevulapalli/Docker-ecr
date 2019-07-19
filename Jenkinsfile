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
            sh 'docker build -t myapp:"${BUILD_ID}" -t myapp:latest .'
          }
        }
      }
    }
    stage('Docker Push') {
      parallel {
        stage('Docker Push') {
          steps {
            script {
              docker.withRegistry("https://091376544728.dkr.ecr.us-west-2.amazonaws.com/test-ecr", "ecr:us-west-2:40f4bd13-2224-43b8-9956-2fd199895b3d") {
                docker.image("myapp:$VERSION").push()
                docker.image("myapp").push("latest")
              }
            }

          }
        }
        stage('Run Terraform') {
          steps {
            script {
              terraform init
              terraform apply
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