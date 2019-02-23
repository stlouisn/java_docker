FROM stlouisn/ubuntu:rolling

RUN \

    export DEBIAN_FRONTEND=noninteractive && \

    # Update apt-cache
    apt-get update && \

    # Install Java
    apt-get install -y --no-install-recommends \
        openjdk-11-jre-headless && \

    # Clean apt-cache
    apt-get autoremove -y --purge && \
    apt-get autoclean -y && \

    # Cleanup temporary folders
    rm -rf \
        /root/.cache \
        /root/.wget-hsts \
        /tmp/* \
        /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/default-java/jre
