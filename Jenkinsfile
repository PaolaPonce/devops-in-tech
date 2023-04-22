pipeline {
    agent any
    environment{
     AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
     //AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
     BUCKET = "aws-web-jenkins-1"
     BOT_URL=credentials('telegram')
     TELEGRAM_CHAT_ID="-1001508340482"
    }

    stages {
        stage('Check AWS') {
            steps {
                sh 'aws sts get-caller-identity'
            }
        }
        stage('Deploy to s3') {
            steps {
                sh 'aws s3 sync . s3://$BUCKET --exclude ".git/*"'
            }
        }
        stage('List Object s3') {
            steps {
                sh 'aws s3 ls s3://$BUCKET'
            }
        }
        stage('notificacion Telegram') {
            steps {
                sh "curl -s -X POST $BOT_URL -d chat_id=$TELEGRAM_CHAT_ID -d parse_mode=markdown -d text='*Full project name*:  \n*Branch*: \n*Build* : [OK])'"
            }
        }
    } //end stages
} //end pipeline