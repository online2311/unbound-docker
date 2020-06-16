FROM alpine:latest

LABEL maintainer Mijndert Stuij "mijndert@mijndertstuij.nl"

RUN apk --update add --no-cache unbound wget \
    && rm -rf /var/cache/apk/* /src/* \
    && wget -S -N https://www.internic.net/domain/named.cache -O /etc/unbound/root.hints \
    && mkdir -p /etc/unbound/unbound.d

COPY unbound.conf /etc/unbound/

VOLUME /etc/unbound/unbound.d

ENTRYPOINT ["unbound", "-d"]
