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
                  deploy adapters: (git credentialsId: 'b7278b53-701c-439d-87a9-d419d396b8b8', path: '', url: 'http://34.93.6.195:8080/')
                                       
                 }
        }
        
    }
}

