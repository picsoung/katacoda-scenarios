# 1. create a new Service
# 2. create a new member
# 3. activate member
# 4. add member to service, application, analytics

npm install node-3scale-cli
# # install json parser
npm install json

RANDOMID=$RANDOM

# 3scale-cli services create --serviceName "DefaultAPI${RANDOMID}"

#create service
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/services.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&name=DefaultAPI-${RANDOMID}")

serviceId=$(sed -ne '/service_id/{s/.*<service_id>\(.*\)<\/service_id>.*/\1/p;q;}' <<< "$output")
#
# #create user
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/users.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&email=cli_user${RANDOMID}%403scale.net&password=password&username=cli_useruser${RANDOMID}@3scale.net")

accountId=$(sed -ne '/id/{s/.*<id>\(.*\)<\/id>.*/\1/p;q;}' <<< "$output")
#
# #active user
output=$(curl -X PUT \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}/activate.xml" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474")

accountId=$(sed -ne '/account_id/{s/.*<account_id>\(.*\)<\/account_id>.*/\1/p;q;}' <<< "$output")

#add user to service
output=$(curl -X PUT \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}.xml" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&member_permission_service_ids[]=${serviceId}")

#
#create Token
output=$(curl -X POST \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}/access_tokens.json?provider_key=df8411bfaaad72f68581c7814772b474" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "name=threescale_cli&scopes[]=account_management&scopes[]=stats&permission=rw")

accessTokenValue=`echo $output | json access_token.value`
echo "AHAHAA${accessTokenValue}"

## ADD PERSMISSIONS

# mv >>  credentials.json ~/.3cale/.
# npm install node-3scale-cli
# cat ~/.3cale/credentials.json
