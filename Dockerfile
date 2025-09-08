# Use the offical tomcat version with java 17
FROM tomcat:10.1-openjdk17-temporal

# Remove everything to avoid clutter
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the sampleapp.war file into the tomcat webapps directory
COPY target/sampleapp.war /usr/local/tomcat/webapps/sampleapp.war

# Expose port 8080
EXPOSE 8080

# Start the service
CMD ["catalina.sh", "run"]


