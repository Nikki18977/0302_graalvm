FROM ghcr.io/graalvm/graalvm-ce:22.3.1 as builder
LABEL org.opencontainers.image.source="https://github.com/Nikki18977/0302_graalvm"

WORKDIR /app
COPY . .

RUN curl https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz \
    -o /tmp/apache-maven-3.9.1-bin.tar.gz &&\
    tar -xvf /tmp/apache-maven-3.9.1-bin.tar.gz &&\
    mv apache-maven-3.9.1 /opt/apache-maven-3.9.1

ENV PATH="$PATH:/opt/apache-maven-3.9.1/bin"

RUN  mvn -Pnative install

FROM scratch
COPY --from=builder /app/target/native.bin /app/native.bin

# Expose UDP PORT
EXPOSE 999

ENTRYPOINT [ "app/native.bin", "-Dport=999" ]


