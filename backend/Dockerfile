FROM python:latest

RUN apt-get update && apt-get install vim -y
ENV VIRTUAL_ENV "/env"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN pip install -r requirements.txt

EXPOSE 5000:5000

COPY main.py controller.py config.py models.py /opt/app/
CMD [ "python", "main.py" ]