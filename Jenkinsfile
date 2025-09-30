pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username')   // Jenkins credentials ID
        DOCKER_PASS     = credentials('docker-password')   // Jenkins credentials ID
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

        stage('Build, Push & Deploy') {
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
