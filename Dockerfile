FROM maven:3.6.1-jdk-8 as Build
COPY . .
RUN mvn package
FROM tomcat
copy --from=Build ./target/*.war /usr/local/tomcat/webapps
