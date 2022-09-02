# Use nvidia/cuda image
FROM nvidia/cuda:11.2.1-base-ubuntu20.04


ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*


RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version

RUN mkdir app
WORKDIR app
RUN apt update
RUN apt install -y git




# RUN apt-get install git-core
COPY ./environment.yaml .
COPY ./ldm .
COPY ./configs .
COPY ./setup.py .
RUN conda env create -f ./environment.yaml

RUN conda activate ldm
RUN conda install -y -c conda-forge cudatoolkit-dev==11.3.1 cudatoolkit==11.3.1 cudnn==8.2.1.32
RUN pip install transformers==4.19.2 scann kornia==0.6.4 torchmetrics==0.6.0
RUN pip install git+https://github.com/arogozhnikov/einops.git
RUN pip install https://github.com/learning-at-home/hivemind.git
RUN pip install opencv-python matplotlib

COPY ./scripts .
RUN chmod +x ./scripts/*