#!/bin/bash
rm -rf /opt/conda/bin/ffmpeg
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev \
    freeglut3-dev libosmesa6-dev libyaml-dev git wget libglib2.0-0 software-properties-common ffmpeg


cd /workspace/
pip install -r scripts/requirements.txt
pip install -v -e third-party/ViTPose

pip install https://github.com/Dao-AILab/causal-conv1d/releases/download/v1.5.0/causal_conv1d-1.5.0+cu124torch2.1cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
pip install https://github.com/state-spaces/mamba/releases/download/v2.2.4/mamba_ssm-2.2.4+cu11torch2.1cxx11abiTRUE-cp310-cp310-linux_x86_64.whl

cd /workspace/downloads/VMamba/kernels/selective_scan
pip install .

cd /workspace/

pip install --no-deps pyopengl==3.1.4 networkx==3.4.2