FROM debian:latest

RUN apt-get update

RUN apt-get install cron curl -y
# Add crontab file in the cron directory
ADD crontab /etc/cron.d/ipcron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/ipcron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
RUN /usr/bin/crontab /etc/cron.d/ipcron
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log