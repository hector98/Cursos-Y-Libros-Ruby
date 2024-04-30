# Capitulo 3: Organizando Objetos con Clases

# Classes and Instances
class Ticket
  def event
    "Can't really be specified yet..."
  end
end
ticket = Ticket.new
puts ticket.event

# Overriding methods
class C
  def m
    puts "First definition of method m"
  end

  def m 
    puts "Second definition of method m"
  end
end
C.new.m

# Instance variables and object state
# Listing 3.1 An instance variable maintaining its value between methods calls.
class Person 
  def set_name(string)
    puts "Setting person's name..."
    @name = string
  end
  
  def get_name
    @name
  end
end
hector = Person.new
hector.set_name("Hector")
puts hector.get_name

# Initializing an object with state
class Ticket
  def initialize(venue, date)
    #puts "Creating a new ticket!"
    @venue = venue
    @date = date
  end

  def venue
    @venue
  end

  def date
    @date
  end
end
th = Ticket.new("Town Hall", "2013-11-12")
cc = Ticket.new("Convetion Center", "2014-02-13")
puts "We've created two tickets."
puts "The first is for a #{th.venue} even on #{th.date}."
puts "The second is for an event on #{cc.venue} at #{cc.date}."

# Setter methods unleashed
class Silly
  def price=(x)
    puts "The current time is #{Time.now}."
  end
end
s = Silly.new
s.price = 111.22

# Exercises 1
class Ticket
  def initialize(venue)
    @venue = venue
  end

  def set_price(price)
    @price = price
  end

  def price
    @price
  end

  def discount(amount)
    @price - (@price * (amount * 0.01))
  end
end
tk = Ticket.new("Town Hall")
tk.set_price(100)
puts "The ticket for #{tk.venue} has been discounted 15% to #{tk.discount(15)}."

