FROM alpine:3.5
MAINTAINER Francesco Tonini <francescoantoniotonini@gmail.com>
ENV REFRESHED_AT 2017-02-12

# Install dependencies + gm sources
RUN apk add --update g++ gcc make wget libjpeg-turbo-dev libpng-dev libtool freetype-dev
RUN wget http://ftp.icm.edu.pl/pub/unix/graphics/GraphicsMagick/1.3/GraphicsMagick-1.3.25.tar.gz

# Unzip + compile
RUN tar zxvf GraphicsMagick-1.3.25.tar.gz
RUN cd GraphicsMagick-1.3.25 && ./configure && make && make install

# Cleanup
RUN rm -rf GraphicsMagick-*
RUN apk del g++ gcc make wget