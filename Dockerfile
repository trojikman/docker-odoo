FROM odoo:10.0

USER root

#RUN mkdir -p /mnt/extra-addons && chown -R odoo /mnt/extra-addons
RUN apt-get update  \
        && apt-get install -y git

# PHANTOMJS
# based on https://github.com/wernight/docker-phantomjs
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python ruby-compass \
        ca-certificates \
        bzip2 \
        libfontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
    && mkdir /tmp/phantomjs \
    && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
           | tar -xj --strip-components=1 -C /tmp/phantomjs \
    && cd /tmp/phantomjs \
    && mv bin/phantomjs /usr/local/bin \
    && cd \
    && apt-get purge --auto-remove -y \
        curl \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/*

# Special case to get bootstrap-sass, required by Odoo for Sass assets
RUN gem install --no-rdoc --no-ri --no-update-sources autoprefixer-rails --version '<9.8.6' \
    && gem install --no-rdoc --no-ri --no-update-sources bootstrap-sass --version '<3.4' \
    && rm -Rf ~/.gem /var/lib/gems/*/cache/

# WDB
RUN pip install wdb

# IT-Projects repos
RUN mkdir -p /mnt/addons \
        && chown -R odoo /mnt/addons

# TODO: оптимизировать эти команды (клонирование из файла или подстановка)
#RUN git clone --depth=1 -b 10.0 https://github.com/itpp-labs/website-addons.git /mnt/addons/website-addons && chown -R odoo /mnt/addons/website-addons
# RUN git clone --depth=1 -b 12.0 https://github.com/it-projects-llc/saas-addons.git /mnt/addons/saas-addons && chown odoo /mnt/addons/saas-addons
#RUN git clone --depth=1 -b 10.0 https://github.com/itpp-labs/pos-addons.git /mnt/addons/pos-addons && chown odoo /mnt/addons/pos-addons
#RUN git clone --depth=1 -b 10.0 https://github.com/itpp-labs/misc-addons.git /mnt/addons/misc-addons && chown -R odoo /mnt/addons/misc-addons

# OCA repos
# RUN git clone --depth=1 -b 12.0 https://github.com/OCA/queue.git /mnt/addons/queue && chown odoo /mnt/addons/queue
#RUN git clone --depth=1 -b 10.0 https://github.com/OCA/web.git /mnt/addons/web && chown odoo /mnt/addons/web

USER odoo
