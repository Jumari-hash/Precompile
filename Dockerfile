FROM python:3.11-slim

ARG LLAMA_CPP_VERSION=0.2.90
ENV CMAKE_ARGS=-DLLAMA_NATIVE=OFF

RUN apt-get update && apt-get install -y     build-essential cmake git libopenblas-dev &&     pip install build &&     git clone --branch v https://github.com/abetlen/llama-cpp-python.git &&     cd llama-cpp-python &&     python -m build --wheel --outdir /dist &&     mv /dist /output &&     rm -rf /var/lib/apt/lists/* /llama-cpp-python

WORKDIR /output
