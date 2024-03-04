#!/bin/bash

sudo apt update -y
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y
sudo apt install -y temurin-17-jdk
/usr/bin/java --version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

# sudo chmod +x install_jenkins.sh
# ./install_jenkins.sh

# sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Install Docker in jenkins server
sudo apt update -y
sudo apt install -y docker.io
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 777 /var/run/docker.sock

# docker run -d --name sonar -p 9000:9000 sonarqube:lts-community


# sudo vi trivy.sh

sudo apt install -y wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt update -y
sudo apt install -y trivy

# Jenkins Plugins
# Splunk - Check Enable, Enter Splunk IP, Enter Splunk Token, Jenkins public Ip  and apply& save.
# Slack Notification

# Manage Jenkins –> Credentials –> Global
# Select kind as Secret Text
# At Secret Section Provide Your Slack integration token credential ID
# Id and description are optional and create



# sudo chmod +x trivy.sh
# ./trivy.sh
# End of th script
