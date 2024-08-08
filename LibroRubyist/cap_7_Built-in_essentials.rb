# Chapter 7 Built-in Essential

# Customizing unary operators
class Banner
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end

  def +@
    @text.upcase
  end

  def -@
    @text.downcase
  end
end
banner = Banner.new("Eat at Joe's!")
puts +banner
puts -banner
