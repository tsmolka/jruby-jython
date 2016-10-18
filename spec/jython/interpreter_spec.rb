require 'jython'

describe Jython::Interpreter do
  let(:klass) { Jython::Interpreter }
  
  context ".initialize" do
    subject { interpreter }
    let(:interpreter) { klass.new() }
    it { should_not be_nil }
    
    describe '.eval' do
      it 'boolean' do
        expect(interpreter.eval('True')).to eq(true)
        expect(interpreter.eval('False')).to eq(false)
      end
      it 'integer' do
        expect(interpreter.eval('2+3')).to eq(5)
      end
      it 'long' do
        expect(interpreter.eval('2**100')).to eq(2**100)
      end
      it 'string' do
        expect(interpreter.eval('"ab"+"cd"')).to eq('abcd')
      end
      #it 'list' do
      #  expect(interpreter.eval('["a","b"]+["c","d"]')).to eq(['a','b','c','d'])
      #end
      it 'hash' do
        expect(interpreter.eval('{"a": "b", "c": "d"}')).to eq({'a' => 'b','c' => 'd'})
      end
    end
    describe '.exec' do
      it 'string' do
        expect(interpreter.exec('x="ab"+"cd"', 'x')).to eq('abcd')
      end
      #it 'list' do
      #  expect(interpreter.exec('x=["a","b"]+["c","d"];x.reverse()', 'x')).to eq(['d','c','b','a'])
      #end
    end
    describe '.compile' do
      it 'integer' do
        expect(interpreter.eval(interpreter.compile('2+3'))).to eq(5)
      end
      #it 'list' do
      #  expect(interpreter.exec(interpreter.compile('x=["a","b"]+["c","d"];x.reverse()'), 'x')).to eq(['d','c','b','a'])
      #end
    end
    describe '.set' do
      it 'integer' do
        interpreter.set('x', 2)
        expect(interpreter.eval('x+3')).to eq(5)
      end
    end
  end
  
end
