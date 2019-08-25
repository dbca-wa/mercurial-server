# Dockerfile to build mercurial server image
# Prepare the base environment.
FROM ubuntu:18.04
MAINTAINER asi@dbca.wa.gov.au
ENV DEBIAN_FRONTEND=noninteractive

#install required utilities
RUN apt-get update -y && apt-get install -y vim curl logrotate

#install mercurial server
RUN apt-get update -y && apt-get install -y mercurial-server

#copy logrotate configuration file

COPY ./logrotate.d/* /etc/logrotate.d

CMD ["sh","-c","su -c /usr/share/mercurial-server/refresh-auth hg;service ssh start;bash"]
