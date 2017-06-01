#!/usr/bin/env bash -e

INSTALL_PATH=$(pwd)

echo "Installing alcesleo/rubocop-config into $INSTALL_PATH"

# Install the dependency in the gemspec or Gemfile
if [ -f *.gemspec ]; then
    echo "Installing development dependency in gemspec"

    # `-i ''` replaces in file without backup
    # `\'$'\n` creates the newline
    sed -i '' 's/^end/  spec.add_development_dependency "rubocop", "~> 0.48"\'$'\nend/' *.gemspec
elif [ -f Gemfile ]; then
    echo "Installing development dependency in Gemfile"
    echo 'gem "rubocop", "~> 0.48"' >> Gemfile
else
    echo "No gemspec or Gemfile found in $INSTALL_PATH"
    exit 1
fi
