FROM debian:jessie

RUN apt-get update -qq \
    && apt-get -qqy --no-install-recommends install libfontconfig curl ca-certificates \
    && apt-get clean \
    && curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 > /usr/sbin/gosu \
    && chmod +x /usr/sbin/gosu \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

COPY ./run.sh /run.sh

ENTRYPOINT ["/run.sh"]

COPY ./grafana_latest_amd64.deb /tmp/grafana.deb

RUN dpkg -i /tmp/grafana.deb \
    && rm /tmp/grafana.deb
