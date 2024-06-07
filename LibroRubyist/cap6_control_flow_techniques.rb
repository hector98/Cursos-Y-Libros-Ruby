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
