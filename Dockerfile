FROM htakeuchi/docker-asciidoctor-jp

WORKDIR /root

RUN apk -v --update add \
    python3 \
    git && \
    pip3 install --upgrade \
    pip \
    setuptools && \
    pip3 install --upgrade \
    awscli \
    s3cmd \
    python-magic && \
    apk --purge del py-pip && \
    rm /var/cache/apk/*

WORKDIR /documents