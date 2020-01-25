FROM debian:10.2

ARG VERSION

RUN apt-get update --quiet && \
    apt-get --assume-yes --quiet install curl libicu63 && \
    groupadd --gid=3579 ombi && \
    useradd --gid=3579 --home-dir=/opt/ombi --no-create-home --shell /bin/bash --uid 3579 ombi && \
    mkdir /data /opt/ombi && \
    curl --location --output /tmp/ombi.tar.gz --silent "https://github.com/tidusjar/Ombi/releases/download/v${VERSION}/linux.tar.gz" && \
    tar xzf /tmp/ombi.tar.gz --directory=/opt/ombi && \
    chown --recursive 3579:3579 /data /opt/ombi

USER 3579
VOLUME /data
WORKDIR /opt/ombi

EXPOSE 3579
ENTRYPOINT ["/opt/ombi/Ombi", "--host=http://*:3579", "--storage=/data"]
