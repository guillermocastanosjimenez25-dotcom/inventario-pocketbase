FROM alpine:latest

ARG PB_VERSION=0.40.4

RUN apk add --no-cache unzip ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip

RUN mkdir -p /pb \
    && unzip /tmp/pb.zip -d /pb \
    && rm /tmp/pb.zip

WORKDIR /pb

COPY start.sh /pb/start.sh
RUN chmod +x /pb/start.sh

EXPOSE 10000

CMD ["/pb/start.sh"]
