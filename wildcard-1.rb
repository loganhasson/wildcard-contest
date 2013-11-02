require 'awesome_print'

class WildCard

  attr_accessor :text_array, :possibilities

  def initialize(input_file)
    make_array(input_file)
    self.possibilities = 0
    self.get_possibilities(self.text_array)
    self.get_possibilities(self.make_column_array)
  end

  def make_array(file)
    self.text_array = File.read(file).each_line.map {|line| line.chomp.chars}
  end

  def factorial(num)
    (1..num).inject(:*)
  end

  def get_possibilities(array)
    array.each do |row|
      next if row.count("*") < 5
      if row.count("*") == 5
        self.possibilities += 120
      else
        n = row.count("*")
        self.possibilities += (factorial(n)/factorial(n-5))
      end
    end
  end

  def make_column_array
    max_index = self.text_array.length - 1
    (0..max_index).map do |i|
      (0..max_index).map do |c|
        self.text_array[c][i]
      end
    end
  end
end

test = WildCard.new('problem1input.txt')
puts test.possibilities