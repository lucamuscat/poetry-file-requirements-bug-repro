ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION:-3.11}
RUN pip install poetry
WORKDIR /sources
COPY dummy dummy
COPY repro repro

RUN poetry --project repro install
