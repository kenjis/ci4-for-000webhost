#!/bin/bash

UPLOAD_DIR="kenjis.000webhostapp.com"

cd "`dirname $0`"
cd ..

PROJECT=$(basename "$(pwd)")
composer install --no-dev

# Go to upper directory.
cd ..

# Remove old files.
rm -rf "$UPLOAD_DIR.bk"
mv "$UPLOAD_DIR" "$UPLOAD_DIR.bk"
rm -rf "app.zip"
rm -rf "public.zip"
rm -rf "vendor.zip"

# Copy current project files.
cp -pr "$PROJECT" "$UPLOAD_DIR"
rm -rf "$UPLOAD_DIR/.git"
rm -rf "$UPLOAD_DIR/tests"
rm -rf "$UPLOAD_DIR/writable"
rm -rf "$UPLOAD_DIR/.env"
rm -rf "$UPLOAD_DIR/.idea"

# Create Zip files.
cd "$UPLOAD_DIR"
zip -r "../$UPLOAD_DIR.zip" "." -x "*.DS_Store" "*__MACOSX*"
zip -r "../app.zip" "./app" -x "*.DS_Store" "*__MACOSX*"
zip -r "../public.zip" "./public" -x "*.DS_Store" "*__MACOSX*"
zip -r "../vendor.zip" "./vendor" -x "*.DS_Store" "*__MACOSX*"

echo
echo "\"../$UPLOAD_DIR.zip\" created."
