FROM debian:wheezy

MAINTAINER Matteo Giachino <matteog@gmail.com>

# Dependencies
RUN apt-get update && apt-get install -qqy curl build-essential ghc\
  cabal-install libncurses5-dev zlib1g-dev git\
  && rm -rf /var/lib/apt/lists/*
RUN cabal update
RUN cabal install cabal-install --prefix=/usr/local

RUN mkdir /elm
WORKDIR /elm
RUN curl https://raw.githubusercontent.com/elm-lang/elm-platform/master/installers/BuildFromSource.hs > BuildFromSource.hs
