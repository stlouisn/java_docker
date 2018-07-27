#

if [[ ! -z $1 ]]; then

  curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Travis-API-Version: 3' -H 'Authorization: token ${TRAVIS_API_TOKEN}' -d '{"request": {"message": "Push from stlouisn/ubuntu:rolling", "branch": "master"}}' $1

fi
