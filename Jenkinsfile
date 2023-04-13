pipeline {
	agent any
	environment {
		PATH = "/opt/maven3/bin:$PATH"
		PROJECT_ID = 'gcpexamples-383504'
		REPO_NAME = 'gcprepo'
		BRANCH_NAME = 'master'
		GCP_SERVICE_ACCOUNT_EMAIL ='180856003021@cloudbuild.gserviceaccount.com'
	}

	stages {

		stage("Git Checkout") {
			steps {

				git credentialsId: '2452a609-4976-4af4-a8e9-fa7df544c8ec', url: 'https://github.com/sowmya1597/gcprepo/'
			}
		}
		steps {
                    maven(maven : 'Maven_3'){
                        bat "mvn clean compile"
                }
		}
		
	stage('Create Cloud Build') {
		steps {
			script {

				withCredentials([gcpServiceAccount('180856003021@cloudbuild.gserviceaccount.com')]) {
					sh "${gcloud}/bin/gcloud auth activate-service-account ${env.GCP_SERVICE_ACCOUNT_EMAIL} --key-file=${env.GOOGLE_APPLICATION_CREDENTIALS}"
					sh "${gcloud}/bin/gcloud builds submit --project=${env.PROJECT_ID} ."
				}
			}
		}
	}
		
		}
}
}

		
					




