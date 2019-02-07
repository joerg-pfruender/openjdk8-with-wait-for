# Dockerfile combining [openjdk:8-jre-alpine](https://hub.docker.com/_/openjdk) and [wait-for.sh](https://github.com/eficode/wait-for)


# Preconditions for executing build.sh

- wget installed
- docker installed
- docker runs without sudo https://docs.docker.com/install/linux/linux-postinstall/

# License

My few lines of code com with the [apache 2.0 license](LICENSE).
Please mind that OpenJDK, wait-for and docker come with their own licenses:

- https://openjdk.java.net/legal/
- https://github.com/eficode/wait-for/blob/master/LICENSE
- https://www.docker.com/legal/components-licenses