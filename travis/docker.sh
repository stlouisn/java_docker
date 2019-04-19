#!/usr/bin/env bash

set -euo pipefail

mkdir -p /etc/docker

cat <<'EOF' > /etc/docker/daemon.json
{
    "storage-driver": "overlay2",
    "experimental":true
}
EOF

#cat /etc/docker/daemon.json

#cat <<'EOF' > /etc/apt/sources.list.d/docker.list
#deb https://download.docker.com/linux/debian stretch stable
#deb https://download.docker.com/linux/debian stretch edge
#EOF

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update -q

apt install -y docker-ce

service docker restart || sudo journalctl -xe
 
docker info
docker version
