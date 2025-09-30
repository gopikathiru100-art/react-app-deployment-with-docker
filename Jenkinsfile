pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username')   // Jenkins credentials ID for DockerHub username
        DOCKER_PASS     = credentials('docker-password')   // Jenkins credentials ID for DockerHub password
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/gopikathiru100-art/react-app-deployment-with-docker.git'
            }
        }

        stage('Set Permissions') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Build & Deploy Docker Container') {
            steps {
                sh './build.sh'
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
        failure {
            echo "Pipeline failed ❌"
        }
        success {
            echo "Pipeline succeeded ✅"
        }
    }
}
