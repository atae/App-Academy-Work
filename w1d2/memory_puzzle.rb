require_relative "board"
require_relative "player"
require "byebug"
class Game
  def initialize
    @board = []
    @player = HumanPlayer.new
  end

  def start_game
    @board = Board.new
    @board.populate
    puts "Welome to the game."
    @board.render
    play
  end

  def play
    @player.prompt
    @guess_input = @player.get_input
    @guess1 = make_guess(@guess_input)
    @player.recieve_revealed_cards(@guess_input, @guess1.face_value)
    @player.prompt
    @guess_input = @player.get_input
    @guess2 = make_guess(@guess_input)
    @player.recieve_revealed_cards(@guess_input, @guess2.face_value)
    sleep(3)
    system("clear")
    compare(@guess1, @guess2)

  end

  def make_guess(guess)
    # byebug
    guess_array = guess.split(",")
    guess_array.map! {|num| num.to_i}
    actual_pos = @board.board[guess_array[0]][guess_array[1]]
    actual_pos.reveal
    system("clear")
    @board.render
    actual_pos
  end

  def compare(guess1, guess2)
    if guess1 == guess2
      guess1.face_value = "X"
      guess2.face_value = "X"
    else
      guess1.hide
      guess2.hide
    end
    @board.render
    if @board.won?
      puts "You win!"
      puts "play again?"
      choice = gets.chomp.downcase
      start_game if choice == "y"
    end

    play
  end
end

 game = Game.new
 game.start_game
