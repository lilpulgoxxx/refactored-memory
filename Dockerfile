FROM fedora:latest

RUN dnf update -y && \
    dnf install -y \
        git \
        wget \
        python3 \
        python3-pip \
        libglvnd-glx \
        libglvnd-opengl \
        libstdc++ \
        && dnf clean all

WORKDIR /app

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

COPY . .

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh && \
    chmod +x webui.sh

RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

EXPOSE 7860

CMD ["./webui.sh", "--listen", "--port", "7860"]
