pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        
        registry = "<dockerhub-username>/<repo-name>"
        registryCredential = '<dockerhub-credential-name>'        
    }
    
    stages{
       stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
       stage('Deploy Image') {
      steps {
            script {
                docker.withRegistry('https://gcr.io', 'gcr:306ac5da-2c44-4e67-924b-f6ca77e0d601') {
                    dockerImage.push()
                }
            }
        }
      }
    }
}
