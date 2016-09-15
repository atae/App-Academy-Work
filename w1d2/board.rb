# require 'byebug'
require_relative "card"

class Board
  attr_accessor :board
  def initialize
    @board = Array.new(3) {Array.new(6) {Card.new}}
    # @board = [[], [], []]
  end

  def won?
    @board.each do |row|
      row.each do |space|
        return false unless space.face_value == "X"
      end
    end
    # @board.each do |card|
    #   unless card.face_up
    #     return false
    #   end
    # end
    true
  end

  def populate
    # byebug
    deck = (1..9).to_a
    deck = deck.concat(deck).shuffle
    @board.each do |row|
      row.each do |space|
        space.change_value(deck.shift)
      end
    end
  end

  def render
    puts "  A B C D E F"
    @board.each_with_index do |row, row_num|
        print "#{row_num + 1} "
      row.each do |card|
        print "#{card.display} "
      end
        puts "\n"

    end
  end
end

# board = Board.new
# board.populate
