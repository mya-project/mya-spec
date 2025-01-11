FROM bitnami/minideb:bullseye-amd64

RUN apt update \
    && apt install -y \
        graphviz \
        make \
        texlive-latex-extra \
        texlive-lang-portuguese \
        texlive-latex-recommended \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jgm/pandoc/releases/download/3.6.1/pandoc-3.6.1-1-amd64.deb \
    -O /tmp/pandoc.deb \
    && dpkg -i /tmp/pandoc.deb \
    && rm -rf /tmp/*

WORKDIR "/app"

ENTRYPOINT ["make"]
