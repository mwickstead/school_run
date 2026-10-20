#!/bin/sh
# Stamp a new build id so open apps update themselves
sed -i "s/const BUILD='[^']*'/const BUILD='$(date +%Y%m%d%H%M%S)'/" index.html
