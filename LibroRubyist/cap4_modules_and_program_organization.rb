# Capitulo 4: Modules and Program Organization

#Basics of module creation and use
module MyFirstModule
  def ruby_version
    system("ruby -v")
  end
end

module ModuleTester
  include MyFirstModule
end
#mt = ModuleTester.new
#mt.ruby_version

# Listing 4.1. Stack module, encapsulating stacklike
# strcuture and behavior.
module Stacklike
  def stack
    @stack ||= []
  end
  
  def add_to_stack(obj)
    stack.push(obj)
  end

  def take_from_stack
    stack.pop
  end
end

# Listing 4.2. Mixing the Stacklike module
# into the Stack class.
#require_relative "stacklike"
class Stack
  include Stacklike
end

# Listing 4.3. Creatiing and using an instance of class Stack
s = Stack.new
s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack
puts "Removed this object:"
puts taken
puts "Now on Stack:"
puts s.stack

# Listing 4.4. Nonmodular rewrite of
# the Stack class
class Stack
  attr_reader :stack

  def initialize # Constructor method @stack
                 # cannot yet have been intitialized
                 # ,so it's set using = rather than ||=
    @stack = []
  end

  def add_to_stack(obj)
    @stack.push(obj)
  end

  def take_from_stack
    @stack.pop
  end
end

# Listing 4.5.
# Using the Stacklike module a second time,
# for a different class
class SuitCase
end

class CargoHold
  include Stacklike

  def load_and_report(obj)
    print "Loading object"
    puts obj.object_id
    add_to_stack(obj)
  end

  def unload
    take_from_stack
  end
end
ch = CargoHold.new
sc1 = SuitCase.new
sc2 = SuitCase.new
sc3 = SuitCase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print "The first cuitcase off the plane is..."
puts first_unloaded.object_id

# Listing 4.6.
# Demostration of module inclusion and inheritance
module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
end

class D < C
end
obj = D.new
obj.report

# Listing 4.7
# Two same-named methods on a single search path
module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in module IntersetBearing"
  end
end
class BankAccount
  include InterestBearing
  
  def calculate_interest
    puts "Placeholder! We're in class BankAccount"
    puts "And we're overriding the calculate_interest method..."
    puts "wich was defined in the InterestBearing module."
  end
end
account = BankAccount.new
account.calculate_interest

# Listing 4.8.
# Mixing in two modules with a same-named method defined
module M
  def report
    puts "'report' method in module M"
  end
end

module N
  def report
    puts "'report' method in module N"
  end
end

class C
  include M
  include N
end
c = C.new
c.report

# How prepend works
module MeFirst
  def report
    puts "Hello from module!"
  end
end
class Person
  prepend MeFirst
  
  def report
    puts "Hello from class!"
  end
end
p = Person.new
p.report

# How extend works
module Convertible
  def c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

class Thermometer
  extend Convertible
end
puts Thermometer.c2f(100)
puts Thermometer.f2c(212)

# Listing 4.9.
# Using the super keyword to reach up one level
# in the lookup path.
module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M
  def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super' call."
  end
end
c = C.new
c.report

# Listing 4.10. Using super to wrap
# a method in a subclass
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears  = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
end

class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end
end

# Listing 4.11. Additional methods to
# ilustrate method and super_method
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end

  def rent
    puts "Sorry but this model is sold out."
  end
end
class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end

  def rent
    puts "This bike is available."
  end
end

# Combining method_missing and super
class  Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      puts "You got an A in #{m.to_s.split("_").last.capitalize}!"
    else
      super
    end
  end
end

# Listing 4.13 Implemantation of the
# main logic of the Person class
class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends

  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def has_hobby(hobby)
    @hobbies << hobby
  end

  def has_friend(friend)
    @friends << friend
  end
end

# Listing 4.14 Full implementation of Person.method missing
def Person.method_missing(m, *args)
  method = m.to_s
  if method.start_with?("all_with_")
    attr = method[9..-1]
    if person.public_method_defined?(attr)
      PEOPLE.find_all do |person|
        person.send(attr).include?(args[0])
      end
    else
      raise ArgumentError, "Can't find #{attr}"
    end
  else
    super
  end
end

# Listing 4.15 CargoHold, inheriting from Stack
# instead of mixing in Stacklike
class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add_to_stack(obj)
    @stack.push(obj)
  end

  def take_from_stack
    @stack.pop
  end
end

class SuitCase
end

class CargoHold < Stack
  def load_and_report(obj)
    print "Loading object "
    puts obj.object_id
    add_to_stack(obj)
  end

  def unload
    take_from_stack
  end
end
