FROM ubuntu:latest

# install packages
RUN apt-get -y update
RUN apt-get -y install ipmitool netcat

#CMD ["/bin/bash","/app/idrac-export.sh"]
ENTRYPOINT ["/bin/bash", "/app/idrac-export.sh"]