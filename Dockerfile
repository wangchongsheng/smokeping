# Description smokeping 2.7.3 base alpine:latest
FROM alpine:latest
MAINTAINER "WangChongsheng <wang_chongsheng@163.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk update && \
	apk add --no-cache \
	apache2 \
	apache2-utils \
	curl \
	smokeping \
	ssmtp \
	sudo \
	ttf-dejavu  \    
	supervisor \
        procps && \
        ln -s /usr/share/webapps/smokeping/ /var/www/localhost/smokeping && \
	chmod 777 /var/lib/smokeping/.simg && \
	chmod u+s /usr/sbin/fping && \
	echo "ALL=(ALL) NOPASSWD: /usr/bin/traceroute" >> /etc/sudoers.d/traceroute  && \
	sed -i 's#src="/cropper/#/src="cropper/#' /etc/smokeping/basepage.html && \
	sed -i 's#$FindBin::RealBin/../etc/smokeping/config#/etc/smokeping/config#' /usr/bin/smokeping && \
	rm -f /etc/apache2/httpd.conf && \
	mkdir -p /etc/supervisor.d
	
ADD httpd.conf /etc/apache2/
ADD smokeping.conf /etc/apache2/conf.d/
ADD apache.ini /etc/supervisor.d/
ADD smokeping.ini /etc/supervisor.d/
ADD apachectl /usr/sbin/

ENTRYPOINT ["/usr/bin/supervisord","--nodaemon"]
