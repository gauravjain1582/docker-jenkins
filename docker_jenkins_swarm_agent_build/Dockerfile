FROM docker:17.12.1-ce

RUN apk --update add openjdk8-jre git \
    && wget -O swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.3/swarm-client-3.3.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

CMD ["/entrypoint.sh"]
