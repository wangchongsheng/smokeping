# smokeping
Smokeping2.7.3 is based on Docker alpine

Default monitoring of telecom unicom mobile education network and overseas networks
#### Docker Run
```
docker run --name smk -it -d  --net=host --restart=always smokeping:latest
```
#### Browser access
http://your_ip:2002/smokeping
