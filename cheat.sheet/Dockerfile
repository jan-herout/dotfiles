FROM ubuntu:latest

# Non-interactive apt and timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Prague

# Set container HOME to mapped path and prepare workdir
ENV HOME=/home/ralph
WORKDIR /home/ralph

# Install required tools and Copilot CLI dependencies
RUN set -eux; \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      tzdata \
      curl \
      gpg \
      git \
      gosu \
      vim \
      nodejs \
      npm; \
    dpkg-reconfigure -f noninteractive tzdata; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /home/ralph

  # Create non-root user and own its home
  RUN groupadd -r ralph && \
    useradd -m -r -g ralph -d /home/ralph -s /bin/bash ralph && \
    chown -R ralph:ralph /home/ralph

# Install Copilot CLI (no login during build)
RUN npm install -g @github/copilot

# Install uv (Python toolchain manager)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Ensure uv is on PATH for interactive shells
ENV PATH="$HOME/.local/bin:$PATH"

# Drop to non-root user for interactive sessions
USER ralph

# Start in an interactive bash session
ENTRYPOINT ["/bin/bash"]