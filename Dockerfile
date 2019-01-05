FROM quay.io/spivegin/tlmbasedebian

RUN mkdir /opt/compose
ENV DOCKERCOMPOSE=1.23.2

ADD https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE}/docker-compose-Linux-x86_64 /opt/compose/docker-compose
RUN chmod +x /opt/compose/docker-compose
RUN apt-get update && apt-get install -y git docker-ce && \
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*