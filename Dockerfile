FROM alpine:latest

RUN apk update && apk --no-cache add python python-dev py2-pip build-base libffi-dev openssl-dev openssh linux-headers git && pip install ansible markupsafe boto3 && git clone https://github.com/jlund/streisand.git

VOLUME /root/.ssh
VOLUME /streisand/generated-docs

WORKDIR /streisand

CMD ["/bin/sh", "/streisand/streisand"]
