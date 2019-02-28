FROM openjdk:alpine
LABEL maintainer "Hongyu Chen <hongyu.chen@traderev.com>"

WORKDIR /usr/src/app/

COPY engine.json ./
COPY package.json ./

RUN apk add bash unzip wget
RUN mkdir -p /build
RUN wget -O /build/ktlint https://github.com/shyiko/ktlint/releases/download/0.30.0/ktlint
RUN chmod a+x /build/ktlint
ENV PATH "$PATH:/build"

RUN adduser -u 9000 -D app
COPY . ./

USER app

WORKDIR /code
VOLUME /code

CMD ["/usr/src/app/bin/ktlint"]
