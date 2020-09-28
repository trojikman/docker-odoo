FROM odoo:13.0
USER root
RUN python3 -m pip install wdb
USER odoo
