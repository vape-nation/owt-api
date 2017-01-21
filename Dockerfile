FROM haskell:7.10

WORKDIR /opt/server

RUN cabal update

COPY owt-api.cabal /opt/server/owt-api.cabal

RUN cabal install --only-dependencies -j4

COPY . /opt/server

RUN cabal install

RUN stack setup

RUN stack build

RUN stack exec owt-api-exe
