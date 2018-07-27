#

echo "token = "${TRAVIS_API_TOKEN}
echo "arg1 ="$1
echo "arg2 ="$2

echo ${TRAVIS_API_TOKEN} > file1
cat file1
echo $2 > file2
cat file2

if [[ ! -z $1 ]]; then

  curl -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -H "Travis-API-Version: 3" \
    -H "Authorization: token ${TRAVIS_API_TOKEN}" \
    -d "{'request': {'message': 'Push from stlouisn/ubuntu:rolling', 'branch': 'master'}}" \
    $1

fi
