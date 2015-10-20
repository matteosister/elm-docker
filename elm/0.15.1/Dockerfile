FROM haskell

MAINTAINER Matteo Giachino <matteog@gmail.com>

RUN apt-get update && apt-get install -qqy curl git locales && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales && locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV PATH=/elm/Elm-Platform/0.15.1/.cabal-sandbox/bin:$PATH
RUN mkdir /elm

WORKDIR /elm
RUN curl https://raw.githubusercontent.com/elm-lang/elm-platform/master/installers/BuildFromSource.hs > BuildFromSource.hs
RUN runhaskell BuildFromSource.hs 0.15.1

# Node
# gpg keys listed at https://github.com/nodejs/node
RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.2.1

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --verify SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc

RUN mkdir /app
WORKDIR /app
VOLUME /app
ENTRYPOINT ["elm"]
