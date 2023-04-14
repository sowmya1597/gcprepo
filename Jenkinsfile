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
                docker.withRegistry('https://gcr.io', 'gcr:2452a609-4976-4af4-a8e9-fa7df544c8ec') {
                    dockerImage.push()
                }
            }
        }
      }
    }
}