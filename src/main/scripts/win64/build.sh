#!/usr/bin/env bash

cd ../../c++
ls -l
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include

exit ${r1}