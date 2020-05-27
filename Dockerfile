FROM continuumio/miniconda3

RUN apt-get update && apt-get install -y \
  build-essential \
  pv

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml
