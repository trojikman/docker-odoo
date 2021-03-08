FROM odoo:14.0

USER root
# repos path
# RUN mkdir -p /mnt/addons \
        # && chown -R odoo /mnt/addons

USER odoo
