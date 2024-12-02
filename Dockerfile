# Use OpenJDK 17 Alpine image as the base image
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Install wget to download the JAR file
RUN apk add --no-cache wget

# Ensure the target directory exists before downloading the JAR file
RUN mkdir -p /home/pravi/ZebraTester/Container/
RUN mkdir -p /home/pravi/ZebraTester/Container/lib

# Download xercesImpl JAR if required
RUN wget https://repo1.maven.org/maven2/xerces/xercesImpl/2.11.0/xercesImpl-2.11.0.jar -P /home/pravi/ZebraTester/Container/

# Copy all necessary files (including .jar files) into the Docker container
COPY . /app

# Ensure that the lib directory has the required JAR files
COPY ./lib /home/pravi/ZebraTester/Container/lib

# Set the classpath to include necessary JAR files
ENV CLASSPATH="/app/prxsniff.jar:/app/iaik_jce_full.jar:/app/iaik_ssl.jar:/app/iaik_eccelerate.jar:/app/iaik_eccelerate_ssl.jar:/app/iaikPkcs11Provider.jar:/app/iaikPkcs11Wrapper.jar:/home/pravi/ZebraTester/Container/xercesImpl-2.11.0.jar:/home/pravi/ZebraTester/Container/lib/*:."

# Make scripts executable
RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/run.sh

# Expose necessary ports
EXPOSE 7993

# Use entrypoint and CMD to handle arguments
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
CMD ["sh", "/app/run.sh"]
