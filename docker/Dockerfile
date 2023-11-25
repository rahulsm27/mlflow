FROM python:3.11-slim

ARG MLFLOW_ARTIFACT_STORE

ENV \
  PYTHONUNBUFFERED=1 \
  DEBIAN_FRONTEND=noninteractive \
  LC_ALL=C.UTF-8 \
  LANG=C.UTF-9 \
  PATH="${HOME}/venv/bin:${PATH}" \
  VIRTUAL_ENV="${HOME}/venv" \
  BUILD_POETRY_LOCK="${HOME}/poetry.lock.build"

RUN apt-get -qq update \
    && apt-get -qq -y install git \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qq -y clean


RUN mkdir -p "${MLFLOW_ARTIFACT_STORE}" /app

COPY ./docker/run-server.sh /
RUN chmod +x /run-server.sh

RUN HOME=/temp pip install --no-cache-dir poetry==1.5.1

COPY ./pyproject.toml ./*.lock /app/
WORKDIR /app



RUN python3.11 -m venv ${VIRTUAL_ENV} \
    && pip install --upgrade pip setuptools \
    && poetry install && cp poetry.lock ${BUILD_POETRY_LOCK} \
    && rm -rf ${HOME}/.cache/*

CMD ["/run-server.sh"]