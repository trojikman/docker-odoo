FROM odoo:14.0

USER root

# Python Dependencies

# queue_job
RUN pip3 install requests

# sync demo dependencies
RUN python3 -m pip install PyGithub py-trello python-telegram-bot

# IT-Projects repos
RUN mkdir -p /mnt/addons \
        && chown -R odoo /mnt/addons

USER odoo
