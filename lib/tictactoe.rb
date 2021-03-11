class TicTacToe
  attr_reader :stdout
  def initialize(stdout)
    @stdout = stdout
  end

  def run
    stdout.puts("Welcome to TicTacToe")
  end
end

if $PROGRAM_NAME == __FILE__
  TicTacToe.new($stdout).run
end