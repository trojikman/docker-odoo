FROM odoo:12.0

USER root

# Python Dependencies
# TODO: сделать автоматическую установку зависимостей из файлов requirenments
# for ir_attachment_s3
RUN pip3 install boto3
RUN pip3 install python-slugify
# for tests
RUN pip3 install websocket-client
# WDB
RUN pip3 install wdb

# openapi dependencies
RUN pip3 install bravado
RUN pip3 install swagger-spec-validator==2.4.3

RUN apt-get update  \
        && apt-get install -y git \
        && apt-get install -y wget \
        && apt-get install -y libappindicator3-1 \
        && apt-get install -y libatk-bridge2.0-0 \
        && apt-get install -y libatk1.0-0 \
        && apt-get install -y libatspi2.0-0 \
        && apt-get install -y libcups2 \
        && apt-get install -y libdbus-1-3 \
        && apt-get install -y libdrm2 \
        && apt-get install -y libgbm1 \
        && apt-get install -y libgdk-pixbuf2.0-0 \
        && apt-get install -y libgtk-3-0 \
        && apt-get install -y libnspr4 \
        && apt-get install -y libnss3 \
        && apt-get install -y libx11-xcb1 \
        && apt-get install -y libxcb-dri3-0 \
        && apt-get install -y libxcomposite1 \
        && apt-get install -y libxcursor1 \
        && apt-get install -y libxdamage1 \
        && apt-get install -y libxi6 \
        && apt-get install -y libxrandr2 \
        && apt-get install -y libxss1 \
        && apt-get install -y libxtst6 \
        && apt-get install -y xdg-utils \
        && apt-get install -y libxfixes3 \
        && apt-get install -y libasound2 \
        && apt-get install -y fonts-liberation



# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

# IT-Projects repos
RUN mkdir -p /mnt/addons \
        && chown -R odoo /mnt/addons

# for sync_woo
RUN python3 -m pip install woocommerce
RUN python3 -m pip install python-telegram-bot==12.8 PyGithub py-trello 

USER odoo
