FROM ubuntu:20.10

WORKDIR /app

COPY [ "switchRole.sh", "getParamStore.sh", "./var/" ]

ENV PATH /usr/local/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
        bash \
        curl \
        g++ \
        gcc \
        jq \
        make \
        python3.8 \
        python3-pip \
        zip \
    && rm -rf /var/cache/apk/*

RUN rm -f /usr/bin/python \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && ln -s /usr/bin/pip3 pip

RUN pip install --upgrade --no-cache-dir \
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
