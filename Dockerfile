# FROM ubuntu
#
# ENV DEBIAN_FRONTEND noninteractive
#
# MAINTAINER Sam Adams
#
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list
#
# RUN apt-get update
#
# RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
#
# RUN apt-get install -y libblas3 liblapack3 gcc gfortran libc6
# RUN apt-get build-dep -y python-imaging
# RUN apt-get install -y libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev
# RUN apt-get install -y python python-dev python-distribute python-pip
# RUN pip install -r /app/requirements.txt
#
# ADD ./app /app
#
# EXPOSE 80
#
# WORKDIR /app
#
# CMD ["python", "/app/main.py"]

FROM resin/raspberrypi-python

# Enable systemd
ENV INITSYSTEM on

# Install Python.
RUN apt-get update \
	&& apt-get install -y python \
	# Remove package lists to free up space
	&& rm -rf /var/lib/apt/lists/*

# copy current directory into /app
COPY . /app

# run python script when container lands on device
CMD ["python", "/app/hello.py"]
