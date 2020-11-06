curl -X GET "https://trojik.tech/api/v1/demo/res.partner/1" -H "accept: application/json" -H "authorization: Basic  "
curl -X PATCH "http://sync.127.0.0.1.nip.io/api/v1/demo/res.partner/call/search" -H "accept: application/json" -H "authorization: Basic c3luYzo1NDcwOTI4Yi1kMjNkLTQyNmItYWJmNS0yMTE3ODY2MzgzOGM=" -H "Content-Type: application/json" -d "{ \"kwargs\": {\"body\": \"Message is posted via API by calling message_post method\" }, \"args\": []}"



curl -X PATCH "http://openapi.127.0.0.1.nip.io/api/v1/demo/res.partner/call/search_count" -H "accept: application/json" -H "authorization: Basic b3BlbmFwaTo3NTI1MjEzNC1iOGU4LTQzMGQtYTRmNy1hMGQ3NDA1ZmExNGM=" -H "Content-Type: application/json" -d "{ \"args\": [], \"kwargs\": {}}"


curl -X PATCH "http://localhost/api/v1/demo/res.partner/call/search" -H "accept: application/json" \
-H "authorization: Basic b3BlbmFwaTo2ODhkZjAxYS1kYzQwLTRjYzgtYTRjNS03MGM5MDBjOGQzMjA=" -H "Content-Type: application/json" \
-d '{ "args": [[["is_company", "=", "True" ]]]}'

curl -X PATCH -H "Authorization: Basic b3BlbmFwaTpkYmUwZDllMC1jNGIwLTQxNGYtOWM0Ny0wZmNjNTRmZjc3NDA=" \
-H "Content-Type: application/json" -H "Accept: */*" \
-d '{ "args": [[["id", "=", 22]], ["parent_id.name"]]}' "http://localhost/api/v1/demo/res.partner/call/search_read"

curl -X PATCH -H "Authorization: Basic b3BlbmFwaTpiMjlkMzdhYi04MzVhLTQxN2YtYTQwNy1iYzYyMzVmOGRmNjM=" \
-H "Content-Type: application/json" -H "Accept: */*" \
-d '{ "args": ["parent_id.name"]}' "http://localhost/api/v1/demo/res.partner/22/call/mapped"

curl -X PATCH -H "Authorization: Basic b3BlbmFwaTo1ZWIwYTI4My0yZjU5LTQzNDgtODVlZi0xNmUxZmZjZGJkMDI=" \
-H "Content-Type: application/json" -H "Accept: */*" \
-d '{ "args": [[["id", "=", 22]], ["id", "name", "partner_id/id", "partner_id/name"]]}' "http://localhost/api/v1/demo/res.partner/call/search_read_nested"

curl -X PATCH -H "Authorization: Basic b3BlbmFwaTo1ZWIwYTI4My0yZjU5LTQzNDgtODVlZi0xNmUxZmZjZGJkMDI=" \
-H "Content-Type: application/json" -H "Accept: */*" \
-d '{ "kwargs": {"domain": [["id", "=", 1]], "fields": ["id", "name", "parent_id/id"], "delimeter": "/"}}' "http://localhost/api/v1/demo/res.partner/call/search_read_nested"

# Mitchel
curl -X GET "http://localhost/api/v1/demo/res.partner.name/22" -H "accept: application/json" \
-H "authorization: Basic b3BlbmFwaTo1ZWIwYTI4My0yZjU5LTQzNDgtODVlZi0xNmUxZmZjZGJkMDI="

# Joe
curl -X GET "http://localhost/api/v1/demo/res.partner/41" -H "accept: application/json" \
-H "authorization: Basic b3BlbmFwaTo2OGI2MzZmNS1lM2NlLTRkZjQtYWE4Ni0wYWRmZGI2NTM0N2Y="

curl -v GET "https://dev.website.local/api/v1/demo/res.partner/1" \
-H "accept: application/json" -H "authorization: Basic b3BlbmFwaTo2OTZmMjE5Ny1iZWMxLTQ3NTQtODgzNy01ZmY3ZGYzOGJkODI="

curl GET "https://dev.website.local/api/v1/demo/res.partner/1" \
-H "accept: application/json" -H "authorization: Basic b3BlbmFwaTpkYTc4ZjllZi1jNmU4LTQ3YjctYjIzOC1kOGQwNjBkNjA3YmM="

# Заполнение полей
curl -X PUT -H "Authorization: Basic b3BlbmFwaToxYjE5Y2ZkOC1iMjBhLTRhNmUtOTJkMy0xYzYzNDU2ZGI3ODE=" \
-H "Content-Type: application/json" -H "Accept: */*" \
-d '{ "child_ids": [[0, 0, {"name": "new username"}]]}' "http://localhost/api/v1/demo/res.partner/10"

