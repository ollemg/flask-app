FROM python:3.9

RUN mkdir /app && pip install poetry

COPY pyproject.toml /app/pyproject.toml
COPY app/ /app

WORKDIR /app

RUN poetry install


EXPOSE 8080

# ENTRYPOINT [ "gunicorn", "app:create_app()", "-b", "0.0.0.0" ]