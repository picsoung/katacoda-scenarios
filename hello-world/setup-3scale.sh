# 1. create a new Service
# 2. create a new member
# 3. activate member
# 4. add member to service, application, analytics

touch credentials.json
echo '{' >> credentials.json
echo '  "threescale": {' >> credentials.json
echo '   "id": "commandline",' >> credentials.json
echo '   "provider_key": "df8411bfaaad72f68581c7814772b474",' >> credentials.json
echo '   "service_id": 2555417742291,' >> credentials.json
echo '   "access_token": "5ddeb96c1481b9c5482d3407f867c6c5159aafe7c5c5454e096f45703d33f9e7"' >> credentials.json
echo '  }' >> credentials.json
echo '}' >> credentials.json
mkdir ~/.3scale/
mv credentials.json ~/.3cale/.
# npm install node-3scale-cli
# cat ~/.3cale/credentials.json
