#!/usr/bin/env bash

set -euo pipefail

mkdir -p /etc/docker

cat <<'EOF' > /etc/docker/daemon.json
{
    "storage-driver": "overlay2",
    "experimental":true
}
EOF

cat /etc/docker/daemon.json

cat <<'EOF' > /etc/apt/sources.list.d/docker.list
deb [arch=armhf] https://download.docker.com/linux/debian stretch stable
#deb [arch=armhf] https://download.docker.com/linux/debian stretch edge
EOF

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

apt update -q

apt install -y docker-ce

service docker restart || sudo journalctl -xe
 
docker info
docker version
