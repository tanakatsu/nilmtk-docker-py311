#!/bin/bash

# Set password
# docker run -e PASSWORD=nilm --rm -p 8888:8888 -v ./notebooks:/workspace/notebooks -v ./dataset:/workspace/dataset -it nilmtk-py311

docker run --rm -p 8888:8888 -v ./notebooks:/workspace/notebooks -v ./dataset:/workspace/dataset -it nilmtk-py311
