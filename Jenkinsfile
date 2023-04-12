pipeline{
    agent any
    
    environment{
        PATH = "/opt/maven3/bin:$PATH"
    }
    stages{
        stage("Git Checkout"){
            steps{
               git branch: 'dev', url: 'https://github.com/sowmya1597/sowmi.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
        }
        stage("deploy"){
            steps{
                  deploy adapters: [tomcat9(credentialsId: '844041b8-98c9-44b8-9a64-a6b9ad320182', path: '', url: 'http://35.194.148.120:8080/')], contextPath: 'webapps', war: 'target/*.war'
                                       
            }
        }
    }
}
