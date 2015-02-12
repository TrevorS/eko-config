# EkoConfig

Parses EkoConfig configuration files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eko-config'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eko-config

## Usage

```ruby
# load file
path = Pathname.new('settings').join('config.ini')
file = EkoConfig.parse(path)

# accessor
file['header']['project'] # "Programming Test"

# mutator
file['section']['pretty'] = 'awesome'

# write file
new_path = Pathname.new('settings').join('new.ini')
EkoConfig.write(file, new_path)
```
