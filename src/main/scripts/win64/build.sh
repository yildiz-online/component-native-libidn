#!/usr/bin/env bash

#export $ LDFLAGS="-L/src/src/main/scripts/win64/libiconv/lib" CFLAGS="-I/src/src/main/scripts/win64/libiconv/include"

autoreconf -f -i
cd ../../c++
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include

exit ${r1}