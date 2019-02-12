class Terminal
  def read
    STDOUT.print '> '
    STDIN.gets&.chomp&.strip
  rescue SystemExit, Interrupt
    'q'
  end

  def write(str)
    if str.is_a?(BigDecimal)
      str = str.to_f
    end

    STDOUT.puts str
  end
end
