FROM alpine

RUN apk update && apk add git make g++ autoconf openssl-dev linux-headers automake
RUN git clone https://github.com/nmap/nmap.git
WORKDIR /nmap/
RUN sed -i 's/1.16/1.17/g' libpcre/Makefile
RUN ./configure && make && make install
ENTRYPOINT ["/nmap/nmap"]
