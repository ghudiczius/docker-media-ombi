FROM debian:13.0

ARG VERSION

# renovate: release=trixie depName=curl
ENV CURL_VERSION=7.88.1-10+deb12u12
# renovate: release=trixie depName=libicu76
ENV LIBICU_VERSION=76.1-4

RUN apt-get update --quiet && \
    apt-get --assume-yes --quiet install \
        curl="${CURL_VERSION}" \
        libicu72="${LIBICU_VERSION}" && \
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
ENTRYPOINT ["/opt/ombi/Ombi"]
CMD ["--storage=/data"]
