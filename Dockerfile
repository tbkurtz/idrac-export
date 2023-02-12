FROM ubuntu:latest

# install packages
RUN apt-get -y update
RUN apt-get -y install ipmitool netcat htop nano

RUN touch "/lib/systemd/system/idrac-export.service"
RUN chmod 644 "/lib/systemd/system/idrac-export.service"
RUN chown root:root "/lib/systemd/system/idrac-export.service"

RUN echo '[Unit]' >> "/lib/systemd/system/idrac-export.service"
RUN echo 'Description=iDrac Export Script' >> "/lib/systemd/system/idrac-export.service"
RUN echo 'After=network.target' >> "/lib/systemd/system/idrac-export.service"
RUN echo '[Service]' >> "/lib/systemd/system/idrac-export.service"
RUN echo 'Type=simple' >> "/lib/systemd/system/idrac-export.service"
RUN echo 'ExecStart=/bin/bash /app/idrac-export.sh' >> "/lib/systemd/system/idrac-export.service"
RUN echo '[Install]' >> "/lib/systemd/system/idrac-export.service"
RUN echo 'WantedBy=multi-user.target' >> "/lib/systemd/system/idrac-export.service"

#CMD ["/bin/bash","/app/idrac-export.sh"]
#ENTRYPOINT ["/bin/bash", "/app/idrac-export.sh"]