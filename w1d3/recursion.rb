require "byebug"
def range(start_num,end_num)
  return [] if end_num < start_num
  return [end_num] if start_num == end_num

  range(start_num, end_num-1) + [end_num]

end

def range_it(start_num, end_num)
  (start_num..end_num).to_a
end

def exp1(base, exp)
  return 1 if exp == 0
  base * exp1(base,exp-1)
end

def exp2(base, exp)
  return 1 if exp == 0
  return base if exp == 1

  if exp.even?
    even_prev_step = exp2(base, exp/2)
    even_prev_step * even_prev_step
  else
    odd_prev_step = exp2(base, (exp-1)/2)
    base*odd_prev_step*odd_prev_step
  end
end

class Array
  def deep_dup
    self.map do |el|
       el.is_a?(Fixnum)? el : el.deep_dup
    end
  end
end

def fib(n)
  return [0] if n == 0
  return [0,1] if n == 1

  prev_arr = fib(n-1)
  prev_num1 = prev_arr[-1]
  prev_num2 = prev_arr[-2]
  sum = prev_num1 + prev_num2

  prev_arr + [sum]
end

def bsearch(array, target)
  return nil unless array.include?(target)
  return 0 if array.length == 1
  half = (array.length - 1) / 2
  left_array = array[0..(half - 1)]
  right_array = array[(half + 1)..-1]

  if target == array[half]
    return half
  elsif target < array[half]
    half += (-1) + bsearch(left_array, target)
  elsif target > array[half]
    half += (1) + bsearch(right_array, target)
  end
end

def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1
  half = array.length/2
  if array.length == 2
    left_array = array[0...(half)]
    right_array = array[half..-1]
  else
    left_array = array[0..half]
    right_array = array[(half+1)..-1]
  end

  left_merged = merge_sort(left_array)
  right_merged = merge_sort(right_array)


  merge(left_merged, right_merged)

end

def merge(left_array, right_array)
  merged = []
  until left_array.length == 0 || right_array.length == 0
    if left_array.first < right_array.first
      merged << left_array.shift
    elsif left_array.first > right_array.first
      merged << right_array.shift
    else
      merged << left_array.shift
      merged << right_array.shift
    end
  end
  merged + left_array + right_array
end

def subsets(arr)
  current_subsets = []
  return [[]] if arr.length == 0
  return [[],[1]] if arr.length == 1

  current_subsets << [arr.last]
  prev_arr = arr.take(arr.length-1)

  if arr.length > 2
    prev_arr.each do |num|
      current_subsets << [num, arr.last]
    end
  end

  current_subsets << arr

  subsets(prev_arr) + current_subsets
end

def greedy_make_change(amt, coins = [25, 15, 10 ,1])
  return [] if amt == 0

  # debugger

  coins.each do |coin|
    if amt - coin >= 0
      return greedy_make_change(amt - coin) + [coin]
    end
  end
end

def make_change(amt, coin = [25,15,10,1])
  best_sol = []
  coin.each do |coin_largest|
    current_sol = []    
    coin.each do |coin_next|
      current_amt = amt - coin_largest - coin_next
      if current_amt < 0
        next
      elsif current_amt > 0
        current_sol << make_change(amt - coin_next)
      else
        current_sol << coin_largest
      end
    end

    if current_sol.length < best_sol.length
      best_sol = current_sol
    end
  end

  best_sol
end
