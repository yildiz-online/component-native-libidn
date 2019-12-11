#!/usr/bin/env bash

sed -i 's#/src/target/classes/win64/lib#/src/src/main/scripts/win64/libiconv/win64/lib#g' /src/src/main/scripts/win64/libiconv/win64/lib/libiconv.la
sed -i 's#/src/target/classes/win64/lib#/src/src/main/scripts/win64/libunistring/win64/lib#g' /src/src/main/scripts/win64/libunistring/win64/lib/libunistring.la
export $ LDFLAGS="-L/src/src/main/scripts/win64/libiconv/win64/lib -L/src/src/main/scripts/win64/libunistring/win64/lib" CFLAGS="-I/src/src/main/scripts/win64/libiconv/win64/include -I/src/src/main/scripts/win64/libunistring/win64/include"

cd ../..

rm -r c++

curl https://ftp.gnu.org/gnu/libidn/libidn2-2.3.0.tar.gz -o libidn2-2.3.0.tar.gz

tar xzf libidn2-2.3.0.tar.gz
mv libidn2-2.3.0 c++
rm libidn2-2.3.0.tar.gz

cd c++
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --disable-shared --enable-static
make

make install

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include
cp -r /usr/local/lib /src/target/classes/win64/
cp /usr/local/bin/libidn2-0.dll /src/target/classes/win64/lib/libidn2-0.dll
cp -r /usr/local/include /src/target/classes/win64/

exit ${r1}
