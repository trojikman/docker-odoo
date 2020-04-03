FROM odoo:13.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install python-slugify
# RUN apt-get update && apt-get install git -y
USER odoo
