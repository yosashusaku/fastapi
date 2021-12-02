FROM python:3.10-alpine
ENV PYTHONUMBUFFERED=1

WORKDIR /src

RUN pip install poetry
COPY project.toml* poetry.lock* ./

RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install; fi

ENTRYPOINT ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]