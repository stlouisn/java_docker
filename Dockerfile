FROM stlouisn/ubuntu:rolling

RUN \

    export DEBIAN_FRONTEND=noninteractive && \

    # Update apt-cache
    apt-get update && \

    # Install Java
    apt-get install -y --no-install-recommends \
        APT_NAME_JAVA && \

    # Clean apt-cache
    apt-get autoremove -y --purge && \
    apt-get clean -y && \
    apt-get autoclean -y && \

    # Cleanup temporary folders
    rm -rf \
        /root/.cache \
        /root/.wget-hsts \
        /tmp/* \
        /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/default-java/jre
