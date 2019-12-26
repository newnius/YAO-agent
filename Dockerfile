FROM tensorflow/tensorflow:1.14.0-gpu

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apt update && \
	apt install -y python3 python3-pip && \
	rm -rf /var/lib/apt/lists/*

RUN apt update && \
	apt install -y git vim httpie && \
	rm -rf /var/lib/apt/lists/*

RUN pip3 install docker kafka psutil

ADD bootstrap.sh /etc/bootstrap.sh

ADD monitor.py /root/monitor.py

ADD executor.py /root/executor.py

ADD main.py /root/main.py

WORKDIR /root

CMD ["/etc/bootstrap.sh"]