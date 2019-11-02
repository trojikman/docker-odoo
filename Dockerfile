FROM odoo:13.0

USER root

RUN pip3 install python-slugify

#RUN mkdir -p /mnt/extra-addons && chown -R odoo /mnt/extra-addons
RUN apt-get update  \
        && apt-get install -y git

RUN git clone --depth=1 -b 13.0 https://github.com/it-projects-llc/access-addons.git /mnt/extra-addons
USER odoo

# ============================================================
# Forward enforce minimal naming scheme on secondary build
# ============================================================