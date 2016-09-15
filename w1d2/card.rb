class Card
  attr_accessor :face_value, :face_up
  def initialize
    @face_up = false
    @face_value = 0
  end

  def display
    if !@face_up
      return "_"
    else
      return @face_value
    end
  end

  def change_value(num)
    @face_value = num
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(other_card)
    return true if @face_value == other_card.face_value
    false
  end
end
