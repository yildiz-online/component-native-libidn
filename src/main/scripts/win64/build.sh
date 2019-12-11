#!/usr/bin/env bash

export $ LDFLAGS="-L/src/src/main/scripts/win64/libiconv/lib" CFLAGS="-I/src/src/main/scripts/win64/libiconv/include"

cd ../..

rm -r c++

curl https://ftp.gnu.org/gnu/libidn/libidn2-2.3.0.tar.gz -o libidn2-2.3.0.tar.gz

tar xzf libidn2-2.3.0.tar.gz
mv libidn2-2.3.0 c++
rm libidn2-2.3.0.tar.gz

cd c++
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

make install

cd /src/src/main/scripts/win64/
ls -l

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include
cp /usr/local/lib/libidn2.a /src/target/classes/win64/lib/libidn2.a
cp /usr/local/lib/libidn2.dll.a /src/target/classes/win64/lib/libidn2.dll.a
cp /usr/local/bin/libidn2-0.dll /src/target/classes/win64/lib/libidn2-0.dll
cp -r /usr/local/include /src/target/classes/win64/

exit ${r1}
