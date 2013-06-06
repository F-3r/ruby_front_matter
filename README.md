# RubyFrontMatter

simple &amp; extensible front matter parsing in text documents for ruby

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_front_matter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_front_matter

## Usage


### configuring front matter format and delimiter

  **RubyFrontMatter::Parser** allows to inject a custom parser for customizing the front matter format.

  For example, if you want **JSON** format

```ruby
 
   str = '
---
  {
    "front":   "matters",
    "matters": "front"
  }
---
'
  RubyFrontMatter::Parser(parser: JSON).parse(str)
  #=>  [{'front' => 'matters', 'matters' => 'front'}, '']
```

Any ruby object that responds to ```.load(string)``` can be used as parser.


### configuring delimiter string

```ruby
str = '
====
  {
    "front":   "matters",
    "matters": "front"
  }
====
'

p = RubyFrontMatter::Parser.new(delimiter: '====', parser: JSON)
#=> [{'front' => 'matters', 'matters' => 'front'}, '']
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
