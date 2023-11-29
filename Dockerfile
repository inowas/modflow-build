FROM python:3.11-buster

MAINTAINER Ralf Junghanns <ralf.junghanns@gmail.com>

RUN buildDeps="unzip wget g++ gfortran make" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



# Install necessary packages
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Compile modflow-excecutables
RUN mkdir /modflow-bin
RUN make-program : --appdir /modflow-bin
WORKDIR /modflow-bin
RUN for file in ./*; do chmod +x $file 2>/dev/null; done
RUN for for file in ./*; do scp $file /usr/local/bin/; done
