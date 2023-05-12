sudo apt update && sudo apt upgrade

# Installing Java
sudo apt install openjdk-8-jdk

# Add the Jenkins repository to your system's package source list 
# by adding the following to the "/etc/apt/sources.list" file:
deb https://pkg.jenkins.io/debian binary/

# Add the repoaitory key to your system
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
