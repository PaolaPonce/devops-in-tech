pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
        REGISTRY = "roxsross12"
        VERSION = "1.0.0"
        IMAGE = "prueba-jenkins"
    }
    stages {
        stage('init') {
            agent{
                docker {
                    image 'node:alpine'
                    args '-u root:root'
                }
            }
            steps {
                echo 'install dependencies'
                sh 'npm install'
            }
        }
        stage('test') {
            agent{
                docker {
                    image 'node:alpine'
                    args '-u root:root'
                }
            }
            steps {
                echo 'install dependencies'
                sh 'npm run test'
            }
        }
        stage('Build') {
            steps {
                echo 'listar'
                sh 'docker build -t $IMAGE:$VERSION .'
                sh 'docker images'
            }
        }
        stage('deploy') {
            steps {
                echo 'login'
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'docker tag $IMAGE:$VERSION $REGISTRY/$IMAGE:$VERSION'
                sh 'docker push $REGISTRY/$IMAGE:$VERSION'

            }
        }
        stage('notification') {
            steps {
                echo 'Hello World'
            }
        }
    }
}