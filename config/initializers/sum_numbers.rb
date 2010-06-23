class Array
  def sum_numbers(&block)
    map(&block).find_all {|x| x.is_a? Numeric }.sum
  end
end