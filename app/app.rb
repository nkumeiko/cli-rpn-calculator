require 'app/models/operators/binary'

Dir["#{ROOT}/app/models/operators/*.rb"].each { |file| require file }
Dir["#{ROOT}/app/models/**/*.rb"].each { |file| require file }

class App
  attr_accessor :terminal, :calculator

  def initialize
    self.terminal = Terminal.new
    self.calculator = Calculator.new
  end

  def run
    loop do
      input = terminal.read
      break if Tokenizer.eof?(input)

      begin
        output = calculator.apply(input)
        terminal.write(output)
      rescue ArgumentError => e
        terminal.write e.message
      end
    end
  end
end
