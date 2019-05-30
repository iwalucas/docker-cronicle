FROM node:alpine

RUN apk add --no-cache git curl wget perl bash perl-pathtools tar \
             procps tini g++ 
			 
RUN apk add --no-cache python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
			 
RUN curl -s https://raw.githubusercontent.com/jhuckaby/Cronicle/master/bin/install.js | node
RUN pip install requests

RUN     mkdir /app
WORKDIR /app
COPY    entrypoint.sh /app/

EXPOSE     3012

VOLUME     ["/opt/cronicle/data", "/opt/cronicle/logs", "/opt/cronicle/plugins"]


CMD        ["./entrypoint.sh"]
