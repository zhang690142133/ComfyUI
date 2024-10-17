FROM comfyui:0.1.1
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LANG=zh_CN.UTF-8
WORKDIR /opt/comfyUI
RUN pip install facexlib blend_modes insightface \
& pip install -r  custom_nodes/ComfyUI_InstantID/requirements.txt \
& pip install -r  custom_nodes/PuLID_ComfyUI/requirements.txt \
& pip install -r  custom_nodes/was-node-suite-comfyui/requirements.txt \
& pip install -r  custom_nodes/ComfyUI-Easy-Use/requirements.txt \
& pip install -r  custom_nodes/ComfyUI_LayerStyle/requirements.txt \
& pip install -r  custom_nodes/ComfyUI-Allor/requirements.txt \
& pip install -r  custom_nodes/ComfyUI-Impact-Pack/requirements.txt \
& pip install -r  custom_nodes/ComfyUI-Impact-Pack/impact_subpack/requirements.txt
EXPOSE 8188
CMD [ "python","main.py","--listen","localhost","--port","8188"]
