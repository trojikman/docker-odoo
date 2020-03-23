FROM odoo:13.0
USER root
RUN python3 -m pip install python-slugify wdb
RUN apt-get update && apt-get install git -y
USER odoo
