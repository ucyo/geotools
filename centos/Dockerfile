FROM centos:8.3.2011

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/home/python/.poetry/bin:/home/python/.local/bin:$PATH" PIP_NO_CACHE_DIR="false"

RUN dnf update -y && dnf install epel-release -y && \
    dnf -y install dnf-plugins-core && \
    dnf config-manager --set-enabled powertools

RUN dnf install -y \
    python38 curl ca-certificates \
    libpq-devel python38-devel gettext git \
    proj-devel geos-devel gdal-devel \
    gcc gcc-c++ make && \
    # dnf groupinstall 'Development Tools' && \
    dnf clean all && \
    rm -rf /var/cache/dnf/* /var/cache/yum/*

RUN groupadd --gid 1000 python && \
    useradd  --uid 1000 --gid python --shell /bin/bash --create-home python

USER 1000
WORKDIR /home/python

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/527882380fd7aecd7c34922a7bc888226a5737ff/install-poetry.py | python3
RUN poetry config virtualenvs.create false

RUN mkdir /home/python/code
WORKDIR /home/python/code

COPY --chown=python:python pyproject.toml poetry.lock ./

RUN poetry install --no-interaction --no-root --no-ansi

ENV PATH="/home/python/.local/share/pypoetry/venv/bin:$PATH"

CMD ["python"]
