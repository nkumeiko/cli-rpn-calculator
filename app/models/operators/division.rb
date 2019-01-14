module Operators
  class Division < Binary
    class << self
      def applicable?(operator)
        operator == '/'
      end

      def execute(a, b)
        a / b
      end
    end
  end
end
