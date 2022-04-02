#!/bin/sh

V=1.0.7

if test Darwin = `uname -s`
then
    FETCH="curl"
else
    FETCH="wget -O -"
fi

# ${FETCH} http://www1.inf.tu-dresden.de/~ek1/TWM-Tweaked.sh  > TWM-Tweaked.sh

if test '!' '(' -f twm-${V}.tar.bz2 -a -f twm-${V}-tweaked-diffs.tar ')'
then
  mkdir twm.tweaked
  cd twm.tweaked
fi

if test '!' -f twm-${V}.tar.bz2
then
  ${FETCH} https://www.x.org/archive/individual/app/twm-1.0.7.tar.bz2  > twm-${V}.tar.bz2
# " http://xorg.freedesktop.org/archive/individual/app/twm-${V}.tar.bz2 " creates a html error page, so that's the result after attempting to climb a shreder by the grinders when it's active!
fi

if test '!' -f twm-${V}-tweaked-diffs.tar
then
  ${FETCH} http://www1.inf.tu-dresden.de/~ek1/twm_tweaks/twm-${V}-tweaked-diffs.tar  > twm-${V}-tweaked-diffs.tar
fi

tar -xjf twm-${V}.tar.bz2
tar -xf  twm-${V}-tweaked-diffs.tar

cd twm-${V}
tar -xzf ../twm-${V}-gitdiffs.tgz

for k in 0[0-9][0-9][0-9]-*.diff
do
  patch -p1 < ${k}
  if test $? -ne 0
  then
    echo "$0: Aborting, failed applying '${k}'"
    exit 1
  fi
done

rm src/gram.c

autoconf
./configure
make

cp src/twm ../
cp man/twm.1 ../

cd ../

strip twm

if test $# -eq 0
then
  rm -rf twm-${V}
fi
