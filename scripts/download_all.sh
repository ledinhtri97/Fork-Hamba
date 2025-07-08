#!/bin/bash

root_dir=$(pwd)
git submodule update --init --recursive
pip3 install gdown

if [ ! -d "_DATA/vitpose_ckpts/vitpose+_huge/" ]; then
  gdown https://drive.google.com/uc?id=1mv7CUAnm73oKsEEG1xE3xH2C_oqcFSzT
  tar --warning=no-unknown-keyword --exclude=".*" -xvf hamer_demo_data.tar.gz
  rm -rf hamer_demo_data.tar.gz
fi

cd $root_dir
mkdir -p downloads

if [ ! -d "downloads/VMamba" ]; then
  cd downloads
  git clone https://github.com/MzeroMiko/VMamba.git
  cd ..
fi

if [ ! -d "downloads/hamba" ]; then
  cd downloads/
  gdown https://drive.google.com/uc?id=1JRPC11YfQym8t_EZkhsroglvGHrGPbU-
  unzip hamba.zip
  cd ..
fi

if [ ! -d "downloads/mano_v1_2" ]; then
  python3 scripts/download_mano.py
  cd downloads/
  unzip mano_v1_2.zip
  cd ..
fi

cd $root_dir
mkdir -p _DATA/data/mano
mv downloads/mano_v1_2/models/* _DATA/data/mano/


