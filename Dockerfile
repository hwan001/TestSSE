FROM tomcat:9-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY server.xml /usr/local/tomcat/conf/server.xml

ENV CATALINA_OPTS="-Djava.util.logging.ConsoleHandler.level=FINE"

COPY target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
