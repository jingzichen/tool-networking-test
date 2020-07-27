FROM alpine:3.12.0

ENV TZ=Asia/Taipei

#Create an app user for the application usage
RUN addgroup -S appgroup
RUN adduser -S app -G appgroup -s /bin/sh

RUN apk add --update coreutils && rm -rf /var/cache/apk/*
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN apk add --no-cache gawk
RUN apk add --update --no-cache bind-tools
RUN apk add --no-cache curl

COPY network-test.sh network-test.sh
RUN chmod +x /network-test.sh
USER app

CMD ["/network-test.sh"]