#!/usr/bin/env bash -e

INSTALL_PATH=$(pwd)

echo "Installing alcesleo/rubocop-config into $(pwd)"

# Install the dependency in the gemspec or Gemfile
if [ -f *.gemspec ]; then
    sed -i '' 's/^end/  spec.add_development_dependency "rubocop", "~> 0.48"\'$'\nend/g' *.gemspec
fi
