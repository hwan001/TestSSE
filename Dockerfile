# docker/Dockerfile
FROM tomcat:9-jdk11

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

ENV CATALINA_OPTS="-Djava.util.logging.ConsoleHandler.level=FINE"

# / 로 접근하고 싶은 경우
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# / 뒤에 원래 이름을 사용하고 싶은 경우
# COPY target/*.war /usr/local/tomcat/webapps/

# / 뒤에 정해진 이름을 사용하고 싶은 경우
# COPY target/*.war /usr/local/tomcat/webapps/test.war

CMD ["catalina.sh", "run"]