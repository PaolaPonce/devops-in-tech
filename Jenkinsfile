pipeline {
    agent any
    environment{
     AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
     //AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
     BUCKET = "aws-web-jenkins-2"
     BOT_URL="https://api.telegram.org/bot5881753165:AAEjB95ZRDUW0kRMCzMA7C1yjpHemiGTpiM/sendMessage"
     TELEGRAM_CHAT_ID="-1001508340482"
    }

    stages {
        stage('Init') {
            agent {
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'roxsross12/node-chrome'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm run test'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm run build'
                stash includes: 'dist/**/*',name: 'dist'
            }
        }
        stage('Deploy to s3') {
            steps {
                unstash 'dist'
                sh 'aws s3 sync dist/ s3://$BUCKET --exclude ".git/*"'
            }
        }
        stage('List Object s3') {
            steps {
                sh 'aws s3 ls s3://$BUCKET'
            }
        }
        // stage('notificacion Telegram') {
        //     steps {
        //         sh "curl -s -X POST $BOT_URL -d chat_id=$TELEGRAM_CHAT_ID -d parse_mode=markdown -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [OK](${BUILD_URL}consoleFull)'"
        //     }
        // }
    } //end stages
    post { 
         always { 
            cleanWs()
        }
        success { 
            sh  "curl -s -X POST $BOT_URL -d chat_id=${TELEGRAM_CHAT_ID} -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [OK])'"
         }
         failure {
            sh  "curl -s -X POST $BOT_URL -d chat_id=${TELEGRAM_CHAT_ID} -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [Not OK])'"
         }
    }
} //end pipeline