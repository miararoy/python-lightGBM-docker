FROM python:3.6.5-slim-stretch

# install all necessary modules
RUN ["pip", "install", "-r", "requirements.txt"]

# install C tools and git
RUN apt-get -y update && apt-get -y install build-essential git gcc cmake 

# build LightGBM from source
RUN git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4

ENTRYPOINT [ "python" ]