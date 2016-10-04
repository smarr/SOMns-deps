#!/bin/bash
VERSION=`cat .version`
if [ -z "$BINTRAY_API_KEY" ]; then
  echo "Bintray API Key not available, please set BINTRAY_API_KEY"
fi
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
