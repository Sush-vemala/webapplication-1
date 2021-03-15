FROM tomcat
MAINTAINER Susmitha
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat
CMD [“catalina.sh”, “run”]
