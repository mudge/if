class BasicObject
  def if(if_true, _options = {})
    if_true.call
  end

  def if_true
    yield

    self
  end

  def if_false
    self
  end
end

module Falsey
  def if(_if_true, options = {})
    if_false = options.fetch(:else, -> {})

    if_false.call
  end

  def if_true
    self
  end

  def if_false
    yield

    self
  end
end

class NilClass
  include Falsey
end

class FalseClass
  include Falsey
end
