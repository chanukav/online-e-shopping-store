pipeline {
    agent any

    environment {
        DB_URL = credentials('rds-db-url')
        DB_CREDS = credentials('rds-db-credentials')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t eshop-app .'
            }
        }
        
        stage('Deploy Container') {
            steps {
                sh '''
                    # Stop and remove the old container if it exists
                    docker stop eshop-container || true
                    docker rm eshop-container || true
                    
                    # Run the new container
                    docker run -d \
                      -p 80:8080 \
                      -e DB_URL="${DB_URL}" \
                      -e DB_USER="${DB_CREDS_USR}" \
                      -e DB_PASSWORD="${DB_CREDS_PSW}" \
                      --name eshop-container \
                      eshop-app
                '''
            }
        }
    }
}