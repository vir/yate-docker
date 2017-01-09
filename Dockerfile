
FROM debian:jessie
#FROM debian:wheezy
ENV DEBIAN_FRONTEND=noninteractive
#ADD http://192.168.67.131/debian/trunk/piportal_0.0.3_all.deb /tmp/packages/
#ADD http://192.168.67.131/debian/trunk/libapache2-mod-fakessl_0.0.1_i386.deb /tmp/packages/
#ADD http://192.168.67.131/debian/trunk/libctm-fillbill-serverconnection-perl_11.096-1_all.deb /tmp/packages/
#COPY sources.list /etc/apt/sources.list
#RUN apt-get --yes --no-install-recommends install \
# libh323plus-dev libpt-dev
COPY yate /usr/src/yate
COPY yate-extra /usr/src/yate-extra
RUN apt-get update && apt-get --yes --no-install-recommends install \
 libspeex1 libgsm1 libasound2 libsctp1 \
 \
 build-essential pkg-config libasound2-dev ca-certificates \
 libpq-dev libmysqlclient-dev libssl-dev libgsm1-dev libspeex-dev \
 libspandsp-dev autoconf libsctp-dev libsqlite3-dev git \
 && cd /usr/src/yate \
 && ./autogen.sh \
 && ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --sysconfdir=/etc --disable-ilbc --enable-sctp \
 && make \
 && make install \
 && cd ../yate-extra \
 && make YATEDIR=../yate \
 && make install


# && make install \
# && apt-get --yes remove build-essential

#dahdi-source  wanpipe

#ENTRYPOINT ["/docker-entrypoint-fb.sh"]
CMD ["/usr/bin/yate", "-vvv"]

