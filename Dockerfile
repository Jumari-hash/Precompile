FROM python:3.10-slim

ENV CMAKE_ARGS=-DLLAMA_NATIVE=OFF

RUN apt-get update && apt-get install -y     build-essential cmake git libopenblas-dev  && pip install --upgrade pip build  && git clone --branch v0.2.90 https://github.com/abetlen/llama-cpp-python.git  && cd llama-cpp-python  && python -m build --wheel --outdir /dist  && mv /dist /output  && rm -rf /var/lib/apt/lists/* /llama-cpp-python

WORKDIR /output
