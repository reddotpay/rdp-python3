FROM reddotpay/docker-alpine-java:8u181b13_jdk-dcevm

COPY . /rdp-pyspark
WORKDIR /rdp-pyspark

ENV PYTHON_VERSION 2.7.15-r2
ENV PYSPARK_VERSION 2.2.1

ENV PIP get-pip.py
ADD https://bootstrap.pypa.io/get-pip.py /tmp/

ENV PYGLUE PyGlue.zip
ADD https://s3.amazonaws.com/aws-glue-jes-prod-us-east-1-assets/etl/python/PyGlue.zip /tmp/

ENV ROOT_PATH=${PATH}:~/.local/bin

RUN apk add --update --no-cache \
  curl \
  make \
  zip \
  python=$PYTHON_VERSION \
  python-dev \
  jq \
  gcc \
  g++ \
  bash \
 && rm -rf /var/cache/apk/*

RUN cd /tmp/ && python /tmp/${PIP}
RUN pip install --upgrade setuptools --user python \
  awscli \
  autopep8 \
  virtualenv \
  pylint \
  coverage \
  sphinx \
  sphinx-rtd-theme \
  boto3 \
  py4j==0.10.4 \
  s3pypi \
  pyspark==${PYSPARK_VERSION} \
  pandas==0.23.4

RUN cd /opt/ && unzip /tmp/${PYGLUE} && cp -R awsglue /usr/lib/python${PYTHON_VERSION}/site-packages/awsglue
RUN rm -rf /tmp
