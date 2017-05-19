# 1. create a new Service
# 2. create a new member
# 3. activate member
# 4. add member to service, application, analytics

clear

export PATH=$PATH:./node_modules/.bin/ >/dev/null 2>&1
#
npm install node-3scale-cli >/dev/null 2>&1
# # # install json parser
npm install json >/dev/null 2>&1

RANDOMID=$RANDOM >/dev/null 2>&1

# 3scale-cli services create --serviceName "DefaultAPI${RANDOMID}"
#
# #create service
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/services.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&name=DefaultAPI-${RANDOMID}") >/dev/null 2>&1
#
serviceId=$(sed -ne '/service_id/{s/.*<service_id>\(.*\)<\/service_id>.*/\1/p;q;}' <<< "$output") >/dev/null 2>&1
# #
# # #create user
output=$(curl -X POST \
  https://commandline-admin.3scale.net/admin/api/users.xml \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474&email=cli_user${RANDOMID}%403scale.net&password=password&username=cli_user${RANDOMID}@3scale.net") >/dev/null 2>&1

accountId=$(sed -ne '/id/{s/.*<id>\(.*\)<\/id>.*/\1/p;q;}' <<< "$output") >/dev/null 2>&1
#
# #active user
output=$(curl -X PUT \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}/activate.xml" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "provider_key=df8411bfaaad72f68581c7814772b474") >/dev/null 2>&1

# accountId=$(sed -ne '/account_id/{s/.*<account_id>\(.*\)<\/account_id>.*/\1/p;q;}' <<< "$output") >/dev/null 2>&1

#add user to service
output=$(curl -X PUT \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}.xml?access_token=e95df99686f9347d5484dd1352c65a35a6c961e9d9570f1c4881aba9cc715d1c" \
  -d "member_permission_ids[]=monitoring&member_permission_ids[]=partners&member_permission_ids[]=plans&member_permission_service_ids[]=${serviceId}") >/dev/null 2>&1

  # url -X PUT \
  # 'https://commandline-admin.3scale.net/admin/api/users/2445582099561.xml?access_token=e95df99686f9347d5484dd1352c65a35a6c961e9d9570f1c4881aba9cc715d1c' \
  # -d 'member_permission_ids[]=monitoring&member_permission_service_ids[]=2555417742407'
#
#create Token
output=$(curl -X POST \
  "https://commandline-admin.3scale.net/admin/api/users/${accountId}/access_tokens.json?provider_key=df8411bfaaad72f68581c7814772b474" \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "name=threescale_cli&scopes[]=account_management&scopes[]=stats&permission=rw") >/dev/null 2>&1

accessTokenValue=`echo $output | json access_token.value`

clear

declare -A colors
color=${colors[$input_color]}
colors[Green]='\033[0;32m'
colors[On_Blue]='\033[44m'
colors[White]='\033[0;37m'
green=${colors[Green]}
on_blue=${colors[On_Blue]}
white=${colors[White]}

clear

message="${green}Welcome to 3scale tutorial \n\n"
message=$message"${green}Your 3scale username is ${on_blue}cli_user${RANDOMID}@3scale.net${white}\n\n"
message=$message"${green} Your 3scale ID is ${on_blue}commandline${white}\n\n"
message=$message"${green} Your password is ${on_blue}password${white}\n\n"
message=$message"${green} The access_token is ${on_blue}${accessTokenValue}" >> /dev/null

echo -e $message
