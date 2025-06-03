#FROM texlive/texlive:TL2021-historic #Works
FROM texlive/texlive:latest


# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
# hadolint ignore# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
RUN apt-get update -q && \
    # Install tools less annd wget
    apt-get install -qqy -o=Dpkg::Use-Pty=0 --no-install-recommends less wget && \
    # Install Ruby's bundler
    apt-get install -qqy -o=Dpkg::Use-Pty=0 ruby poppler-utils && gem install bundler && \
    # libfile-copy-recursive-perl is required by ctanify
    apt-get install -qqy -o=Dpkg::Use-Pty=0 --no-install-recommends libfile-copy-recursive-perl openssh-client  && \
    # for plantuml, we need graphviz and inkscape. For inkscape, there is no non-X11 version, so 200 MB more
    apt-get install -qqy -o=Dpkg::Use-Pty=0 --no-install-recommends graphviz inkscape && \
    # LateXML - https://github.com/brucemiller/LaTeXML
    apt-get install -qqy -o=Dpkg::Use-Pty=0 --no-install-recommends latexml && \
    # fig2dev - tool for xfig to translate the figure to other formats
    apt-get install -qqy -o=Dpkg::Use-Pty=0 fig2dev && \
    # install bibtool
    apt-get install -qqy -o=Dpkg::Use-Pty=0 bibtool && \
    # install Python's pip3
    apt-get install -qqy -o=Dpkg::Use-Pty=0 python3-pip && \
    # install gnuplot
    apt-get install -qqy -o=Dpkg::Use-Pty=0 gnuplot && \
    # Removing documentation packages *after* installing them is kind of hacky,
    # but it only adds some overhead while building the image.
    # Source: https://github.com/aergus/dockerfiles/blob/master/latex/Dockerfile
    apt-get --purge remove -qqy .\*-doc$ && \
    # save some space
    rm -rf /var/lib/apt/lists/* && apt-get clean

# Configure entrypoint for GitHub Action
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 555 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
