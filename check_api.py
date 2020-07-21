from bravado.requests_client import RequestsClient
from bravado.client import SwaggerClient

http_client = RequestsClient()
http_client.set_basic_auth('localhost', 'openapi', '1b19cfd8-b20a-4a6e-92d3-1c63456db781')
odoo = SwaggerClient.from_url(
    'http://localhost/api/v1/demo/swagger.json?token=demo_token&db=openapi',
    http_client=http_client
)

odoo.res_partner.callMethodForResPartnerSingleRecord(
    id=10,
    method_name="write",
    body={
        "args": [
            {"child_ids": [(0, 0, {"name": "User from API"})]}
        ]
    }
).response()





# new_user = odoo.res_partner.addResPartner(body={
#     "name": "New user",
# }).response().result
#
# result = odoo.res_partner.updateResPartnerById(id=10, body={
#     "child_ids": [new_user.id]
# }).response().result
#
# result = odoo.res_partner.updateResPartnerById(id=10, body={
#     "child_ids": []
# }).response().result