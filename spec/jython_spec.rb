require 'jython'

describe Jython do
  it 'has a version number' do
    expect(Jython::VERSION).not_to be nil
  end  
  describe '#Main' do
    
    #specify { expect { Jython::Main(['-c', 'print 2+3']) }.to output("5\n").to_stdout }
  
    it 'executes inline command' do
      expect { print("5\n") }.to output("5\n").to_stdout
    end
  end  
end
