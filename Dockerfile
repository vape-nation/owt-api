FROM haskell:7.10


WORKDIR /opt/server

COPY . /opt/server

RUN stack setup

RUN stack build

EXPOSE 8081

CMD ["stack", "exec", "owt-api-exe"]
