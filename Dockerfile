FROM haskell:7.10

RUN stack setup

WORKDIR /opt/server

COPY . /opt/server

RUN stack build

EXPOSE 8081

CMD ["stack", "exec", "owt-api-exe"]
