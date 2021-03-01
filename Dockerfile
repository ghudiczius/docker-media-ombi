FROM debian:10.8

ARG VERSION

RUN apt-get update --quiet && \
    apt-get --assume-yes --quiet install curl libicu63 && \
    groupadd --gid=1000 ombi && \
    useradd --gid=1000 --home-dir=/opt/ombi --no-create-home --shell /bin/bash --uid 1000 ombi && \
    mkdir /data /opt/ombi && \
    curl --location --output /tmp/ombi.tar.gz --silent "https://github.com/Ombi-app/Ombi/releases/download/v${VERSION}/linux-x64.tar.gz" && \
    tar xzf /tmp/ombi.tar.gz --directory=/opt/ombi && \
    chown --recursive 1000:1000 /data /opt/ombi && \
    rm /tmp/ombi.tar.gz

USER 1000
VOLUME /data
WORKDIR /opt/ombi

EXPOSE 5000
ENTRYPOINT ["/opt/ombi/Ombi", "--storage=/data"]
