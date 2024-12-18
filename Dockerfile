# Use the Fedora base image
FROM fedora:38

# Install dependencies
RUN dnf install -y \
    wget \
    git \
    python3 \
    gperftools-libs \
    libglvnd-glx \
    && dnf clean all

# Install Python 3.11
RUN dnf install -y python3.11 && dnf clean all

# Set the environment variable for Python command
ENV python_cmd=python3.11

# Clone the Stable Diffusion web UI repository
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /opt/stable-diffusion-webui

# Set the working directory
WORKDIR /opt/stable-diffusion-webui

# Expose the port for the web UI
EXPOSE 7860

# Run the web UI
CMD ["bash", "webui.sh"]
