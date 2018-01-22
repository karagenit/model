module Belir

  class Equation
    attr_reader :output
    attr_reader :inputs

    def initialize(output, *inputs, &block)
      @output = output
      @inputs = inputs
      @lambda = block
    end

    def calculate(*inputs)
      # We splat via *inputs, b/c while it does this for long arrays, it will error
      # with single-element arrays like [2]: cant convert Array to Fixnum
      @lambda.call(*inputs)
    end
  end

  class System
    def initialize(*equations)
      @equations = equations
    end

    def add_equation(eqn)
      @equations.push(eqn)
    end

    def solve(vars)
      begin
        found = false

        @equations.each do |eqn|
          if vars[eqn.output].nil? && eqn.inputs.all? { |input| vars.key? input }
            args = []
            eqn.inputs.each do |input|
              args.push vars[input]
            end
            vars[eqn.output] = eqn.calculate(*args) # Splat to prevent [[2, 3]]
            found = true
          end
        end

      end while found
      vars
    end
  end

end
