module Operators
  class Division < Binary
    class << self
      def applicable?(operator)
        operator == '/'
      end

      def execute(a, b)
        raise ArgumentError, 'Division by zero' if b == 0

        a / b
      end
    end
  end
end
