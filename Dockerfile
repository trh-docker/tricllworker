FROM quay.io/spivegin/tlmbasedebian

RUN mkdir /opt/compose
ENV DOCKERCOMPOSE=1.23.2 \
    DOCKER=18.09.0 \
    SUDO_FORCE_REMOVE=yes
# RUN apt-get update -y && apt-get install -y sudo apt-transport-https ca-certificates curl gnupg2 software-properties-common &&\
#     curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&\
#     sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&\
#     apt-get update && apt-get install -y git docker-ce && \
#     apt-get purge -y sudo curl gnupg2 software-properties-common &&\
#     apt-get autoremove -y && apt-get autoclean -y &&\
#     rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
ADD ./debian-stretch/docker-ce-cli_0.0.0-20190105090409-a8f673f5fd-0~debian-stretch_amd64.deb /opt/tmp/docker-ce-cli.deb
ADD https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE}/docker-compose-Linux-x86_64 /opt/docker/docker-compose
RUN apt-get update && apt-get install -y libltdl7 git &&\
    dpkg -i /opt/tmp/docker-ce-cli.deb &&\
    chmod +x /opt/docker/docker-compose && ln -s /opt/docker/docker-compose /bin/docker-compose &&\
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*