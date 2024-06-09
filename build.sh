#!/usr/bin/env bash

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Enable web support
flutter config --enable-web

# Run the build
flutter build web

# Move the build output to a directory named 'public'
mkdir -p public
cp -r build/web/* public/
