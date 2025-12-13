FROM ubuntu:latest
WORKDIR /app
RUN apt update
RUN apt install -y python3
RUN apt install -y python3-pip
RUN pip3 install -y psutil
RUN apt install -y python3-venv
RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip3 install flask --break-system-packages
COPY app.py /app
EXPOSE 5000
CMD ["python3","app.py"]

