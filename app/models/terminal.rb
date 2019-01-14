class Terminal
  def read
    STDOUT.print '> '
    STDIN.gets&.chomp&.strip
  rescue SystemExit, Interrupt
    'q'
  end

  def write(str)
    STDOUT.puts str
  end
end
