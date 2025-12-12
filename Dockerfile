# Copyright (c) UBC-DSCI Development Team.
FROM ubcdsci/py-dsci-100:20230831022048aa49aa

# Switch the working directory back to the homedir
WORKDIR ${HOME}

# Make sure the contents of our repo are in ${HOME} for binder
COPY . ${HOME}

USER root

# Install prerequisites + GDC Data Transfer Tool (gdc-client)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://gdc.cancer.gov/files/public/file/gdc-client_v1.6.1_Ubuntu_x64.zip \
 && unzip gdc-client_v1.6.1_Ubuntu_x64.zip \
 && mv gdc-client /usr/local/bin/ \
 && chmod +x /usr/local/bin/gdc-client \
 && rm -f gdc-client_v1.6.1_Ubuntu_x64.zip

RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
