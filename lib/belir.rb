module Belir
  ##
  # Represents an Equation with one output and multiple input values
  #
  class Equation
    attr_reader :output
    attr_reader :inputs

    def initialize(output, *inputs, &block)
      @output = output
      @inputs = inputs
      @lambda = block
    end

    def calculate(*inputs)
      # Note the splat (*inputs) to convert [2] => 2
      @lambda.call(*inputs)
    end
  end

  ##
  # Represents a set or System of Equations
  #
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
