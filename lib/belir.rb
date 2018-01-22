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
      inputs = inputs[0] if inputs.length == 1
      @lambda.call(inputs)
    end
  end

  class System
    def initialize
      @equations = []
    end

    def add_equation(eqn)
      @equations.push(eqn)
    end

    def solve(vars)
      begin
        found = false

        @equations.each do |eqn|
          if vars[eqn.output].nil? && eqn.inputs.all? { |in| vars.key? in }
            args = eqn.inputs.clone
            args.collect! do |arg|
              vars[arg]
            end
            vars[eqn.output] = eqn.calculate(args)
            found = true
          end
        end

      end while found
    end
  end

end
