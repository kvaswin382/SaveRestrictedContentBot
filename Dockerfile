# FROM python:3.9.2-slim-buster
# RUN mkdir /app && chmod 777 /app
# WORKDIR /app
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg
# COPY . .
# RUN pip3 install --no-cache-dir -r requirements.txt
# CMD ["bash","bash.sh"]
FROM python:3.9-slim-bullseye
RUN mkdir /app && chmod 777 /app
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
# Install required packages
RUN apt -qq update && apt -qq install -y --no-install-recommends \
    git \
    ffmpeg \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash", "bash.sh"]
