pipeline {
	agent any
	environment {
		PATH = "/opt/maven3/bin:$PATH"
		PROJECT_ID = 'gcpexamples-383504'
		REPO_NAME = 'gcprepo'
		BRANCH_NAME = 'master'
	}
	
	stages {
		  stage("Git Checkout"){
            steps{
               git branch: 'master', url: 'https://github.com/sowmya1597/sowmi.git'
            }
		}
		stage('Create Cloud Build') {
            steps {
                script {
                    def gcloud = tool 'google-cloud-sdk'
                    withCredentials([gcpServiceAccount('gcp-creds')]) {
                        sh "${gcloud}/bin/gcloud auth activate-service-account ${env.GCP_SERVICE_ACCOUNT_EMAIL} --key-file=${env.GOOGLE_APPLICATION_CREDENTIALS}"
                        sh "${gcloud}/bin/gcloud builds submit --project=${env.GCP_PROJECT_ID} ."
                    }
		}
		}
		
		}				
	}
}

