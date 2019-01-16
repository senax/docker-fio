#
# vim: bg=dark
#
# docker run --rm -ti --entrypoint bash senax/docker-fio
# examples in /root/fio/examples
# docker run --rm $MOUNT:/data -v $DIR:/fio senax/docker-fio --output-format=json "/fio/$TEST_TYPE.fio" --bs="$BLKSIZE" --filename /data/test --size=$SIZEGB

FROM centos:centos7

MAINTAINER frank@crystalconsulting.eu

RUN yum -y install git make automake libtool pkgconfig libaio-devel python-six gnuplot  && yum clean all

RUN cd /root && git clone https://github.com/axboe/fio.git
RUN cd /root/fio && ./configure && make && make install

#CMD ["fio"]
ENTRYPOINT ["fio"]
