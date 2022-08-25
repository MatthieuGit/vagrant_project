#!/bin/bash

#Install JAVA
sudo apt-get update
sudo apt-get install default-jre -y

#Install Docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

  #Install GIT
  sudo apt-get install git -y
  mkdir ~/workspace
  git clone https://github.com/spring-projects/spring-petclinic.git
  #we are using the db postgresql
  sudo sed -i -e 's/database=h2/database=postgres/' spring-petclinic/src/main/resources/application.properties
  sudo sed -i   '3i spring.datasource.url=${POSTGRES_URL:jdbc:postgresql://localhost/petclinic}' spring-petclinic/src/main/resources/application.properties
  sudo sed -i   '4i spring.datasource.username=${POSTGRES_USER:petclinic}' spring-petclinic/src/main/resources/application.properties
  sudo sed -i   '5i spring.datasource.password=${POSTGRES_PASS:petclinic}' spring-petclinic/src/main/resources/application.properties
  sudo sed -i   '9i spring.sql.init.mode=always' spring-petclinic/src/main/resources/application.properties
  sudo sed -i   '10i spring.profiles.active=postgres' spring-petclinic/src/main/resources/application.properties
  #launch postgres container
  sudo docker run -d -e  POSTGRES_USER=petclinic -e POSTGRES_PASSWORD=petclinic -e POSTGRES_DB=petclinic -p 5432:5432 postgres:14.1

#build app
  cd spring-petclinic
  sudo ./mvnw package -Dmaven.test.skip=true
  #launch app
  java -jar target/*.jar
