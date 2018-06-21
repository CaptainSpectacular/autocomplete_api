class AutoCompleter
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def insert(word)
    queue = word.chars
    ptr   = @root

    until queue.empty?
      char = queue.shift
      ptr = ptr.children[char] ||= Node.new(char)
      ptr.is_word = true if queue.empty?
    end

    word
  end

  def traverse(string)
    queue = string.chars
    ptr   = @root

    until queue.empty?
      char = queue.shift
      ptr.children[char] ? ptr = ptr.children[char] : return 
    end

    ptr 
  end


  def like?(string, suggestions = [])
    ptr = traverse(string)
    suggestions << string if ptr.is_word
    ptr.children.each do |letter, child|
      like?(string + letter, suggestions) 
    end

    suggestions.sort
  end
end
