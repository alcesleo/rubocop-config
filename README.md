# RuboCop config

My personal [RuboCop](https://github.com/bbatsov/rubocop/) preferences.

## Installation

### Install RuboCop

```ruby
gem "rubocop", "~> 0.48"
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
probably want to `.gitignore` that:

```
.rubocop-https---raw-githubusercontent-com-alcesleo-rubocop-config-master--rubocop-yml
```
