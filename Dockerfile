FROM debian:8.7

MAINTAINER gpkfr <gpkfr@imelbox.com>

ENV DEBIAN_FRONTEND noninteractive

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]

COPY script/get-pip.py /root/

WORKDIR /root

RUN apt-get update && \
    apt-get install -y python && \
    rm -rf /var/lib/apt/lists/* /tmp/* /usr/share/doc/* && \
    python get-pip.py &&  \
    pip install rethinkdb && \
    rm /root/get-pip.py && \
    mkdir -p /backup

WORKDIR /backup
