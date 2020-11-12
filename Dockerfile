FROM golang:1.8.3

# install glide
RUN curl -L https://github.com/Masterminds/glide/releases/download/v0.12.3/glide-v0.12.3-linux-amd64.tar.gz | tar zxvfp -; \
    cd linux-amd64; \
    mv glide /usr/bin/glide; \
    cd .. && rm -rf linux-amd64

COPY . /go/src/github.com/kloeckner-i/go-solr/

RUN cd /go/src/github.com/kloeckner-i/go-solr; \
    glide install

RUN cd /go/src/github.com/kloeckner-i/go-solr; \
    make install