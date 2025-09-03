# Start from official Jenkins LTS (Debian-based)
FROM jenkins/jenkins:lts-jdk17

USER root

# Install only required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins

# Pre-install recommended plugins to reduce build time
RUN jenkins-plugin-cli --plugins "blueocean git workflow-aggregator"

EXPOSE 8080 50000

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
