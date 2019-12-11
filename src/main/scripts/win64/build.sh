#!/usr/bin/env bash

#export $ LDFLAGS="-L/src/src/main/scripts/win64/libiconv/lib" CFLAGS="-I/src/src/main/scripts/win64/libiconv/include"

echo "Retrieving sources..."
cd ../../..

echo "Removing source"

rm -r c++

echo "Curl"

curl https://ftp.gnu.org/gnu/libidn/libidn2-2.3.0.tar.gz -o libidn2-2.3.0.tar.gz

echo "untar"

tar xvzf libidn2-2.3.0.tar.gz
mv libidn2-2.3.0 c++
rm libidn2-2.3.0.tar.gz

cd c++
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include

exit ${r1}
