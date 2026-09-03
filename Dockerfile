FROM ghcr.io/xtls/xray-core:latest

WORKDIR /Koshibar/Vmess

COPY config.json /Koshibar/Vmess/config.json
COPY start.sh /Koshibar/Vmess/start.sh

RUN chmod +x /Koshibar/Vmess/start.sh

EXPOSE 8080

ENTRYPOINT ["/Koshibar/Vmess/start.sh"]
