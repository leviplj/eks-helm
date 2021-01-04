FROM alpine:3.12.3

ARG HELM_3_URL="https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz"
ARG KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release/v1.18.12/bin/linux/amd64/kubectl"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L ${HELM_3_URL} | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd4

RUN curl -L -o /usr/bin/kubectl ${KUBECTL_URL} \
    chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
