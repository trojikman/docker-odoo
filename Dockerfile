FROM odoo:13.0

USER root

# Python Dependencies
# TODO: сделать автоматическую установку зависимостей из файлов requirenments
# for ir_attachment_s3
#RUN pip3 install boto3
RUN pip3 install python-slugify
# for tests
RUN pip3 install websocket-client
# WDB
RUN pip3 install wdb

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

# TODO: оптимизировать эти команды (клонирование из файла или подстановка)
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/access-addons.git /mnt/addons/access-addons && chown -R odoo /mnt/addons/access-addons
RUN git clone --depth=1 -b 13.0 https://github.com/itpp-labs/pos-addons.git /mnt/addons/pos-addons && chown odoo /mnt/addons/pos-addons
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/misc-addons.git /mnt/addons/misc-addons && chown odoo /mnt/addons/misc-addons
RUN git clone --depth=1 -b 13.0 https://github.com/itpp-labs/mail-addons.git /mnt/addons/mail-addons && chown odoo /mnt/addons/mail-addons


# OCA repos
RUN git clone --depth=1 -b 13.0 https://github.com/OCA/queue.git /mnt/addons/queue && chown odoo /mnt/addons/queue
RUN git clone --depth=1 -b 13.0 https://github.com/OCA/web.git /mnt/addons/web && chown odoo /mnt/addons/web

USER odoo
