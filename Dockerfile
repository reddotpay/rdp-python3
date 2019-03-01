FROM alpine:3.8

WORKDIR /rdp-python3

ENV PYTHON_VERSION 3.6.6-r0

ENV PIP get-pip.py
ADD https://bootstrap.pypa.io/get-pip.py /tmp/

ENV ROOT_PATH=${PATH}:~/.local/bin

RUN apk add --update --no-cache \
  curl \
  make \
  zip \
  python3=$PYTHON_VERSION \
  python3-dev \
  jq \
  gcc \
  g++ \
  bash \
 && rm -rf /var/cache/apk/*

RUN cd /tmp/ && python3 /tmp/${PIP}
RUN pip install setuptools \
  awscli \
  autopep8 \
  virtualenv \
  pylint \
  coverage \
  sphinx \
  sphinx-rtd-theme \
  boto3 \
  s3pypi \
  pandas==0.23.4

RUN rm -rf /tmp
