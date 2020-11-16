FROM r-base:4.0.3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
        libcurl4-openssl-dev libssl-dev libxml2-dev \
        samtools tabix
RUN R -e 'install.packages("devtools")'
RUN R -e 'devtools::install_git("https://github.com/igordot/copynumber/")'
RUN R -e 'install.packages("sequenza")'
RUN R -e 'install.packages("docopt")'
ADD basicSequenza /usr/bin/
