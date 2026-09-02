FROM ghcr.io/xtls/xray-core:latest

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json

ENV PORT=8080

EXPOSE 8080

CMD ["sh", "-c", "sed -i \"s/\\\"port\\\": 8080/\\\"port\\\": ${PORT}/\" /etc/xray/config.json && exec xray run -config /etc/xray/config.json"]
