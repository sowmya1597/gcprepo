pipeline {
	agent any
	environment {
		PATH = "/opt/maven3/bin:$PATH"
		PROJECT_ID = 'gcpexamples-383504'
		REPO_NAME = 'gcprepo'
		BRANCH_NAME = 'master'
	}
	
	stages {
		stage("Git Checkout") {
			steps {
				git credentialsId: 'dc324c4d-4b42-4246-9b4a-a8b12f38b93d', url: 'https://github.com/sowmya1597/gcprepo/'
			}
		}
		stage('Build') {
				steps {
					// Authenticate with Google Cloud using a service account key file
					withCredentials([credentials('GCPExamples')]) {
          				sh 'gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS'
        				}

					// Trigger the Cloud Build
					sh "gcloud builds submit --project=${PROJECT_ID} --config=path/to/cloudbuild.yaml --substitutions=_TAG=${env.BUILD_NUMBER}"
				}
			}
		stage('Create build trigger') {
			steps {
				script {
					def gcb = cloudBuild()
					def trigger = gcb.createTrigger(
						projectId: PROJECT_ID,
						triggerTemplate: [
							branchName: BRANCH_NAME,
							substitutions: [
								REPO_NAME: REPO_NAME
							],
							filename: 'cloudbuild.yaml'
						],
						gitHub: [
							owner: 'your-github-owner',
							name: REPO_NAME
						],
						description: 'Your build trigger description'
					)
					def triggerId = trigger.getId()
				}
			}
		}

		stage('Trigger build') {
			steps {
				script {
					def gcb = cloudBuild()
					gcb.trigger(
						projectId: PROJECT_ID,
						triggerId: triggerId,
						source: [
							projectId: PROJECT_ID,
							branchName: BRANCH_NAME,
							repoName: REPO_NAME
						]
					)
				}
			}
		}
	}
}
