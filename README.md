# RuboCop config

My personal [RuboCop](https://github.com/bbatsov/rubocop/) preferences.

## Installation

### Quick installation

The `install.sh` script tries to follow the instructions below automatically. For normal projects, this oneliner should do everything you need:

```bash
bash <(curl -s https://raw.githubusercontent.com/alcesleo/rubocop-config/master/install.sh)
```

**Otherwise, follow the manual instructions:**

### Install RuboCop

```ruby
# Gemfile
gem "rubocop", "~> 0.48"

# If it's a gem, add this to the gemspec instead
spec.add_development_dependency "rubocop", "~> 0.48"
```

### .rubocop.yml

Put this at the top of your local `.rubocop.yml`:

```yml
inherit_from:
  - https://raw.githubusercontent.com/alcesleo/rubocop-config/master/.rubocop.yml
```

### Rakefile

This lets you run `rake style` and `rake style:auto_correct`.

```ruby
require "rubocop/rake_task"
RuboCop::RakeTask.new(:style) do |t|
  t.options = ["--display-cop-names"]
end
```

### .gitignore

RuboCop will download the config file and put it in your root directory, you
might want to `.gitignore` that:

```
.rubocop-https---raw-githubusercontent-com-alcesleo-rubocop-config-master--rubocop-yml
```

## Code Climate

Code Climate currently does not allow RuboCop to download this file, and will
instead give you an error. You can however tell Code Climate to download the
file to the location where RuboCop expects it using its [prepare
step](https://docs.codeclimate.com/docs/configuring-the-prepare-step),
bypassing this issue.

To do this, put this in your `.codeclimate.yml`:

```yaml
prepare:
  fetch:
  - url: "https://raw.githubusercontent.com/alcesleo/rubocop-config/master/.rubocop.yml"
    path: ".rubocop-https---raw-githubusercontent-com-alcesleo-rubocop-config-master--rubocop-yml"
```
