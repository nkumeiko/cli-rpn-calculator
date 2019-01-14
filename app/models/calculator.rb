class Calculator
  OPERATORS = [
    Operators::Addition,
    Operators::Division,
    Operators::Multiplication,
    Operators::Subtraction,
  ]

  def initialize
    self.operands = []
  end

  def apply(str)
    tokens = Tokenizer.tokenize(str)
    tokens.each { |token| process_token(token) }
    operands.last
  end

  private

  attr_accessor :operands

  def numeric?(str)
    Float(str) != nil
  rescue ArgumentError
    false
  end

  def find_operator(token)
    OPERATORS.each do |operator|
      return operator if operator.applicable?(token)
    end

    raise ArgumentError, "#{token.inspect} isn't a supported operator. " \
                         "Please, use '+', '-', '*', or '/'."
  end

  def process_token(token)
    if numeric?(token)
      operands << Float(token)
    else
      operator = find_operator(token)
      validate_operator(operator)
      apply_operator(operator)
    end
  end

  def validate_operator(operator)
    if operator.number_of_operands > operands.length
      raise ArgumentError, 'Not enough operands.'
    end
  end

  def apply_operator(operator)
    current_operands = operands.pop(operator.number_of_operands)
    operands << operator.execute(*current_operands)
  end
end
