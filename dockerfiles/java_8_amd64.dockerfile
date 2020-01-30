FROM stlouisn/ubuntu:rolling

RUN \

    export DEBIAN_FRONTEND=noninteractive && \

    # Update apt-cache
    apt-get update && \

    # Install temporary-tools
    apt-get install -y --no-install-recommends \
        dirmngr \
        gnupg && \

    # Add zulu repository
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    echo "deb http://repos.azulsystems.com/debian stable main" > /etc/apt/sources.list.d/zulu.list && \

    # Update apt-cache
    apt-get update && \

    # Install Java
    apt-get install -y --no-install-recommends \
        zulu-8 && \

    # Clean apt-cache
    apt-get autoremove -y --purge && \
    apt-get autoclean -y && \

    # Cleanup temporary folders
    rm -rf \
        /root/.cache \
        /root/.wget-hsts \
        /tmp/* \
        /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/zulu-8-amd64/
