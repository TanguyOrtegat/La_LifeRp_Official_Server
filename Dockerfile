FROM citizenfx/server:dev

COPY components.json /opt/cfx-server/components.json
COPY server.cfg /opt/cfx-server/server.cfg
COPY run.sh /opt/cfx-server/run.sh

ENV SERVER_ARGS "+set citizen_dir /opt/cfx-server/citizen/ +exec server.cfg"

VOLUME /opt/cfx-server/cache

CMD ["sh", "/opt/cfx-server/run.sh"]
