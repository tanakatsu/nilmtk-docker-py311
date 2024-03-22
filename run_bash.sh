#!/bin/bash

# docker run --platform=linux/amd64 --rm -v ./scripts:/workspace -v ./dataset:/workspace/dataset -it nilmtk-py311 /bin/bash
docker run --platform=linux/amd64 --rm -v ./scripts:/workspace/scripts -v ./dataset:/workspace/dataset -it nilmtk-py311 /bin/bash
