# docker-odoo

To rebuild image you must use `docker-compose build` or `docker-compose up --build`

Run odoo: `docker-compose up`

Run odoo without nginx: `docker-compose up odoo`

## Odoo shell
To run odoo shell use command `docker-compose exec odoo odoo shell -d openapi --db_host db --db_password odoo`
where `openapi` is a database name, `db` assigned to `db_host` is a postgres service name in compose file, 
`odoo` assigned to `db_password` is a `POSTGRES_PASSWORD` env variable in postgres service.

## Using WDB:

``` python
import wdb
wdb.set_trace()
```