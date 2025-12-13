FROM ubuntu:latest
WORKDIR /app
RUN apt update
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y python3-venv
RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip3 install flask --break-system-packages
RUN pip3 install psutil --break-system-packages
RUN pip3 install flask-cors --break-system-packages
COPY app.py /app
EXPOSE 5000
CMD ["python3","app.py"]

