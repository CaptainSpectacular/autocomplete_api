class Node
  attr_reader :letter, :children
  attr_accessor :is_word
  alias_method :kids, :children

  def initialize(letter = '')
    @letter   = letter
    @children = Hash.new
    @is_word  = false 
  end
  
  def inspect
    @letter.to_s
  end
end
