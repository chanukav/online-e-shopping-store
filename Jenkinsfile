pipeline {
    agent { label 'ec2-agent' }

    environment {
        DB_URL = credentials('rds-db-url')
        DB_CREDS = credentials('rds-db-credentials')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t eshop-app .'
                    } else {
                        powershell 'docker build -t eshop-app .'
                    }
                }
            }
        }
        
        stage('Deploy Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh '''
                            # Stop and remove the old container if it exists
                            docker stop eshop-container || true
                            docker rm eshop-container || true
                            
                            # Run the new container
                            docker run -d \
                              -p 8080:8080 \
                              -e DB_URL="${DB_URL}" \
                              -e DB_USER="${DB_CREDS_USR}" \
                              -e DB_PASSWORD="${DB_CREDS_PSW}" \
                              --name eshop-container \
                              eshop-app
                        '''
                    } else {
                        powershell '''
                            # Stop and remove the old container if it exists
                            if (docker ps -a --format '{{.Names}}' | Select-String -Pattern "^eshop-container$") {
                                docker stop eshop-container
                                docker rm eshop-container
                            }
                            
                            # Run the new container
                            docker run -d `
                              -p 8080:8080 `
                              -e DB_URL="$env:DB_URL" `
                              -e DB_USER="$env:DB_CREDS_USR" `
                              -e DB_PASSWORD="$env:DB_CREDS_PSW" `
                              --name eshop-container `
                              eshop-app
                        '''
                    }
                }
            }
        }
    }
}