# if [![Build Status](https://secure.travis-ci.org/mudge/if.png?branch=master)](http://travis-ci.org/mudge/if)

See "[Implementing `if` in Ruby](http://mudge.github.com/2012/07/09/implementing-if-in-ruby.html)" for more information.

## Requirements

The gem currently requires Ruby 1.9 onwards as it makes use of both the new
hash and lambda syntax.

## Usage

```ruby
require "if"

"Some truthy object".if ->{ "I'm true!" }, else: ->{ "I'm false!" }
#=> "I'm true!"

nil.if ->{ "I'm true!" }, else: ->{ "I'm false!" }
#=> "I'm false!"

# Or, if you only care about side-effects and not return value:

"Some truthy object"
  .if_true { puts "I'm true!" }
  .if_false { puts "I'm false!" }
# "I'm true!"
#=> "Some truthy object"

nil
  .if_true { puts "I'm true!" }
  .if_false { puts "I'm false!" }
# "I'm false!"
#=> nil
```
