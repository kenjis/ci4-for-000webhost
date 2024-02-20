#!/bin/bash

UPLOAD_DIR="kenjis.000webhostapp.com"

cd `dirname $0`/../

PROJECT=`basename $(pwd)`

cd ..

rm -rf "$UPLOAD_DIR.bk"
mv "$UPLOAD_DIR" "$UPLOAD_DIR.bk"

cp -pr "$PROJECT" "$UPLOAD_DIR"
rm -rf "$UPLOAD_DIR/.git"

zip -r "$UPLOAD_DIR.zip" "$UPLOAD_DIR" -x "*.DS_Store" "*__MACOSX*"

