pipeline{
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
		stage("Maven Build"){
            steps{
                sh "mvn clean package"
	    }
		}
		
	stage('Build') {
      steps {
        // Authenticate with Google Cloud using a service account key file
        withCredentials([file(credentialsId: 'google-cloud-key', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
          sh 'gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}'
        }

        // Trigger the Cloud Build
        sh "gcloud builds submit --project=${PROJECT_ID} --config=path/to/cloudbuild.yaml --substitutions=_TAG=${env.BUILD_NUMBER}"
      }


		}
}


		
					




