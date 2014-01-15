#!/bin/sh -eu

SITE_PACKAGES="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"
SETUPTOOLS_URL="http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea"
SETUPTOOLS_NAME="setuptools-0.6c11-py2.7.egg"


if [ ! -e "$SITE_PACKAGES/$SETUPTOOLS_NAME" ]; then
	curl "$SETUPTOOLS_URL" > "$SETUPTOOLS_NAME"
	sudo sh "$SETUPTOOLS_NAME"
	rm "$SETUPTOOLS_NAME"
fi

for package in "pip readline"; do
    sudo easy_install "$package"
done

for package in "distribute simple_json dateutils ipython nose numpy scipy pyflakes"; do
    sudo pip install "$package"
done
