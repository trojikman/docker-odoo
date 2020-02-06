# docker-odoo
# SaaS Demo deploy instruction

`git clone -b 12.0-saas_demo --single-branch https://github.com/trojikman/docker-odoo.git saas_demo-12`

`cd saas_demo-12`

give the Odoo access to the config folder

`sudo chmod -R 777 config`

`docker-compose up web`

wait for intsalling, then press Ctrl+C in terminal and again:

`docker-compose up web`

Go to http://saas.127.0.0.1.nip.io/
