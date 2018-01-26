# Dockerfile for etcd

```
docker run -d \
 --name etcd \
 -v /data/etcd/:/data \
 -p 2379:2379 \
 -p 2380:2380 \
 nevis/etcd:v3
```
