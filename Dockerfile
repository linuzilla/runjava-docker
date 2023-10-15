FROM alpine:3.18.4
MAINTAINER Mac Liu <linuzilla@gmail.com>

RUN apk update && apk upgrade && \
	apk add tmux openssh openjdk17-jdk mariadb-client && \
	rm -fr /var/cache/apk/*
# ADD jdk-17.0.8.tar.gz /usr/local/

COPY files/init.sh /
COPY files/run.sh /usr/local/bin
COPY files/sshd_config /etc/ssh

RUN chmod 755 /init.sh /usr/local/bin/run.sh

VOLUME [ "/workspace" ]

ENV jarName jarName

EXPOSE 8080
EXPOSE 22

CMD [ "/init.sh" ]
