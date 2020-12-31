
FROM alpine:3.12.3

ARG HELM_3_URL="https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L ${HELM_3_URL} | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd4

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]