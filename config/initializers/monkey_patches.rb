class String
  def shift
    value = self[0]
    self.replace(self[1..-1])
    value
  end
end
