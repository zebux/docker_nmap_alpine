FROM alpine

RUN apk update && apk add git make g++ autoconf openssl-dev linux-headers automake
RUN git clone https://github.com/nmap/nmap.git
WORKDIR /nmap/

RUN ./configure 
RUN sed -i 's/1.16/1.17/g' /nmap/libpcre/Makefile
RUN make && make install
ENTRYPOINT ["/nmap/nmap"]
