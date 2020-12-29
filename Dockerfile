FROM shukriadams/trusty-daemon:0.0.5

RUN apt-get install duplicity -y \
    && apt-get install python-boto -y \
    && apt-get install lftp -y \
    && apt-get install zip -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install s3cmd -y --no-install-recommends 
