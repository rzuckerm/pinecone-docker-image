FROM alpine:3.18.2

COPY PINECONE_* /tmp/
RUN apk add git g++ make musl-dev ncurses-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/wmww/Pinecone.git -b v$(cat /tmp/PINECONE_VERSION) && \
    cd Pinecone && \
    make && \
    cp pinecone /usr/local/bin && \
    cd / && \
    rm -rf /opt/Pinecone && \
    apk del git g++ make
