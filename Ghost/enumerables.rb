class Array
  def my_each(&blk)
    for value in self
      blk.call(value)
    end
  end

  def my_select(&blk)
    selected = []

    self.my_each do |value|
      selected << value if blk.call(value)
    end

    selected
  end

  def my_reject(&blk)
    selected = []

    self.my_each do |value|
      selected << value unless blk.call(value)
    end

    selected
  end

  def my_any?(&blk)
    for value in self
      return true if blk.call(value)
    end

    false
  end

  def my_all?(&blk)
    for value in self
      return false unless blk.call(value)
    end

    true
  end

  def my_flatten
    flattened = []

    self.each do |elem|
      if elem.is_a?(Array)
        flattened += elem.my_flatten
      else
        flattened << elem
      end
    end

    flattened
  end

  def my_zip(*inputs)
    zipped = []
    num_inputs = inputs.length

    self.length.times do |i|
      zipped_el = [self[i]]

      inputs.each do |input_el|
        zipped_el << input_el[i]
      end

      zipped << zipped_el
    end

    zipped
  end

  def my_rotate(rotations = 1)
    rotated = self.dup

    if rotations > 0
      rotations.times do
        rotated << rotated.shift
      end
    else
      rotations.abs.times do
        rotated.unshift(rotated.pop)
      end
    end

    rotated
  end

  def my_join(separator = "")
    to_be_joined = self.dup
    joined = ""
    joined << to_be_joined[0]

    (1...self.length).each do |elem|
      joined << separator + to_be_joined[elem]
    end

    joined
  end

  def my_reverse
    to_be_reversed = self.dup
    reversed = []
    to_be_reversed.length.times do
      reversed << to_be_reversed.pop
    end

    reversed
  end
end
