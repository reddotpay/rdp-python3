FROM alpine:3.11.6

WORKDIR /app

COPY [ "switchRole.sh", "getParamStore.sh", "./var/" ]

ENV PYTHON_VERSION 3.8.2-r0

ENV PATH /usr/local/bin:$PATH

RUN apk add --update --no-cache \
        autoconf \
        automake \
        bash \
        curl \
        g++ \
        gcc \
        jq \
        libtool \
        make \
        python3-dev \
        python3=$PYTHON_VERSION \
        zip \
    && rm -rf /var/cache/apk/*

RUN cd /usr/local/bin \
    && rm -f /usr/bin/python \
    && ln -s /usr/bin/python3 python

RUN pip3 install --upgrade --no-cache-dir \
    pip \
    autopep8 \
    awscli \
    boto3 \
    coverage \
    jq \
    pandas \
    pylint \
    requests \
    s3pypi \
    setuptools \
    sphinx \
    sphinx-rtd-theme
