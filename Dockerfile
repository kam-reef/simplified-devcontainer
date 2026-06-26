FROM mcr.microsoft.com/dotnet/sdk:9.0-bookworm-slim

ARG TARGETARCH
ENV TZ=Etc/UTC

# Install lightweight troubleshooting & network utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    bat graphviz ripgrep dnsutils iputils-ping net-tools inetutils-traceroute tcpdump iproute2 \
    && rm -rf /var/lib/apt/lists/*

# EXAMPLE kubectx / kubens
#RUN git clone --depth 1 https://github.com/ahmetb/kubectx.git /opt/kubectx && \
#    cp /opt/kubectx/kubectx /usr/local/bin/ && \
#   cp /opt/kubectx/kubens /usr/local/bin/ && \
#    rm -rf /opt/kubectx

# EXAMPLE k9s (Architecture-aware match)
# ARG K9S_VER=0.50.16
# RUN case "${TARGETARCH}" in \
#         amd64) K9S_ARCH="x86_64" ;; \
#         arm64) K9S_ARCH="arm64" ;; \
#     esac; \
#     curl -fsSL "https://github.com/derailed/k9s/releases/download/v${K9S_VER}/k9s_Linux_${K9S_ARCH}.tar.gz" | tar -C /usr/local/bin -xzf - k9s \
#     && chmod +x /usr/local/bin/k9s

CMD ["bash"]