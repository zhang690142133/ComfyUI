FROM zhibeiyou-docker.pkg.coding.net/gaoweiyoutongyiziyuanguanli/gwdocker/comfyui:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LANG=zh_CN.UTF-8
COPY . /opt/ComfyUI
WORKDIR /opt/ComfyUI
EXPOSE 8188
CMD [ "python","main.py","--listen","localhost","--port","8188"]
