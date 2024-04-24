#!/bin/bash

docker run --rm -v ./scripts:/workspace/scripts -v ./dataset:/workspace/dataset -it nilmtk-py311 /bin/bash
