from bravado.requests_client import RequestsClient
from bravado.client import SwaggerClient

http_client = RequestsClient()
http_client.set_basic_auth('localhost', 'openapi',
                           'fa115467-a3e0-4b09-8475-f04ff779d5f8')

odoo = SwaggerClient.from_url(
    'http://localhost/api/v1/demo/swagger.json?token=demo_token&db=openapi',
    http_client=http_client)

records = odoo.res_partner.callMethodForResPartnerModel(
    method_name='search',
    body={
        'args': [
            [('is_company', '=', 'True')]
        ]
    }
).response().result

# odoo.res_partner.callMethodForResPartnerSingleRecord(
#     id=10,
#     method_name="write",
#     body={
#         "args": [
#             {"child_ids": [(0, 0, {"name": "User from API"})]}
#         ]
#     }
# ).response()

new_user = odoo.res_partner.addResPartner(body={
    "name": "New user 2",
    "company_id": 1,
    "parent_id": {"name": "New Parent"}
}).response().result
#
# result = odoo.res_partner.updateResPartnerById(id=10, body={
#     "child_ids": [new_user.id]
# }).response().result
#
# result = odoo.res_partner.updateResPartnerById(id=10, body={
#     "child_ids": []
# }).response().result