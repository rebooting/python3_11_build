FROM ubuntu:24.04
# https://askubuntu.com/questions/1512042/ubuntu-24-04-getting-error-you-must-put-some-deb-src-uris-in-your-sources-list
RUN sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt-get update 
RUN apt-get build-dep python3 -y
RUN apt-get install -y build-essential gdb lcov pkg-config \
libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
lzma lzma-dev tk-dev uuid-dev zlib1g-dev wget zip

# USER 1000
WORKDIR /source
RUN wget https://github.com/python/cpython/archive/refs/tags/v3.11.9.tar.gz && tar -xvf v3.11.9.tar.gz && rm v3.11.9.tar.gz \
&& cd cpython-3.11.9 && ./configure --prefix=/usr/local/python3.11 --enable-optimizations && make -s && make altinstall \
&& cd /usr/local/ && zip -r /source/python3.11.9.zip python3.11

FROM ubuntu:24.04
COPY --from=0 /source/python3.11.9.zip /source/python3.11.9.zip
WORKDIR /source