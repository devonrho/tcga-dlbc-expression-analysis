#!/usr/bin/env bash

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

docker run -it --rm \
  -p 8888:8888 \
  -v "$PROJECT_DIR":/home/jovyan \
  tcga-dsci \
  jupyter lab --ip=0.0.0.0 --no-browser
