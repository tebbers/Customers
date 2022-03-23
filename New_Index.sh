export ADMIN_API_KEY="XXXXXXX"
export ERA_URL="localhost:9200"
cat <<EOF>logstash_writeonly_role.json
{
  "name": "write_era_logs_logs",
  "database": [],
  "indexes": [
{
"names": [
        "logstash-*"
      ],
      "permissions": [
        "write"
] }
] }
EOF
# Create the role
curl -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${ADMIN_API_KEY}" \
  --data-binary @logstash_writeonly_role.json \
  ${ERA_URL}/v1/roles

  curl -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${ADMIN_API_KEY}" \
  ${ERA_URL}/v1/api_keys