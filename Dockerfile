FROM tailscale/tailscale:latest

ENV TS_AUTHKEY=${TAILSCALE_AUTHKEY}
ENV TS_STATE_DIR=/var/lib/tailscale
ENV TS_USERSPACE=false

RUN mkdir -p /var/lib/tailscale && \
    chmod 755 /var/lib/tailscale

CMD ["sh", "-c", "tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock & tailscale up --authkey=${TS_AUTHKEY} --accept-routes --advertise-exit-node && sleep infinity"]
