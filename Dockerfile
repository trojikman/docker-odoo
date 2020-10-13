FROM debian:buster
LABEL maintainer="Odoo S.A. <info@odoo.com>"

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            dirmngr \
            node-less \
            python-gevent \
            python-ldap \
            python-pip \
            python-qrcode \
            python-renderpm \
            python-vobject \
            python-watchdog \
            python-setuptools \
            gnupg \
            # multi
            ruby-dev \
            build-essential \
        && gem install bootstrap-sass \
#        && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb \
#        && echo '4d104ff338dc2d2083457b3b1e9baab8ddf14202 wkhtmltox.deb' | sha1sum -c - \
#        && dpkg --force-depends -i wkhtmltox.deb \
#        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
#        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
        && pip install psycogreen==1.0

#apt-get install ruby-full
#apt-get install -y build-essential # нужно

#RUN	gem install compass bootstrap-sass

# install latest postgresql-client
RUN set -x; \
        echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' > etc/apt/sources.list.d/pgdg.list \
        && export GNUPGHOME="$(mktemp -d)" \
        && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
        && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
        && gpg --armor --export "${repokey}" | apt-key add - \
        && rm -rf "$GNUPGHOME" \
        && apt-get update  \
        && apt-get install -y postgresql-client \
        && rm -rf /var/lib/apt/lists/*

# Install Odoo
ENV ODOO_VERSION 10.0
ARG ODOO_RELEASE=20190816
ARG ODOO_SHA=397cb4d458cb292edb0432dc8d39a466dce56b65
RUN set -x; \
        curl -o odoo.deb -sSL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
        && echo "${ODOO_SHA} odoo.deb" | sha1sum -c - \
        && dpkg --force-depends -i odoo.deb \
        && apt-get update \
        && apt-get -y install -f --no-install-recommends \
        && rm -rf /var/lib/apt/lists/* odoo.deb

RUN groupadd --gid 2000 odoo \
  && useradd --uid 2000 --gid odoo --shell /bin/bash --create-home odoo

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf \
    && chown odoo /entrypoint.sh

# Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
RUN mkdir -p /mnt/extra-addons \
        && chown -R odoo /mnt/extra-addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
EXPOSE 8069 8071

# Set the default config file
ENV ODOO_RC /etc/odoo/odoo.conf

# Set default user when running the container
#USER odoo

#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["odoo"]

#USER root

#RUN mkdir -p /mnt/extra-addons && chown -R odoo /mnt/extra-addons

# IT-Projects repos
RUN mkdir -p /mnt/addons \
        && chown -R odoo /mnt/addons

USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
