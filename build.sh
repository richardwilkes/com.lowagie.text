#!/bin/bash

VERSION=2.1.7
BUILD_DIR=.build
MODULES_DIR=$HOME/code/java/gcs/modules

/bin/rm -rf $BUILD_DIR
/bin/rm -f $MODULES_DIR/com.lowagie.text*

mkdir $BUILD_DIR

javac -d $BUILD_DIR $(find src -name '*.java')

jar --create --file=$MODULES_DIR/com.lowagie.text@${VERSION}.jar --module-version=${VERSION} -C $BUILD_DIR . -C resources .

zip -r -9 -q $MODULES_DIR/com.lowagie.text@${VERSION}-src.zip src resources

/bin/rm -rf $BUILD_DIR
