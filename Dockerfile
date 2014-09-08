FROM ubuntu:14.04

ENV HOME /root
ENV PATH /root/.cabal/bin:$PATH

RUN apt-get update && \
  apt-get install -y ghc ghc-haddock zlib1g-dev curl && \
  cd /tmp && \
  curl http://hackage.haskell.org/package/cabal-install-1.20.0.3/cabal-install-1.20.0.3.tar.gz | tar xzf - && \
  cd cabal-install-1.20.0.3 && \
  sh ./bootstrap.sh && \
  cabal update && \
  sed -i "s/^remote-repo: .*/remote-repo: stackage:http://www.stackage.org/stackage/46bb2d7487546939e22612e7d757f1df5a5163e9/" /root/.cabal/config && \
  cabal update && \
  cabal install alex happy yesod-bin yesod-platform --max-backjumps=-1 --reorder-goals

