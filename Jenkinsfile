pipeline {
    agent any
    environment{
     AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
     //AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
     //BUCKET = "aws-web-jenkins-2"
     BOT_URL="https://api.telegram.org/bot5881753165:AAEjB95ZRDUW0kRMCzMA7C1yjpHemiGTpiM/sendMessage"
     TELEGRAM_CHAT_ID="-1001508340482"
     EC2INSTANCEDEV='ec2-user@44.199.227.173'
     REGISTRY='roxsross12'
     IMAGEAPP='jenkinspy'
     VERSION='1.0.1'
     DOCKER_HUB_LOGIN = credentials('docker')
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $REGISTRY/$IMAGEAPP:$VERSION .'
                sh 'docker images |grep jenkins'
            }
        }
        stage('Push to Docker-hub') {
            steps {
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'docker push $REGISTRY/$IMAGEAPP:$VERSION'
            }
        }

        stage('Deploy to ec2') {
            steps {
                echo 'Deploy to ec2'
                sh ("sed -i -- 's/REGISTRY/$REGISTRY/g' docker-compose.yml")
                sh ("sed -i -- 's/IMAGEAPP/$IMAGEAPP/g' docker-compose.yml")
                sh ("sed -i -- 's/VERSION/$VERSION/g' docker-compose.yml")
                sshagent (['aws-ssh']){
                    sh 'scp -o StrictHostKeyChecking=no docker-compose.yml $EC2INSTANCEDEV:/home/ec2-user'
                    sh 'ssh $EC2INSTANCEDEV ls -lrt'
                    sh 'ssh $EC2INSTANCEDEV docker-compose up -d'
                }
            }
        }
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