#!/bin/bash

URLS=$(sticker-import --list | awk -F "[()]" '{print $2}' | grep t.me/)

for PACK in $(echo $URLS); do
	echo "Adding $PACK: "
	sticker-import $PACK
done

echo "Staging"
git add web/packs
echo "Committing"
git commit -m $(date +%s)
echo "Pushing"
git push
