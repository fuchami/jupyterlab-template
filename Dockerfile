FROM ubuntu:18.04

# language conf
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV PYTHONIOENCODING "utf-8"
ENV PYTHONUNBUFFERED 1

# update ubuntu
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

# Install dependences
RUN apt-get update --fix-missing && \
  apt-get install -y \
    wget \
    build-essential \
    gcc \
    zlib1g-dev \
    git \
    vim \
    curl \
    make \
    xdg-utils \
    cmake

# remove cache files
RUN apt-get autoremove -y && apt-get clean && \
  rm -rf /usr/local/src/*

# install python
RUN apt-get install -y python3 python3-pip 

# update pip
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel

# install additional packages
COPY requirements.txt .
RUN pip install -U pip &&\
  pip install -r requirements.txt &&\
  # remove cache files
  rm -rf ~/.cache/pip

# install node.js for jupyterlab extension
RUN curl -sL https://deb.nodesource.com/setup_12.x |bash -
RUN apt install -y nodejs

# install kite
# RUN bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)" 
RUN pip install jupyter-kite

# install jupyterlab extension
RUN jupyter labextension install \
    @lckr/jupyterlab_variableinspector \
    @jupyterlab/git \
    @jupyterlab/toc \
    @hokyjack/jupyterlab-monokai-plus \
    jupyterlab-flake8 \
    jupyterlab-vimrc \
    @axlair/jupyterlab_vim

RUN pip install jupyterlab-git \
    yapf \
    jupyterlab_code_formatter \
    flake8 \
  && pip install --upgrade jupyterlab-git \
    jupyterlab_code_formatter \
    flake8

# install code formatter
RUN jupyter labextension install @ryantam626/jupyterlab_code_formatter \
  && jupyter serverextension enable --py jupyterlab_code_formatter \
  && pip install --upgrade jupyterlab_code_formatter

WORKDIR /home/work/