class Node
  attr_reader :letter, :children
  alias_method :kids, :children

  def initialize(letter = '')
    @letter   = letter
    @children = Hash.new
  end
  
  def inspect
    @letter.to_s
  end
end
