FROM openjdk:8-jre-alpine
RUN apk --update --no-cache add curl
COPY wait-for.sh /app/wait-for.sh
RUN chmod +x /app/wait-for.sh
