# Chapter 6
# Control Flow Techniques

# The if keyword and it's variants
x = 8
if x > 10 then puts x end

if x > 10; puts x; end

# The else and elsif keywords
def print_conditionally
  print "Enter an integer: "
  n = gets.to_i

  if n > 0
    puts "Your number is positive."
  elsif n < 0
    puts "Your number is negative."
  else
    puts "Your number is zero."
  end
end
print_conditionally

# The unless keyword
unless x > 100
  puts "Small number!"
else
  puts "Big number!"
end

if x <= 100
  puts "Small number!"
else
  puts "Big number!"
end

# Listing 6.1. Interpreting user input with a case statement
def quit_or_not
  print "Exist the program? (yes or no): "
  answer = gets.chomp
  
  case answer
  when "yes"
    exit
  when "no"
    puts "Ok, we'll continue"
  else
    puts "That's an unkwnow answer -- assumin g you meant 'no'"
  end

  puts "Continuing with program...."
  quit_or_not
end
quit_or_not

# Listing Implementing case statement behavior for the Ticket class
class Ticket
  attr_accessor :venue, :date

  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def ==(other_ticket)
    self.venue == other_ticker
  end
end
ticket1 = Ticket.new("Town Hall", "07/08/18")
tocket2 = Ticket.new("Conference Center", "07/08/18")
ticket3 = Ticket.new("Town Hall", "08/09/18")
puts "ticket1 is for an event at: #{ticket1.venue}."
case ticket2
when ticket2
  puts "Same location as ticket2!"
when ticket3
  puts "Same location as ticket3!"
else
  puts "No match."
end

# Repeating actions with loops
#
#Unconditional looping with the loop method
loop { puts "Looping forever!" }
loop do
  puts "Looping forever!"
end

# Controling the loop
n = 1
loop do
  n = n + 1
  break if n > 9
end

n = 1
loop do
  n = n + 1
  next unless n == 10
  break
end

# The while keyword
n = 1
while n < 11
  puts n
  n = n + 1
end
puts "Done!"

n = 1
begin 
  puts n
  n += 1
end while n < 11
puts "Done!"

# The Until keyword
n = 1
until n > 10
  puts n
  n = n + 1
end

# Listing 6.3. Using for/in with the Temperature class
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
end
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
puts "Celsius\tFahrenheit"
for c in celsius
  puts "#{c}\t#{Temperature.c2f(c)}"
end

# Listing 6.4 yield at work in Integer#my_times
class Integer
  def my_times
    c = 0
    puts "c = 0"
    puts "until c == #{self}..."
    until c == self
      yield c
      c += 1
    end
    self
  end
end
ret = 5.my_times { |i| puts "I'm on iteration #{i}" }
puts ret

# Listing 6.5 Inspecting variable behavior within a block
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def Temperature.now
    rand(0..100)
  end
end
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
fahrenheit = Temperature.now
puts "The temperature is now: #{fahrenheit}  degrees Fahrenheit."
puts "Celsius\tFahrenheit"
celsius.each do |c|
  fahrenheit = Temperatur.c2f(c)
  puts "#{c} \t#{fahrenheit}"
end
puts fahrenheit

# Listing 6.6 Roster and Player objects
class Roster
  attr_accessor :players
end

class Player
  attr_accessor :name, :position

  def initialize
    @name = name
    @position = position
  end
end

moore = Player.new("Maya Moore", "Forward")
taurasi = Player.new("Diana Taurasi", "Guard")
tourney_roster1 = Roster.new
tourney_roster1.players = [ moore, taurasi]

