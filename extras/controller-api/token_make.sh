#!/bin/sh

header() {
	python3 -c "import os;print('=' * os.get_terminal_size().columns)"
}

header
echo "This script will:"
echo "- create tower_cli.cfg"
echo "- create a personal access token from your AAP login" 
header

read -e -p "Enter AAP Controller hostname: " -i "$(hostname)" HOST
read -p "Enter Login: " LOGIN
read -sp "Enter Password: " PASS
echo

curl -k --user "$LOGIN":"$PASS" -H "Content-type: application/json" \
	-X POST \
	--data '{
"description": "Token for Tower API",
"scope": "write"
}' \
	https://$HOST/api/v2/tokens/ -o token.json

if type jq 2>/dev/null 1>&2 ; then
	jq . token.json
	TOKEN=$( jq .token token.json | xargs echo)
else
	TOKEN=$( python3 <<< "import json as j
with open('token.json', 'r') as f:
  print(j.load(f)['token'])
  ")
fi

header
echo "Output of tower_cli.cfg"
header
tee tower_cli.cfg << EOF
[general]
host = https://$HOST
verify_ssl = true
oauth_token = $TOKEN
EOF
header
