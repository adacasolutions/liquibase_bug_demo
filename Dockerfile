FROM openjdk:8u232-jre-slim

WORKDIR /opt

COPY opt/* ./

RUN chmod u+x showcase.sh

ENTRYPOINT ./showcase.sh
