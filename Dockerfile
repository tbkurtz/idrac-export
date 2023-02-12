FROM ubuntu:latest

# install ipmitool
#RUN apk update
RUN apt-get -y update
RUN apt-get -y install ipmitool

# copy service file
# COPY idrac-export.service /etc/systemd/system/idrac-export.service

# Enable the service so it starts at boot
#RUN systemctl enable idrac-export.service

CMD ["/bin/bash","/app/idrac-export.sh"]