FROM postgres:latest
# config de postgresql pour être en Français:
# cf https://github.com/docker-library/docs/blob/master/postgres/README.md#locale-customization
RUN apt-get update
RUN apt-get install -y locales locales-all

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

RUN localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8
ENV LANG fr_FR.utf-8
ENV LC_ALL fr_FR.utf-8
ENV LANGUAGE fr_FR.utf-8

LABEL author="jean-Box"
LABEL description="Postgres Image for dev"
LABEL version="1.0"
