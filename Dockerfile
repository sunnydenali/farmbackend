# Reference: https://github.com/mikeckennedy/docker-build-fastapi-app-april-2021/blob/main/Dockerfile

# Set the base image for subsequent instructions
FROM ubuntu:latest

RUN apt update && apt upgrade -y

# Ubuntu 20.04 comes with Python3 pre-installed
RUN apt install -y -q build-essential python3-pip python3-dev
RUN pip3 install -U pip setuptools wheel
RUN pip3 install gunicorn uvloop httptools

## Create a separate checkpoint for requirements.txt even though it is part of the source code being copied in the following checkpoint ( copy service/ /app )
## Avoid install dependencies unless requirements.txt is updated.
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

# Copy source code to docker container destination directory
COPY . /app/

# Docker reads from /proc/1/fd/1 and /proc/1/fd/2 (not from /dev/stdout or /dev/stderr)
ENV ACCESS_LOG=${ACCESS_LOG:-/proc/1/fd/1}
ENV ERROR_LOG=${ERROR_LOG:-/proc/1/fd/2}

ENTRYPOINT /usr/local/bin/gunicorn \
  -b 0.0.0.0:80 \
  -w 4 \
  -k uvicorn.workers.UvicornWorker main:app \
  --name farmbackend_svc \
  --chdir /app \
  --access-logfile "$ACCESS_LOG" \
  --error-logfile "$ERROR_LOG"