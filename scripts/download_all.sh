#!/bin/bash

git submodule update --init --recursive
pip3 install gdown

gdown https://drive.google.com/uc?id=1mv7CUAnm73oKsEEG1xE3xH2C_oqcFSzT
tar --warning=no-unknown-keyword --exclude=".*" -xvf hamer_demo_data.tar.gz
rm -rf hamer_demo_data.tar.gz
# _DATA/
# _DATA/vitpose_ckpts/
# _DATA/vitpose_ckpts/vitpose+_huge/
# _DATA/vitpose_ckpts/vitpose+_huge/wholebody.pth
# _DATA/data/
# _DATA/data/mano_mean_params.npz
# _DATA/data/mano/
# _DATA/hamer_ckpts/
# _DATA/hamer_ckpts/model_config.yaml
# _DATA/hamer_ckpts/dataset_config.yaml
# _DATA/hamer_ckpts/checkpoints/
# _DATA/hamer_ckpts/checkpoints/hamer.ckpt

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
fi

if [ ! -d "downloads/mano_v1_2" ]; then
  python3 scripts/download_mano.py
  cd downloads/
  unzip mano_v1_2.zip
  cd ..
fi
mkdir -p _DATA/data/mano
mv downloads/mano_v1_2/models/* _DATA/data/mano/


