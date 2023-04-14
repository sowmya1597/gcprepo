pipeline{
    agent {
        dockerfile {
            filename 'Dockerfile.jenkinsAgent'
            additionalBuildArgs  '--build-arg JENKINSUID=`id -u jenkins` --build-arg JENKINSGID=`id -g jenkins` --build-arg DOCKERGID=`stat -c %g /var/run/docker.sock`'
            args '-v /var/run/docker.sock:/var/run/docker.sock -u jenkins:docker'
        }
    }
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
        timestamps()
    }
    environment{
        
        registry = "svvssowmya/gcprepo"
        registryCredential = 'svvssowmya/******'        
    }
    stages{
        stage("Git Checkout"){
            steps{
               git branch: 'master', url: 'https://github.com/sowmya1597/gcprepo.git'
            }
        }
   
       stage('Building image') {
      steps{
          echo "Bulding docker images"
        
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
         
      }
    }
         
       stage('Deploy Image') {
      steps {
            script {
                docker.withRegistry('https://gcr.io', 'svvssowmya/******') {
                    dockerImage.push()
                }
            }
        }
      }
    }
}
    

