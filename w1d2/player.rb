class HumanPlayer

  def initialize(name="Joe")
    @name = name
    @odd = true
    @known_cards = Hash.new { |hash, key| hash[key] =  []}
  end

  def prompt
    if @odd
      puts "Give me a position: "
      @odd = false
    else
      puts "Give me another position: "
      @odd = true
    end
  end

  def get_input
    gets.chomp
  end

  def recieve_revealed_cards(pos_array, value)

  end
end

class ComputerPlayer < HumanPlayer

  # def initialize
  #   @known_cards = Hash.new { |hash, key| hash[key] =  []}
  # end

  def recieve_revealed_cards(pos_array, value)
    if @known_cards[value].empty?
      @known_cards[value] << pos_array
    else
      @known_cards[value] << pos_array
    end
  end

  def get_input
    @known_cards.values.each do |val|
      if val.length == 2
        return @known_cards[val][0]
      else
        return computer_guess
      end
    end
  end

  def computer_guess

  end
end
