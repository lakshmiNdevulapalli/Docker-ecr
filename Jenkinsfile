pipeline {
  agent any
  stages {
    stage('Terraform Plan') {
      steps {
        script{
          sh 'terraform init'
          sh 'terraform plan -out=tfplan -input=false'
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        script {
          sh 'terraform apply -input=false -auto-approve "tfplan"'
        }
        
      }
    }
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
          docker.withRegistry("https://091376544728.dkr.ecr.us-east-1.amazonaws.com/myapp", "ecr:us-east-1:c84f1e90-6917-4bb4-adeb-b71447ca0a7b") {
            docker.image("myapp:$VERSION").push()
            docker.image("myapp").push("latest")
          }
        }

      }
    }
    stage('Destroy Terraform') {
      steps {
        script {
          sh 'terraform destroy -input=false -auto-approve "tfplan"'
        }

      }
    }
  }
  environment {
    VERSION = 'latest'
  }
}
