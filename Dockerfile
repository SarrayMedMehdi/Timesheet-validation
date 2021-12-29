FROM  java:8
# Set image information, but could be set to different location from command line
ARG IMAGE_VERSION="0.0.1-SNAPSHOT"
ARG IMAGE_NAME="Timesheet"
ARG MAINTAINER="Mohamed Mehdi Sarray"

LABEL version=${IMAGE_VERSION} name=${IMAGE_NAME} maintainer=${MAINTAINER}

# Limiting security access to not user root user
RUN addgroup siriusxi && useradd -g siriusxi -ms /bin/bash mehdi

# Setting user to current created user
USER mehdi

# Set working directory to application folder
WORKDIR /home/mehdi/application

# Fatjar location, but could be set to different location from command line
ARG JAR_FILE=target/*.jar

# Copy fat jar file to current image builder
COPY ${JAR_FILE} application.jar


# Expose current application to port 8080
EXPOSE 8089

ARG JAVA_OPTS=""

# Run the application
ENTRYPOINT ["java", "-jar", "application.jar"]