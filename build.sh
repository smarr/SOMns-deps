#!/bin/bash
set -e
(cd websocket         && ant jar source-jar)
(cd coveralls-truffle && ant jar source-jar)
(cd minimal-json      && ant jar source-jar)

mkdir -p build
mkdir -p build-source
mkdir -p build-dev
mkdir -p downloads

curl -o downloads/jline.jar https://repo1.maven.org/maven2/jline/jline/2.11/jline-2.11.jar
curl -o downloads/junit.jar https://repo1.maven.org/maven2/junit/junit/4.12/junit-4.12.jar
curl -o downloads/hamcrest-core.jar https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

cd build
jar -xf ../websocket/dist/websocket.jar
jar -xf ../coveralls-truffle/coveralls-truffle.jar
jar -xf ../minimal-json/build/minimal-json.jar
jar -xf ../downloads/jline.jar
cd ..

cd build-source
jar -xf ../websocket/dist/websocket-source.jar
jar -xf ../coveralls-truffle/coveralls-truffle-source.jar
jar -xf ../minimal-json/build/minimal-json-source.jar
cd ..

cd build-dev
jar -xf ../downloads/junit.jar
jar -xf ../downloads/hamcrest-core.jar
cd ..

jar -cvf somns-deps.jar        -C build .
jar -cvf somns-deps-source.jar -C build-source .
jar -cvf somns-deps-dev.jar    -C build-dev .
