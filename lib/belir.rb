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
      # Convert 1 len arrays to fixnum, fixes weird behavior w/ lambda.call
      inputs = inputs[0] if inputs.is_a?(Array) && inputs.length == 1
      # And again, because solve could create a one elem array that is boxed into another array
      inputs = inputs[0] if inputs.is_a?(Array) && inputs.length == 1
      @lambda.call(inputs)
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
            vars[eqn.output] = eqn.calculate(args)
            found = true
          end
        end

      end while found
    end
  end

end
