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

RUN wget -O /bin/docker https://master.dockerproject.org/linux/x86_64/docker
RUN chmod 7 /bin/docker

RUN curl -s https://raw.githubusercontent.com/jhuckaby/Cronicle/master/bin/install.js | node
RUN pip install requests

RUN     mkdir /app
WORKDIR /app
COPY    entrypoint.sh /app/
#this will fix the hostnames for docker
COPY    adjust_hostname.py /app/

EXPOSE     3012

#$(which docker):/usr/bin/docker to call for docker host inside the docker
VOLUME     ["/opt/cronicle/data", "/opt/cronicle/logs", "/opt/cronicle/plugins"]




CMD        ["./entrypoint.sh"]
