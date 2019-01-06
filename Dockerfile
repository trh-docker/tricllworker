FROM quay.io/spivegin/tricllbase

ENV ONEPASS=i4jnk7hgysAqEuxHbpwt
RUN mkdir /opt/tricll
WORKDIR /opt/tricll

RUN apt update && apt install -y procps &&\
    apt-get autoremove && apt-get autoclean &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*