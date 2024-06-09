pipeline {
    	
	agent any

	environment {
		PORTAINER_WEBHOOK = credentials('jenkins_webhook')
    }

    stages {
		stage('Build') {
			steps {
				script {
					def dockerImage = docker.build("craigbooth/jenkins")				}
            }

		}
		
		stage('Deploy') {
			steps {
				script {
				    httpRequest httpMode: 'POST', responseHandle: 'NONE', url: "${PORTAINER_WEBHOOK}", wrapAsMultipart: false
				}
            }
		}
    }
	
	post {
		success {
			cleanWs()
		}
	}
}
