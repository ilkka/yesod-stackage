FROM ubuntu:14.04

ENV HOME /root
ENV PATH /root/.cabal/bin:$PATH

RUN apt-get update && \
  apt-get install -y haskell-platform cpphs postgresql-server-dev-9.3 && \
  cabal update && \
  sed -i "1 i\
remote-repo: stackage:http://www.stackage.org/stackage/46bb2d7487546939e22612e7d757f1df5a5163e9" /root/.cabal/config && \
  cabal update && \
  cabal install alex happy yesod-bin yesod-platform --max-backjumps=-1 --reorder-goals

