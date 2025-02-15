#!/bin/bash
set -e
(cd websocket         && ant jar source-jar)
(cd coveralls-truffle && ant jar source-jar)

mkdir -p build
mkdir -p build-source
mkdir -p build-dev
mkdir -p downloads

curl -o downloads/junit.jar https://repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar
curl -o downloads/gson.jar  https://repo1.maven.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar
curl -o downloads/hamcrest-core.jar https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

cd build
jar -xf ../websocket/dist/websocket.jar
jar -xf ../coveralls-truffle/coveralls-truffle.jar
jar -xf ../downloads/gson.jar
cd ..

cd build-source
jar -xf ../websocket/dist/websocket-source.jar
jar -xf ../coveralls-truffle/coveralls-truffle-source.jar
cd ..

cd build-dev
jar -xf ../downloads/junit.jar
jar -xf ../downloads/hamcrest-core.jar
cd ..

jar -cvf somns-deps.jar        -C build .
jar -cvf somns-deps-source.jar -C build-source .
jar -cvf somns-deps-dev.jar    -C build-dev .
