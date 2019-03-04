FROM openjdk:alpine
LABEL maintainer "Hongyu Chen <hongyu.chen@traderev.com>"

WORKDIR /usr/src/app/

COPY engine.json ./
COPY package.json ./

RUN apk add bash unzip wget
RUN wget -O /usr/src/app/ktlint https://github.com/shyiko/ktlint/releases/download/0.30.0/ktlint
RUN chmod a+x /usr/src/app/ktlint
ENV PATH "$PATH:/usr/src/app/"

RUN adduser -u 9000 -D app
COPY . ./

USER app

WORKDIR /code
VOLUME /code

CMD ["/usr/src/app/bin/ktlint"]
