echo "Going into javascipts/main.js directory"
cd javascripts/main.js/
coffee -c *.coffee
if [ -f bundled_js.js ];
then
    rm bundled_js.js
fi
cat *.js > bundled_js.js

echo "Going into stylesheets/main.css directory"
cd ../..
cd stylesheets/main.css/
lessc a.sidetap.less > a.sidetap.css
lessc b.theme.less > b.theme.css
if [ -f main.css ];
then
    rm main.css
fi
cat *.css > main.css

echo "Compilation Finished."
