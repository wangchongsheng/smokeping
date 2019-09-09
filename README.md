# smokeping
Smokeping2.7.3 is based on Docker alpine

Default monitoring of telecom unicom mobile education network and overseas networks
# 运行方式
```
docker run \
--name smk \
-it -d  \
--net=host \
smokeping:latest
```
