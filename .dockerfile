FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-pip
RUN curl -fsSL https://miktex.org/download/key | sudo tee /usr/share/keyrings/miktex-keyring.asc > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/miktex-keyring.asc] https://miktex.org/download/ubuntu jammy universe" | sudo tee /etc/apt/sources.list.d/miktex.list
RUN apt-get install -y miktex
RUN miktexsetup --shared=yes finish
RUN initexmf --set-config-value [MPM]AutoInstall=1
RUN python3 -m pip install --upgrade pip
RUN pip3 install pdflatex
RUN python3 convert.py
