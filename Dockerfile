FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV DEBIAN_FRONTEND = noninteractive
RUN apt update && apt install -y git ffmpeg libsm6 libxext6
RUN pip install mediapipe svglib fvcore gdown git+https://github.com/mlfoundations/open_clip.git@bb6e834e9c70d9c27d0dc3ecedeebeaeb1ffad6b \
    git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1 git+https://github.com/TencentARC/GFPGAN.git@8d2447a2d918f8eba5a4a01463fd48e45126a379
RUN mkdir /stable-diffusion-webui
COPY stable-diffusion-webui /stable-diffusion-webui
WORKDIR /stable-diffusion-webui
RUN pip install -r requirements_versions.txt
EXPOSE 7860
CMD python webui.py --listen --no-gradio-queue