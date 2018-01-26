FROM alpine:3.2

ENV ETCD_VERSION=v3.2.15

RUN apk add --update ca-certificates openssl tar &&\
 wget https://github.com/coreos/etcd/releases/download/$(ETCD_VERSION)/etcd-$(ETCD_VERSION)-linux-amd64.tar.gz &&\
 tar xzvf etcd-$(ETCD_VERSION)-linux-amd64.tar.gz &&\
 mv etcd-$(ETCD_VERSION)-linux-amd64/etcd* /bin/ &&\
 apk del --purge tar openssl &&\
 rm -Rf etcd-$(ETCD_VERSION)-linux-amd64* /var/cache/apk/*

VOLUME /data
EXPOSE 2379 2380
ADD run.sh /bin/run.sh
ENTRYPOINT ["/bin/run.sh"]
