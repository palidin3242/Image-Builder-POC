#!/bin/sh

set -e

header() {
	python3 -c "import os;print('=' * os.get_terminal_size().columns)"
}

err() {
	{ set +x; } 2>/dev/null
	echo "Fatal error:" "$@" 1>&2
	exit 1
}

header
echo "This script will:"
echo "- read token.json"
echo "- read tower_cli.cfg"
echo "- delete the personal access token that was created"
header

echo "checing if files can be read"
(
	set -x
	test -r tower_cli.cfg
	test -r token.json
)

set +e
read A B ihost < <(grep host' = ' tower_cli.cfg)
read A B itoken < <(grep token' = ' tower_cli.cfg)
read A B issl < <(grep verify_ssl' = ' tower_cli.cfg)
set -e

jj=$(python3 <<< "import json as j
with open('token.json', 'r') as f:
  jj=j.load(f)
print(jj['id'], jj['token'])
")
read jid jtoken <<< "$jj"

test -n "$ihost" || err "ini host is empty"
test -n "$itoken" || err "ini token is empty"
test -n "$issl" || err "ini ssl_verify is empty"
test -n "$jid" || err "json id is empty"
test -n "$jtoken" || err "json token is empty"

echo "INI configuration tower_cli.cfg"
cat<<INI
  ihost: $ihost
  itoken: $itoken
  sslverify: $issl
INI
header
echo "json configuration: token.json"
cat<<JSON
  jtoken: $jtoken
  jid: $jid
JSON

header
echo tokens should match
(
	set -x
	test "$jtoken" == "$itoken"
)
header
test "$issl" == "false" && SSL=-k || SSL=''

echo Deleting personal access token: $jtoken
(
	set -x
	curl $SSL -X DELETE -H "Authorization: Bearer $jtoken" $ihost/api/v2/tokens/$jid/
)
echo
