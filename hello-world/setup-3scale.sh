KIKIRANDOM = $RANDOM

#create service
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/services.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&name=DefaultAPI-${KIKIRANDOM}")

serviceId=$(sed -ne '/service_id/{s/.*<service_id>\(.*\)<\/service_id>.*/\1/p;q;}' <<< "$output")
