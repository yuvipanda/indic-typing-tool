#!/bin/bash
HOST='http://localhost:3000'
DEST='/tmp/indic-typing'
SRC="$PWD"

rm -rf $DEST
mkdir -p $DEST
cd $DEST

mkdir javascripts
mkdir stylesheets

wget "$HOST/index.html"
wget "$HOST/javascripts/main.js" -O javascripts/main.js
wget "$HOST/stylesheets/main.css" -O stylesheets/main.css

cp -r "$SRC/libs" .
cp -r "$SRC/images" .
cp "$SRC/simple.manifest" .

rm -rf libs/jquery.ime/.git

echo "$DEST"
zip -r "$SRC/indic-typing.zip" .
