FROM adoptopenjdk/openjdk8:alpine-jre
RUN apk --update --no-cache add curl
COPY wait-for.sh /app/wait-for.sh
RUN chmod +x /app/wait-for.sh
