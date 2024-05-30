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
