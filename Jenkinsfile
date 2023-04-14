pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        
        registry = "svvssowmya/gcprepo"
        registryCredential = 'svvssowmya/******'        
    }
    
   
       stage('Building image') {
      steps{
          echo "Bulding docker images"
          dir('./Dockerfile'){
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
         }
      }
    }
         stages{
        stage("Git Checkout"){
            steps{
               git branch: 'master', url: 'https://github.com/sowmya1597/gcprepo.git'
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
    

