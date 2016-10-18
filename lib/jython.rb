require 'jython/version'
require 'java'
require File.expand_path("../../dist/jython-standalone.jar", __FILE__)
require 'jython/interpreter'

module Jython
  def self.Main(argv=ARGV)
    Java::org.python.util.jython.main(argv)
  end
end
