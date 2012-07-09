require "minitest/autorun"
require_relative "../lib/if"

describe BasicObject do
  let(:object) { BasicObject.new }

  it "always evaluates the first block to if" do
    object.if(->{ "I'm true!" }).must_equal "I'm true!"
  end

  it "ignores any else blocks" do
    object.if(->{ "I'm true!" },
        else: ->{ "Not false!" }).must_equal "I'm true!"
  end
end

describe NilClass do
  it "always returns the else block" do
    nil.if(-> { "I'm true!" },
        else: ->{ "I'm false!" }).must_equal "I'm false!"
  end

  it "does nothing by default" do
    nil.if(-> { "I'm true!" }).must_be_nil
  end
end

describe FalseClass do
  it "always returns the else block" do
    false.if(-> { "I'm true!" },
        else: ->{ "I'm false!" }).must_equal "I'm false!"
  end

  it "does nothing by default" do
    false.if(-> { "I'm true!" }).must_be_nil
  end
end

