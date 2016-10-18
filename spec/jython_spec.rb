require 'jython'

describe Jython do
  it 'has a version number' do
    expect(Jython::VERSION).not_to be nil
  end
end
