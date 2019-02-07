# Dockerfile combining [openjdk:8-jre-alpine](https://hub.docker.com/_/openjdk) and [wait-for.sh](https://github.com/eficode/wait-for)

Sometimes your dockered java application needs an external resource in order to start up properly.
For example: You use [docker-compose](https://docs.docker.com/compose/) for wiring your spring boot application and a database. Your application does not start up properly without the database. But the database startup is much slower than the java application start process.

What to do?

Your docker container needs to wait for the database and then start the java application.  


# Preconditions for executing build.sh

- wget installed
- docker installed
- docker runs without sudo https://docs.docker.com/install/linux/linux-postinstall/


# How to use

First build and install the image with a tag of your choice, e.g.:

    ./build.sh -t joergpfruender/openjdk8-with-wait-for
    
    
Now you can extend your application docker file from your new image, e.g.


    FROM joergpfruender/openjdk8-with-wait-for
    COPY myapplication.jar /app/application.jar
    RUN echo "waiting for 20 seconds for mysql:3306 to be accessable before starting application"
    CMD '/app/wait-for.sh', '-t', '20', 'mysql:3306', '--', 'java', '-jar', '/app/application.jar'
      
[More documentation about wait-for](https://github.com/eficode/wait-for/)
    
# License

My few lines of code come with the [apache 2.0 license](LICENSE).
Please mind that OpenJDK, wait-for and docker come with their own licenses:

- https://openjdk.java.net/legal/
- https://github.com/eficode/wait-for/blob/master/LICENSE
- https://www.docker.com/legal/components-licenses