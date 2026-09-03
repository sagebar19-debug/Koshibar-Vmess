FROM ghcr.io/xtls/xray-core:latest

WORKDIR /Koshibar/Vmess

COPY config.json /Koshibar/Vmess/config.json

EXPOSE 8080

CMD ["run", "-config", "/Koshibar/Vmess/config.json"]
