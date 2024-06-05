# Chapter 5
# The default object (self) scope and visibility

# Listing 5.1 Examining self via calls to puts in
# class and module definition
class C
  puts "Just started class C:"
  puts self

  module M
    puts "Nested module C::M:"
    puts self
  end

  puts "Back in the outer level of C:"
  puts self
end

# Self in instance-method definition
class C
  def x
    puts "Class C, method x:"
    puts self
  end
end
c = C.new
c.x
puts "That was a call to x from: #{c}"  

# Self in singleton-method and class-method definitions
obj = Object.new
def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end
obj.show_me
puts "Back from call to show_me by #{obj}"

# Self as the default receiver of messages
class C
  def x
    puts "This is method 'x'"
  end
  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end
c = C.new
c.y

# Listing 5.2. Composing whole name from values, using method
# calls on implicit self
class Person
  attr_accessor :first_name, :middle_name, :last_name
  
  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end
hector = Person.new
hector.first_name = "Hector"
hector.last_name = "Barrios"
puts "Hector's whole name: #{hector.whole_name}"
hector.middle_name = "Manuel"
puts "Hector's whole name: #{hector.whole_name}"

# Resolving instance varibales through self
class C
  def set_v
    @v = "I'm an instance variable and I belong to any instance of C."
  end

  def show_var
    puts @v
  end

  def self.set_v
    @v = "I'm an instance variable and I belong to C."
  end
end
C.set_v
c = C.new
c.set_v
c.show_var

# Listing 5.3. Demostrating the relationship between instance variables and self
class C
  puts "Just inside class definition block. Here's self:"
  p self
  @v = "I'm an instance variable at the top level of a class body."
  puts "And here's the instance variable @v, belonging to #{self}:"
  p @v

  def show_var
    puts "Inside an instance method definition block. Here's self:"
    p self
    puts "And here's the instance variable @v, belonging to #{self}:"
    p @v
  end
end
c = C.new
c.show_var

# Global scope and global variables
$gvar = "I'm a global!"
class C
  def examine_global
    puts $gvar
  end
end
c = C.new
c.examine_global

# Local scope
class C
  a = 1
  def local_a
    a = 2
    puts a
  end
  puts a
end
c = C.new
c.local_a

# Listing 5.4. Reusing a variable name in nested local scopes
class C
  a = 5
  module M
    a = 4
    module N
      a = 3
      class D
        a = 2
        def show_a
          a = 1
          puts a
        end
        puts a
      end
      puts a
    end
    puts a
  end
  puts a
end
d = C::M::N::D.new
d.show_a

# Listing 5.5. Demostrating the generation of a new local scope per method call
class C
  def x(value_for_a.recurse = false)
    a = value_for_a
    print "Here's the inspect-string for 'self':"
    p self
    puts "And Here's a:"
    puts a
    
    if recurse
      puts "Calling myself (recursion)..."
      x("Second value for a")
      puts "Back after recurcion; here's a:"
      puts a
    end
  end
end
c = C.new
c.x("First value for a", true)

# Scope and resolution constants
module M
  class C
    class D
      module N
        X = 1
      end
    end
  end
end
puts M::C::D::N::X
puts M::C::X

# Listing 5.6. Keeping track of car manufacturing
# statics with class variables
class Car
  @@makes = []
  @@cars = {}
  @@total_count = 0
  attr_reader :make
  
  def self.total_count
    @@total_count
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make} !"
      @make = make
      @@cars[make] += 1
      @@total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end
end

# Listing 5.7 Car with @@total_count remplaced by
# instance variable @total_count
class Car
  @@makes = []
  @@cars = {}
  attr_reader :make

  def self.total_count
    @total_count ||= 0
  end

  def self.total_count=(n)
    @total_count = n
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end
end

# Listing 5.8 Baker and other baking domain classes
class Cake
  def initialize(better)
    @better = better
    @baked = true
  end
end

class Egg
end

class Flour
end

class Baker
  def bake_cake
    @batter = []
    pour_flour
    add_egg
    stir_batter
    return Cake.new(@batter)
  end

  private
  
  def pour_flour
    @batter.push(Flour.new)
  end

  def add_egg
    @batter.push(Egg.new)
  end

  def stir_batter
  end
end

# Listing 5.9 Example of a protected method and its use
class C
  def intialize(n)
    @n = n
  end

  def n
    @n
  end
  
  def compare(c)
    if c.n > n
      puts "The other object's n is bigger."
    else
      puts "The other object's n is the same or smaller."
    end
  end
  protected :n
end
c1 = C.new(100)
c2 = C.new(101)
c1.compare(c2)

