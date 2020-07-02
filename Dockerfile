FROM nvidia/cuda:10.2-base

ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y \
  build-essential \
  bzip2 \
  ca-certificates \
  curl \
  git \
  pv \
  wget

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  /bin/bash ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh && \
  /opt/conda/bin/conda clean -tipsy && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

ADD environment.yml /tmp/environment.yml
RUN conda update -n base -c defaults conda
RUN conda env create -f /tmp/environment.yml
