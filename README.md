# docker-odoo

To rebuild image you must use `docker-compose build` or `docker-compose up --build`

Run odoo: `docker-compose up`

Run odoo without nginx: `docker-compose up odoo`

Using WDB:

``` python
import wdb
wdb.set_trace()
```
