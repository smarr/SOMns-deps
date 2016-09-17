#!/bin/bash
set -e
(cd websocket         && ant jar source-jar)
(cd coveralls-truffle && ant jar source-jar)
(cd minimal-json      && ant jar source-jar)

mkdir -p build
mkdir -p build-source

cd build
jar -xf ../websocket/dist/websocket.jar
jar -xf ../coveralls-truffle/coveralls-truffle.jar
jar -xf ../minimal-json/build/minimal-json.jar
cd ..

cd build-source
jar -xf ../websocket/dist/websocket-source.jar
jar -xf ../coveralls-truffle/coveralls-truffle-source.jar
jar -xf ../minimal-json/build/minimal-json-source.jar
cd ..

jar -cvf somns-deps.jar -C build .
jar -cvf somns-deps-source.jar -C build-source .
