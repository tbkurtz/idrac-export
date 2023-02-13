# ubuntu base container
FROM ubuntu:latest

# install packages
RUN apt-get -y update
RUN apt-get -y install ipmitool netcat htop nano

# run script on container start
CMD ["/app/idrac-export.sh"]