FROM alpine:latest

RUN apk add --update python python-dev py-pip build-base libffi-dev openssl-dev openssh linux-headers git && \
    pip install ansible markupsafe boto && git clone https://github.com/jlund/streisand.git

VOLUME /root/.ssh
VOLUME /streisand/generated-docs

WORKDIR /streisand

CMD ["/bin/sh", "/streisand/streisand"]
