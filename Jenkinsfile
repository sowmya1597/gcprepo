pipeline {
	agent any
	environment {
		PATH = "/opt/maven3/bin:$PATH"
		PROJECT_ID = 'gcpexamples-383504'
		REPO_NAME = 'gcprepo'
		BRANCH_NAME = 'master'
		GCP_SERVICE_ACCOUNT_EMAIL='180856003021-compute@developer.gserviceaccount.com'
	}
	
	stages {
		  stage("Git Checkout"){
            steps{
               
		    git credentialsId: 'e03419c4-f9f4-4d27-b7d7-1ff81227e501',branch: 'master', url: 'https://github.com/sowmya1597/gcprepo'
            }
		}
		stage('Create Cloud Build') {
            steps {
                script {
                    def gcloud = tool 'google-cloud-sdk'
                    withCredentials([gcpServiceAccount('8ebc5ce14561cd858fcf7dfcb16c088fcd7a32e7')]) {
                        sh "${gcloud}/bin/gcloud auth activate-service-account ${env.GCP_SERVICE_ACCOUNT_EMAIL} --key-file=${env.GOOGLE_APPLICATION_CREDENTIALS}"
                        sh "${gcloud}/bin/gcloud builds submit --project=${env.PROJECT_ID} ."
                    }
		}
		}
		
		}				
	}
}

