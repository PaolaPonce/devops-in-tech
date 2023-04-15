pipeline {
    agent any
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
                sh 'docker build -t prueba-jenkins:1.0.0 .'
                sh 'docker images'
            }
        }
        stage('deploy') {
            steps {
                echo 'Hello World'
            }
        }
        stage('notification') {
            steps {
                echo 'Hello World'
            }
        }
    }
}