pipeline {
	agent any
	environment {
		PATH = "/opt/maven3/bin:$PATH"
		PROJECT_ID = 'gcpexamples-383504'
	}
	stages {
		stage("Git Checkout") {
			steps {
				git credentialsId: 'b7278b53-701c-439d-87a9-d419d396b8b8', url: 'https://github.com/sowmya1597/gcprepo'
			}
		}
		stage('cloud Build') {
			steps {
				// Authenticate with Google Cloud using a service account key file
				withCredentials([file(credentialsId: 'GCPExamples', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
					sh 'gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}'
				}

				// Trigger the Cloud Build
				sh "gcloud builds submit --project=${PROJECT_ID} --config=path/to/cloudbuild.yaml --substitutions=_TAG=${env.BUILD_NUMBER}"
			}
		}
	}
}
