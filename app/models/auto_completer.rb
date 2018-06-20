class AutoCompleter
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word)
    origin = @root
    queue  = word.chars

    until queue.empty?
      char = queue.shift
      case origin.children[char]
      when nil then origin = origin.children[char] = Node.new(char)
      else          origin = origin.children[char]
      end
    end

    word
  end
end
