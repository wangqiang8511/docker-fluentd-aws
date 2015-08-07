FROM ubuntu:14.04

MAINTAINER Razer "razer bigdata team"

# Install prerequisites.
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y -q libcurl4-openssl-dev make && \
    apt-get clean

# Install Fluentd.
RUN /usr/bin/curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh
RUN /usr/sbin/td-agent-gem install fluent-plugin-s3
RUN /usr/sbin/td-agent-gem install fluent-plugin-kinesis 
COPY td-agent.conf /etc/td-agent/td-agent.conf
ADD start_fluentd.sh /opt/start_fluentd.sh
RUN chmod +x /opt/start_fluentd.sh

EXPOSE 24224

# default command
ENTRYPOINT ["/opt/start_fluentd.sh"]
