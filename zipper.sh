#!/usr/bin/env bash
wget https://github.com/rinvex/cortex-installer/archive/master.zip
unzip master.zip -d working
cd working/cortex-master
composer install
zip -ry ../../cortex-craft.zip .
cd ../..
mv cortex-craft.zip public/cortex-craft.zip
rm -rf working
rm master.zip
