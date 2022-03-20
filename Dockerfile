FROM tensorflow/tensorflow:2.7.1-gpu-jupyter

WORKDIR /nerf
RUN apt-get update
#RUN apt-get -y install \
#        build-essential \
#        checkinstall \
#        libx11-dev \
#        libxext-dev \
#        libpng-dev \
#        libjpeg-dev \
#        libfreetype6-dev \
#        libxml2-dev \
#        zlib1g-dev

RUN pip install --no-cache-dir \
    configargparse \
    imageio \
    imageio-ffmpeg \
    numpy \
