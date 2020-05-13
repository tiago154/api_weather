MIX=mix

compile:
	$(MIX) compile

run-test:
	$(MIX) test --color

coverage:
	$(MIX) coveralls.html --color && http-server cover/

docrun:
	$(MIX) docs && http-server doc/

run-dev:
	sh scripts\run-dev.sh

updatedocs:
	$(MIX) docs && cp -r doc priv/static
