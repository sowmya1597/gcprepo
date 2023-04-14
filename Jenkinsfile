pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        
        registry = "svvssowmya/gcprepo"
        registryCredential = '<dockerhub-credential-name>'        
    }
    
    stages{
       stage('Building image') {
      steps{
          echo "Bulding docker images"
          dir('../../../Dockerfile'){
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
         }
      }
    }
       stage('Deploy Image') {
      steps {
            script {
                docker.withRegistry('https://gcr.io', 'gcr:GCPExamples') {
                    dockerImage.push()
                }
            }
        }
      }
    }
}
