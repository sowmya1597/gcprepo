pipeline{
    agent any
    
    environment{
        PATH = "/opt/maven3/bin:$PATH"
    }
    stages{
        stage("Git Checkout"){
            steps{
                      git branch: 'master', url: 'https://github.com/sowmya1597/gcprepo.git'
                  }
        }
        stage("Maven Build"){
           steps{
                sh "mvn clean package"
               
            }
        }
             stage("deploy"){
            steps{
                  deploy adapters: (credentialsId: '9d8b480d-8752-4e32-b5e7-9ce5fb4e48b0', path: '', url: 'http://34.135.82.198:8080/')
                                       
        }
        
    }
}

