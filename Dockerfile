FROM continuumio/miniconda3

RUN apt-get update && apt-get install -y \
  build-essential \
  g++ \
  git \
  less \
  libav-tools \
  libffi-dev \
  libgeos++ \
  libopenblas-dev \
  libopencv-dev \
  libsamplerate0 \
  libsamplerate0-dev \
  libsndfile-dev \
  libsndfile1 \
  libssl-dev \
  module-init-tools \
  portaudio19-dev \
  python-opencv \
  sox \
  subversion \
  tmux \
  unzip \
  wget

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml
