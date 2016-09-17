#!/bin/bash
VERSION=`cat .version`
curl -T somns-deps-source.jar -usmarr:$BINTRAY_API_KEY https://api.bintray.com/content/smarr/SOM/SOMns-deps/$VERSION/somns-deps-source.jar?publish=1
curl -T somns-deps.jar -usmarr:$BINTRAY_API_KEY https://api.bintray.com/content/smarr/SOM/SOMns-deps/$VERSION/somns-deps.jar?publish=1
