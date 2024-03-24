FROM python:3.11.8-bullseye

RUN apt-get update && apt-get install -y \
    cmake \
    vim \
    p7zip-full \
    unzip \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN git clone https://github.com/nilmtk/nilmtk.git
COPY files/nilmtk/setup.py nilmtk/setup.py
RUN cd nilmtk && python setup.py develop
RUN git clone https://github.com/nilmtk/nilm_metadata.git && cd nilm_metadata && python setup.py develop
RUN pip install jupyterlab
RUN git clone https://github.com/nilmtk/nilmtk-contrib.git
COPY files/nilmtk-contrib/setup.py nilmtk-contrib/setup.py
COPY files/nilmtk-contrib/nilmtk_contrib/disaggregate/* nilmtk-contrib/nilmtk_contrib/disaggregate/
RUN cd nilmtk-contrib && python setup.py develop
RUN pip install cvxpy

RUN mkdir /root/.jupyter
COPY files/jupyter_lab_config.py /root/.jupyter/

WORKDIR /workspace

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]

