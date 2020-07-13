FROM odoo:13.0

USER root

# Python Dependencies
# TODO: сделать автоматическую установку зависимостей из файлов requirenments
# for ir_attachment_s3
#RUN pip3 install boto3

# for email_headers
RUN pip3 install pycryptodome

#RUN mkdir -p /mnt/extra-addons && chown -R odoo /mnt/extra-addons
RUN apt-get update  \
        && apt-get install -y git

# WDB
RUN pip3 install wdb

# IT-Projects repos
RUN mkdir -p /mnt/addons \
        && chown -R odoo /mnt/addons

# TODO: оптимизировать эти команды (клонирование из файла или подстановка)
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/access-addons.git /mnt/addons/access-addons && chown -R odoo /mnt/addons/access-addons
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/pos-addons.git /mnt/addons/pos-addons && chown odoo /mnt/addons/pos-addons
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/misc-addons.git /mnt/addons/misc-addons && chown odoo /mnt/addons/misc-addons
RUN git clone --depth=1 -b 13.0 https://github.com/itpp-labs/mail-addons.git /mnt/addons/mail-addons && chown odoo /mnt/addons/mail-addons


# OCA repos
RUN git clone --depth=1 -b 13.0 https://github.com/OCA/queue.git /mnt/addons/queue && chown odoo /mnt/addons/queue
RUN git clone --depth=1 -b 13.0 https://github.com/OCA/web.git /mnt/addons/web && chown odoo /mnt/addons/web

USER odoo
