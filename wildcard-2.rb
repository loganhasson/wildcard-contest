require 'pry'
class GenerateCards

  attr_accessor :total_time, :total_cards

  def initialize
    @total_time = 0
    @total_cards = 0
  end

  def generation
    [9, 10, 21, 20, 7, 11, 4, 15, 7, 7, 14, 5, 20, 6, 29, 8, 11, 19, 18,
     22, 29, 14, 27, 17, 6, 22, 12, 18, 18, 30]
  end

  def overhead
    [21, 16, 19, 26, 26, 7, 1, 8, 17, 14, 15, 25, 20, 3, 24, 5, 28, 9,
     2, 14, 9, 25, 15, 13, 15, 9, 6, 20, 27, 22]
  end

  def budget
    2912
  end

  def get_overhead(index)
    if index == 0
      0
    else
      self.overhead[0..index-1].each_with_index.map {|o,i| o*(index-i)}.inject(:+)
    end
  end

  def get_generation(index)
    self.generation[0..index].inject(:+)
  end

  def card_count(index)
    index + 1
  end

  def add_card(index)
    self.total_time = self.get_generation(index) + self.get_overhead(index)
  end

  def run
    self.generation.each_with_index do |c,i|
      self.add_card(i)
      if self.total_time <= self.budget
        self.total_cards = self.card_count(i)
      else
        self.total_cards = self.card_count(i-1)
        break
      end
      puts self.total_time
    end
  end

end

generator = GenerateCards.new
generator.run
puts generator.total_cards