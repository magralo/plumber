FROM rocker/r-ver:4.0.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    make \
    libsodium-dev \
    libicu-dev \
    libcurl4-openssl-dev \
    libssl-dev

ENV CRAN_REPO https://packagemanager.rstudio.com/all/__linux__/focal/338
RUN Rscript -e 'install.packages(c("plumber", "promises", "future","lavaan"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("dplyr"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("janitor"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("tidyr"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'
RUN Rscript -e 'install.packages(c("lubridate"), repos = c("CRAN" = Sys.getenv("CRAN_REPO")))'

RUN groupadd -r plumber && useradd --no-log-init -r -g plumber plumber

ADD plumber.R /home/plumber/plumber.R
ADD entrypoint.R /home/plumber/entrypoint.R

WORKDIR /home/plumber
USER plumber

CMD ["Rscript","entrypoint.R"]