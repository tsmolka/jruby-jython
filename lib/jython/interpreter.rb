# -*- coding: utf-8 -*-
# https://wiki.python.org/jython/CollectionsIntegration

java_import org.python.core.Py
java_import org.python.util.PythonInterpreter

module Jython
  PythonInterpreter = org.python.util.PythonInterpreter
  
  class Interpreter    
    public
    
    def initialize()
      @interpreter = PythonInterpreter.new()
    end
    
    def eval(code)
      obj = @interpreter.eval(code)
      return to_java(obj)
    end
    
    def exec(code, result=nil)
      @interpreter.exec(code)
      if !result.nil?
        to_java(@interpreter.get(result))
      end
    end
    
    def set(var, value)
      @interpreter.set(var, value)
    end
    
    def compile(code, result=nil)
      @interpreter.compile(code)
    end
    
    def to_java(obj)
      if obj.java_kind_of? org.python.core.PyBoolean
        Py.tojava(obj, "java.lang.Boolean")
      elsif obj.java_kind_of? org.python.core.PyInteger
        Py.tojava(obj, "java.lang.Integer")
      elsif obj.java_kind_of? org.python.core.PyLong
        Py.tojava(obj, "java.math.BigInteger")
      elsif obj.java_kind_of? org.python.core.PyString
        Py.tojava(obj, "java.lang.String")
      elsif obj.java_kind_of? org.python.core.PyList
        obj.toArray()
      elsif obj.java_kind_of? org.python.core.PyDictionary
        java.util.HashMap.new(obj)
      else
        obj.to_java.java_class
      end
    end
    
  end
end
