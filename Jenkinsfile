pipeline {
    agent any

    environment {
        IMAGE_NAME = "bank"
        IMAGE_TAG = "v1"
        CONTAINER_NAME = "my-bank"
    }

    stages {

        stage('Clone Repository') {
            steps {
                sh '''
                    rm -rf Practice-Labs
                    git clone https://github.com/vaish8913/Practice-Labs.git
                '''
            }
        }

        stage('Build Image') {
            steps {
                dir('Practice-Labs') {
                    sh '''
                        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    '''
                }
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker run -d \
                      --name ${CONTAINER_NAME} \
                      -p 7080:80 \
                      ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Check Container') {
            steps {
                sh '''
                    docker ps
                '''
            }
        }
    }
}