Yesod development environment
=============================

Ready-made environment for Yesod development. Yesod is installed from an
exclusive Stackage snapshot.

Usage
-----

Start a container, expose a port and map your code dir as a volume:

```
$ docker run -t -i -v /my/code/dir:/code -p 3000:3000 ilkka/yesod-stackage /bin/bash
```

Scaffold your project:

```
root@acdc1234:/# cd /code
root@acdc1234:/code# yesod init --bare
(answer questions)
```

Install dependencies and start development server:

```
root@acdc1234:/code# cabal install --enable-tests --reorder-goals --max-backjumps=-1 -j
[...]
root@acdc1234:/code# yesod devel
```
