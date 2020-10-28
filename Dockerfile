FROM python:3.8-buster

MAINTAINER Ralf Junghanns <ralf.junghanns@gmail.com>

RUN buildDeps="unzip wget g++ gfortran make" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



# Install necessary packages
COPY ./requirements.txt /requirements.txt
RUN pip install -Iv numpy>=1.19.2
RUN pip install -r /requirements.txt

# Compile modflow-excecutables
COPY ./pyMake-scripts /scripts
WORKDIR /scripts
RUN for file in ./*; do python $file 2>/dev/null; done
RUN mkdir /modflow-bin
RUN rm -r ./temp/*/
RUN ls -la ./temp
RUN cp ./temp/* /modflow-bin
RUN mv ./temp/* /usr/local/bin
