pipeline {
  agent any
  stages {
    stage('Terraform Plan') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '7f25cb67-cb93-482c-83d8-c6677c54a2d1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]){
          sh 'terraform init'
          sh 'terraform destroy'
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
          docker.withRegistry("https://091376544728.dkr.ecr.us-east-1.amazonaws.com/myapp", "ecr:us-east-1:7f25cb67-cb93-482c-83d8-c6677c54a2d1") {
            docker.image("myapp:$VERSION").push()
            docker.image("myapp").push("latest")
          }
        }

      }
    }
  }
  environment {
    VERSION = 'latest'
  }
}
