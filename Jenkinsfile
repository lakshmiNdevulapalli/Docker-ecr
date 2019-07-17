pipeline {
  agent any
  stages {
    stage('Image Preaparation') {
      parallel {
        stage('Image-Version Preaparation') {
          steps {
            sh '''commitHash = git rev-parse --short=7 HEAD
IMAGE = "$PROJECT:$commitHash"'''
          }
        }
        stage('Build Image') {
          steps {
            sh '''def dockerfile = \'Dockerfile\'
docker.build("$IMAGE", "-f ${dockerfile} .")'''
          }
        }
      }
    }
    stage('Docker Push') {
      steps {
        sh '''docker.withDockerRegistry(credentialsId: \'ecr:us-west-2:40f4bd13-2224-43b8-9956-2fd199895b3d\', url: \'091376544728.dkr.ecr.us-west-2.amazonaws.com/test-ecr\' ,toolName: \'docker\') {
    docker.image($IMAGE).push()
}'''
        }
      }
    }
  }