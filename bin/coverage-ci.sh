#!/usr/bin/env bash

# Effective test coverage
# Why --no-test-assets : https://github.com/flutter/flutter/issues/35907
flutter test --coverage --no-test-assets

# Install https://pub.dev/packages/remove_from_coverage
pub global activate remove_from_coverage

export PATH="$PATH":"$HOME/.pub-cache/bin"

# Remove Generate dart files
remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
