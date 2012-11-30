#!/bin/bash
HOST='http://localhost:3000'

rm -rf dist
mkdir -p dist
cd dist

mkdir javascripts
mkdir stylesheets

wget "$HOST/index.html"
wget "$HOST/javascripts/main.js" -O javascripts/main.js
wget "$HOST/stylesheets/main.css" -O stylesheets/main.css

cp -r ../libs .
cp -r ../images .
cp ../simple.manifest .

rm -rf libs/jquery.ime/.git
cd ..

mv dist indic-typing
zip -r indic-typing.zip indic-typing
