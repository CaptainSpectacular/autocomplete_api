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
    end

    word
  end

  def traverse(string)
    ptr = @root

    until string.empty?
      char = string.shift
      ptr.children[char] ? ptr = ptr.children[char] : return 
    end

    ptr 
  end
end
