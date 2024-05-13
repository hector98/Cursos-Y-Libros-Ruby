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
