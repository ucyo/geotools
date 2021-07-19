FROM ubuntu:20.04

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/home/python/.poetry/bin:/home/python/.local/bin:$PATH" PIP_NO_CACHE_DIR="false"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 python3-pip python3-venv python-is-python3 curl ca-certificates wait-for-it \
    libpq-dev python3-dev build-essential gettext-base git \
    libproj-dev libgeos-dev proj-bin proj-data libgdal-dev=3.0.4+dfsg-1build3 && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 python && \
    useradd  --uid 1000 --gid python --shell /bin/bash --create-home python

USER 1000
WORKDIR /home/python

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/527882380fd7aecd7c34922a7bc888226a5737ff/install-poetry.py | python
RUN poetry config virtualenvs.create false

RUN mkdir /home/python/code
WORKDIR /home/python/code

COPY --chown=python:python pyproject.toml poetry.lock ./

RUN poetry install --no-interaction --no-root --no-ansi

ENV PATH="/home/python/.local/share/pypoetry/venv/bin:$PATH"

CMD ["python"]
