FROM nginx:1.13.5-alpine

ENV \
  CONTAINERPILOT_VERSION='3.4.3'

RUN \
  apk --no-cache add curl && \
  curl -fLsS https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
    tar xz -C /usr/local/bin

COPY public /usr/share/nginx/html
COPY etc/containerpilot.json5.gotmpl /etc/

ENV \
  CONSUL_SERVICE_NAME='caseyfoster-website' \
  CONSUL_SERVICE_TAGS='' \
  CONSUL_URL='' \
  CONTAINERPILOT='/etc/containerpilot.json5.gotmpl'

CMD ["containerpilot"]
