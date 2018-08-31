FROM anapsix/alpine-java:8u181b13_jdk-dcevm

RUN apk add --update curl make zip python=2.7.15-r2 jq
RUN apk add --update gcc g++
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN curl -O https://bootstrap.pypa.io/get-pip.py; python get-pip.py --user; echo "export PATH=\"\$PATH:/root/.local/bin\"" >> /etc/profile; source /etc/profile; pip install awscli --upgrade --user
RUN source /etc/profile; pip install autopep8; pip install pylint; pip install coverage; pip install sphinx; pip install sphinx-rtd-theme
RUN source /etc/profile; pip install pyspark; curl -O https://s3.amazonaws.com/aws-glue-jes-prod-us-east-1-assets/etl/python/PyGlue.zip; unzip PyGlue.zip; cp -R awsglue /usr/lib/python2.7/site-packages/awsglue