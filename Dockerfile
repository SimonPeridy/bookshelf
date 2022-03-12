FROM python:3.9-alpine
ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.1
RUN apk update && apk add gcc libc-dev make git libffi-dev openssl-dev python3-dev libxml2-dev libxslt-dev
#from https://stackoverflow.com/questions/46711990/error-pg-config-executable-not-found-when-installing-psycopg2-on-alpine-in-dock
RUN apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev
RUN pip install "poetry==$POETRY_VERSION"
WORKDIR /code
COPY poetry.lock pyproject.toml /code/
RUN poetry config virtualenvs.create false
RUN poetry install
#still from same stackoverflow post
RUN apk --purge del .build-deps
COPY Bibliotheque /code
COPY bookshelv /code
#COPY data /code
COPY static /code
COPY templates /code