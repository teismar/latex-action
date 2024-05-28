# Use a base image with TeX Live pre-installed
FROM texlive/texlive:latest

# Install additional dependencies if needed
RUN apt-get update && \
    apt-get install -y \
    lualatex \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
