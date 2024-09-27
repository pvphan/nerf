FROM tensorflow/tensorflow:2.7.1-gpu-jupyter

WORKDIR /nerf
RUN apt-get update

RUN pip install --no-cache-dir \
    configargparse==1.5.3 \
    imageio==2.16.1 \
    imageio-ffmpeg==0.4.5 \
    numpy==1.22.1 \
