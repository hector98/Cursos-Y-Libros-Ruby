# Rubyist
# Capitulo 2: Objetos, Metodos y Variables Locales

# Defing an object's behavior
obj = Object.new
def obj.talk
  puts "I'm an an object"
  puts "(Do you object?)"
end

obj.talk

# Methods that take arguments
obj2 = Object.new
def obj2.c2f(c)
  c * 9.0 / 6 + 32
end

puts obj2.c2f(100)

# Creating the ticket object
ticket = Object.new

def ticket.date
  "1903-01-02"
end

def ticket.venue
  "Town Hall"
end

def ticket.event
  "Author's reading"
end

def ticket.performer
  "Mark Twain"
end

def ticket.seat
  "Second Balcony, row J, seat 12"
end

def ticket.price
  5.50
end

# Querying the ticket object
print "This ticket is for: "
print ticket.event + ", at "
print ticket.venue + ", on "
puts ticket.date + "."
print "The perfmormer is "
puts ticket.performer
print "The seat is "
print "and it costs $"
puts "%.2f" % ticket.price # Prints floating-point number to two decimal places

# Shortening the ticket code via string interpolation
puts "This ticket is for: #{ticket.event}, at #{ticket.venue}. \n" +
  "The performer is #{ticket.performer}. \n" +
  "The seat is #{ticket.seat}, " +
  "and it costs $#{"%.2f" % ticket.price}."

# Identifying the objects uniquely with the object_id method
obj = Object.new
puts "The id of obj is #{obj.object_id}."
str = "Strings are obnjects too, and this is a string!"
puts "The id of the string object str is #{str.object_id}."
puts "And the id of the integer 100 is #{100.object_id}."
