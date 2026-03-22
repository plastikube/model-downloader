FROM docker.io/alpine:3

RUN set -exu \
  && apk add --no-cache \
    python3 \
    py3-pip \
    pipx \
    bash \
    curl \
    wget \
    jq \
    yq-go \
  && mkdir -pv /models \
  && chown 1000:1000 /models

WORKDIR /models

RUN set -exu \
  && addgroup \
    --gid 1000 \
    downloader \
  && adduser \
    --disabled-password \
    --gecos "" \
    --home /models \
    --ingroup downloader \
    --no-create-home \
    --uid 1000 \
    downloader

USER downloader

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "tail -f /dev/null"]
