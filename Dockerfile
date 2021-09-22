FROM python:3.9

COPY poetry.lock pyproject.toml /
COPY app/ /app

WORKDIR /

RUN useradd flask -d /home/flask && \
    mkdir /home/flask && \
    chown -R flask:flask /app /home/flask && \
    chmod 770 /app /home/flask && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

ENV FLASK_ENV=production
ENV FLASK_RUN=app/app.py


EXPOSE 8000

ENTRYPOINT [ "gunicorn", "app:app", "-b", "0.0.0.0" ]