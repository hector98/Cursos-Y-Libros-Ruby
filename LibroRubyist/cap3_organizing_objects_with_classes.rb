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

# Autumating the creation of attributes
# Listing 3.2. Ticket class, with the attribute reader/writer methods spelled out.
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def price(price)
    @price = price
  end

  def venue
    @venue
  end

  def date
    @date
  end

  def price
    @price
  end
end

# Listing 3.3. Ticket class, with getter and setter methods defined via sttr *calls.
class Ticket  
  attr_reader :venue, :date, :price
  attr_write :price

  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

# Inheritance and the Ruby class hirarchy
class Plublication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end
mag = Magazine.new
mag.publisher = "David A. Black"
mag.editor = "Joe Leo"
puts "Mag is published by #{mag.publisher} and edited by #{mag.editor}."

class Person
  def species
    "Homo Sapiens"
  end
end
class Rubyist < Person
end
hector = Rubyist.new
puts hector.species

# Object ancestry and the not-so-missing link: the Object class
obj= Object.new

class C
end
class D < C
end
puts D.superclass
puts D.superclass.superclass

# Basic use of constants
class Ticket
  VENUES = ["Convetion Center", "Fairgrounds", "Town Hall"]

  def initialize(venue, date)
    if VENUES.include?(venue) # Is This one of the known venues?
      @venue = venue
    else
      raise ArgumentError, "Unknown venue: #{venue}" # Raises an exception (fatal error--see chap. 6).
    end

    @date = date
  end
end
puts "We've closed the class definition."
puts "So we have to use the path notation to reach the constant."
puts "The venues are:"
puts Ticket::VENUES
