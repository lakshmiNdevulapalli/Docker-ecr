pipeline {
  agent any
  environment {
    VERSION = 'latest'
  }
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
        steps {
          script {
            docker.withRegistry("https://091376544728.dkr.ecr.us-west-2.amazonaws.com/myapp", "ecr:us-west-2:40f4bd13-2224-43b8-9956-2fd199895b3d") {
            docker.image("myapp:$VERSION").push()
            docker.image("myapp").push("latest")
          }
        }
      }
    }
    stage('Terraform Init') {
      parallel {
        stage('Terraform Plan') {
          steps {
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '40f4bd13-2224-43b8-9956-2fd199895b3d', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh 'terraform init'
                //sh 'terraform plan'
            }
          }
        }
        stage('Terraform Approval') {
          steps {
            script {
              sh 'echo Hi'
            }
          }
        }
        stage('Terraform Apply'){
          steps {
            script {
              sh 'echo testing'
            }
          }
        }
      }
    }
  }
}