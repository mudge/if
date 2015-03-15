require 'if'

RSpec.describe BasicObject do
  let(:object) { BasicObject.new }

  describe '#if' do
    it 'always evaluates the first block to if' do
      expect(object.if(-> { "I'm true!" })).to eq("I'm true!")
    end

    it 'ignores any else blocks' do
      expect(object.if(-> { "I'm true!" },
                       else: -> { "I'm false!" })).to eq("I'm true!")
    end
  end

  describe '#if_true' do
    it 'evaluates the given block' do
      expect { object.if_true { puts "I'm true!" } }
        .to output("I'm true!\n").to_stdout
    end

    it 'returns the object for chaining' do
      expect(object.if_true { "I'm true!" }).to eq(object)
    end
  end

  describe '#if_false' do
    it 'returns self' do
      expect(object.if_false { "I'm false!" }).to eq(object)
    end
  end

  describe 'chaining #if_true and #if_false' do
    it 'evaluates based on the original object' do
      expect { object.if_true { puts "I'm true!"; false }
                     .if_false { puts "I'm false!" } }
        .to output("I'm true!\n").to_stdout
    end
  end
end

RSpec.describe NilClass do
  describe '#if' do
    it 'always returns the else block' do
      expect(nil.if(-> { "I'm true!" },
                    else: -> { "I'm false!" })).to eq("I'm false!")
    end

    it 'does nothing by default' do
      expect(nil.if(-> { "I'm true!" })).to be_nil
    end
  end

  describe '#if_true' do
    it 'returns self' do
      expect(nil.if_true { "I'm true!" }).to be_nil
    end
  end

  describe '#if_false' do
    it 'evaluates the given block' do
      expect { nil.if_false { puts "I'm false!" } }
        .to output("I'm false!\n").to_stdout
    end

    it 'returns nil' do
      expect(nil.if_false { "I'm false!" }).to be_nil
    end
  end

  describe 'chaining #if_false and #if_true' do
    it 'evaluates based on the original object' do
      expect { nil.if_false { puts "I'm false!"; true }
                  .if_true { puts "I'm true!" } }
        .to output("I'm false!\n").to_stdout
    end
  end
end

RSpec.describe FalseClass do
  describe '#if' do
    it 'always returns the else block' do
      expect(false.if(-> { "I'm true!" },
                      else: -> { "I'm false!" })).to eq("I'm false!")
    end

    it 'does nothing by default' do
      expect(false.if(-> { "I'm true!" })).to be_nil
    end
  end

  describe '#if_true' do
    it 'returns self' do
      expect(false.if_true { "I'm true!" }).to eq(false)
    end
  end

  describe '#if_false' do
    it 'evaluates the given block' do
      expect { false.if_false { puts "I'm false!" } }.to output("I'm false!\n").to_stdout
    end

    it 'returns nil' do
      expect(false.if_false { "I'm false!" }).to eq(false)
    end
  end

  describe 'chaining #if_false and #if_true' do
    it 'evaluates based on the original object' do
      expect { nil.if_false { puts "I'm false!"; true }
                  .if_true { puts "I'm true!" } }
        .to output("I'm false!\n").to_stdout
    end
  end
end
