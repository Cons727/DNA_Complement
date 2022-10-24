# syntax=docker/dockerfile:1
FROM rocker/shiny:4.0.5

# Install system requirments for index.R as needed
RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    git-core \
    libssl-dev \
    libcurl4-gnutls-dev \
    curl \
    libsodium-dev \
    libxml2-dev \
    libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
ENV _R_SHLIB_STRIP_=true
COPY Rprofile.site /etc/R
RUN install2.r --error --skipinstalled \
    shiny \
    stringr

# Copy files for the Shiny App
COPY ./app/* /srv/shiny-server/

USER shiny

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
