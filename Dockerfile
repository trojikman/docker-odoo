FROM odoo:13.0

USER root

RUN pip3 install python-slugify

#RUN mkdir -p /mnt/extra-addons && chown -R odoo /mnt/extra-addons
RUN apt-get update  \
        && apt-get install -y git

# IT-Projects repos
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/access-addons.git /mnt/extra-addons
RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/saas-addons.git /mnt/extra-addons

# OCA repos https://github.com/OCA/queue.git
RUN git clone --depth=1 -b 13.0 https://github.com/OCA/queue.git /mnt/extra-addons
USER odoo
