#Épingler notre version tomcat à un élément qui n’a pas été mis à jour pour supprimer la vulnérabilité 
FROM lunasec/tomcat-9.0.59-jdk11

ADD src/ /helloworld/src
ADD pom.xml /helloworld

#Créer une application Spring
RUN apt update && apt install maven -y
WORKDIR /helloworld/
RUN mvn clean package

#Déployer sur tomcat
RUN mv target/helloworld.war /usr/local/tomcat/webapps/
