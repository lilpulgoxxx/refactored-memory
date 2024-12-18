FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        wget \
        libgl1 \
        libglib2.0-0 \
        && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /app

WORKDIR /app

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh && \
    chmod +x webui.sh

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 7860

CMD ["./webui.sh", "--listen", "--port", "7860"]
