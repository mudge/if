class BasicObject
  def if(if_true, options = {})
    if_true.call
  end
end

module Falsey
  def if(if_true, options = {})
    if_false = options.fetch(:else, ->{})

    if_false.call
  end
end

class NilClass
  include Falsey
end

class FalseClass
  include Falsey
end

