#!/usr/bin/env bash -e

INSTALL_PATH=$(pwd)

echo "Installing alcesleo/rubocop-config into $INSTALL_PATH"

# Install the dependency in the gemspec or Gemfile
if [ -f *.gemspec ]; then
    echo "- Adding development dependency in gemspec"

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

# Add the inherit statement to .rubocop.yml
echo "- Adding inherit_from in .rubocop.yml "
echo -e "inherit_from:\n  - https://raw.githubusercontent.com/alcesleo/rubocop-config/master/.rubocop.yml\n$(cat .rubocop.yml 2>/dev/null)" > .rubocop.yml

# Add it to .gitignore
echo ".rubocop-https---raw-githubusercontent-com-alcesleo-rubocop-config-master--rubocop-yml" >> .gitignore
