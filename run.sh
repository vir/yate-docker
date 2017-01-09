#!/bin/sh

DIR="$( cd -P "$( dirname "$0" )" && pwd )"

CONF=conf

if [ ! -d ${CONF} ]
then
	echo "No '${CONF}' directory found"
	exit 1
fi

docker run -it --rm -e xxx=SOMEVALUE -v ${DIR}/${CONF}:/etc/yate virrus/yate



