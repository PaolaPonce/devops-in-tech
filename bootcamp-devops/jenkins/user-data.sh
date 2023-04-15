#AmazonLinux2
#!/bin/bash
sudo yum update -y
sudo yum install -y wget zip unzip docker git jq
sudo amazon-linux-extras install java-openjdk11 -y 
sudo amazon-linux-extras install epel -y
sudo systemctl enable docker
sudo systemctl docker start
sudo usermod -aG docker ec2-user 
DC_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/docker/compose/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
#documentacion jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl jenkins start
sudo usermod -aG docker jenkins
sudo systemctl restart docker 
sudo systemctl restart jenkins 
echo "Installation is complete."