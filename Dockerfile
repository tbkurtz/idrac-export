FROM ubuntu:latest

# install packages
RUN apt-get -y update
RUN apt-get -y install ipmitool netcat htop nano

RUN touch "/lib/systemd/system/idrac-export.service"
RUN chmod 644 "/lib/systemd/system/idrac-export.service"
RUN chown root:root "/lib/systemd/system/idrac-export.service"

RUN echo '[Unit]'
RUN echo 'Description=iDrac Export Script'
RUN echo 'After=network.target'
RUN echo '[Service]'
RUN echo 'Type=simple'
RUN echo 'ExecStart=/bin/bash /app/idrac-export.sh'
RUN echo '[Install]'
RUN echo 'WantedBy=multi-user.target'

RUN systemctl daemon-reload
RUN systemctl enable idrac-export.service

#CMD ["/bin/bash","/app/idrac-export.sh"]
#ENTRYPOINT ["/bin/bash", "/app/idrac-export.sh"]