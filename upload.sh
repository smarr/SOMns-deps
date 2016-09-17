#!/bin/bash
VERSION=`cat .version`
BINTRAY_API_KEY=c0aa8fadc8f18afaa833761be21bea0f570bc0b0
curl -H "X-Bintray-Override: 1" -H "X-Bintray-Publish: 1" \
  -T somns-deps-source.jar \
  -usmarr:$BINTRAY_API_KEY \
  https://api.bintray.com/content/smarr/SOM/SOMns-deps/$VERSION/somns-deps-source-$VERSION.jar
curl -H "X-Bintray-Override: 1" -H "X-Bintray-Publish: 1" \
  -T somns-deps.jar \
  -usmarr:$BINTRAY_API_KEY \
  https://api.bintray.com/content/smarr/SOM/SOMns-deps/$VERSION/somns-deps-$VERSION.jar
curl -H "X-Bintray-Override: 1" -H "X-Bintray-Publish: 1" \
  -T somns-deps-dev.jar \
  -usmarr:$BINTRAY_API_KEY \
  https://api.bintray.com/content/smarr/SOM/SOMns-deps/$VERSION/somns-deps-dev-$VERSION.jar
