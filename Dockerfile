FROM python:alpine

RUN pip install --upgrade pip

RUN addgroup -g 1000 user \
    && adduser -u 1000 -G user -s /bin/sh -D user \
    && apk add --no-cache git

USER user

WORKDIR /home/user

ENV PATH "$PATH:/home/user/.local/bin"

RUN pip install --user cookiecutter

ENTRYPOINT [ "cookiecutter", "-o", "/projects" ]
