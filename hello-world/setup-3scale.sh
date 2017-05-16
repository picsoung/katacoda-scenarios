# 1. create a new Service
# 2. create a new member
# 3. activate member
# 4. add member to service, application, analytics
#
# mkdir ~/.3scale/
# cd ~/.3scale/
# touch  credentials.json
# echo '{' >>  credentials.json
# echo '  "threescale": {'  >>  credentials.json
# echo '   "id": "commandline",' >>  credentials.json
# echo '   "provider_key": "df8411bfaaad72f68581c7814772b474",' >>  credentials.json
# echo '   "service_id": 2555417742291,' >>  credentials.json
# echo '   "access_token": "5ddeb96c1481b9c5482d3407f867c6c5159aafe7c5c5454e096f45703d33f9e7"' >>  credentials.json
# echo '  }' >>  credentials.json
# echo '}' >>  credentials.json
# cd ~

# npm install -g node-3scale-cli
KIKIRANDOM = $RANDOM

# 3scale-cli services create --serviceName "DefaultAPI${KIKIRANDOM}"

#create service
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/services.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&name=DefaultAPI-${KIKIRANDOM}")

serviceId=$(sed -ne '/service_id/{s/.*<service_id>\(.*\)<\/service_id>.*/\1/p;q;}' <<< "$output")

#create user
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/users.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&email=cli_user${KIKIRANDOM}%403scale.net&password=password&username=cli_useruser${KIKIRANDOM}@3scale.net")

accountId=$(sed -ne '/id/{s/.*<id>\(.*\)<\/id>.*/\1/p;q;}' <<< "$output")

#active user
output=$(curl -X PUT \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}/activate.xml" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474")

accountId=$(sed -ne '/account_id/{s/.*<account_id>\(.*\)<\/account_id>.*/\1/p;q;}' <<< "$output")

#add user to service
# output=$(curl -X PUT \
#   "https://commandline-admin.3scale.net/admin/api/users/${accountId}.xml" \
#   -H 'content-type: application/x-www-form-urlencoded' \
#   -d "provider_key=df8411bfaaad72f68581c7814772b474&member_permission_service_ids[]=${serviceId}")

#
# # install json parser
# npm install json
#
# #create Token
# output=$(curl -X POST \
#   "https://commandline-admin.3scale.net/admin/api/users/${accountId}/access_tokens.json?provider_key=df8411bfaaad72f68581c7814772b474" \
#   -H 'content-type: application/x-www-form-urlencoded' \
#   -d "name=threescale_cli&scopes[]=account_management&scopes[]=stats&permission=rw")
#
# accessTokenValue=`echo $output | json access_token.value`
# echo "AHAHAA${accessTokenValue}"

## ADD PERSMISSIONS

# mv >>  credentials.json ~/.3cale/.
# npm install node-3scale-cli
# cat ~/.3cale/credentials.json
