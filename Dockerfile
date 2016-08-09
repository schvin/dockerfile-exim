FROM ubuntu:xenial
MAINTAINER George Lewis <schvin@schvin.net>

ENV REFRESHED_AT 2016-08-09
RUN apt-get update --fix-missing -y && apt-get upgrade -y 
RUN apt-get install -y exim4

RUN groupadd s-mail
RUN useradd s-mail -g s-mail -d /home/s-mail
RUN mkdir -p /home/s-mail/Mail
RUN ln -s /home/s-mail/Mail/inbox /var/mail/s-mail 
RUN chown -R s-mail:s-mail /home/s-mail

ADD exim4.conf /etc/exim4/

USER Debian-exim

EXPOSE 25

CMD ["-bdf", "-d"]
ENTRYPOINT ["/usr/sbin/exim"]
