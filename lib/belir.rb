module Belir

  class Equation
    attr_reader :inputs

    def initialize(output, *inputs, &block)
      @output = output
      @inputs = inputs
      @lambda = block
    end

    def calculate(*inputs)
      # Convert 1 len arrays to fixnum, fixes weird behavior w/ lambda.call
      inputs = inputs[0] if inputs.length == 1
      @lambda.call(inputs)
    end
  end

  class System
    def initialize
      @equations = []
    end
    def solve
      {}
    end
  end

end
