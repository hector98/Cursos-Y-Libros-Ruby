# Define a easy_money method that accepts no parameters
# and always returns the value 100.
def easy_money
  return 100
end

puts easy_money

# Define a best_food_ever method that accepts
# no parameters and always returns the string "Enchiladas Rojas"
def best_food_ever
  return "Enchiladas Rojas"
end

puts best_food_ever

# Define a convert_to_currency method that accepts a single parameter (an integer).
# The method should convert the argument to a string, prefix it with a dollar sign
# and return the result.
def convert_to_currency(num)
  return "$" + num.to_s
end
puts convert_to_currency(100)
puts convert_to_currency(1000)

# Examples:
# The => indicates the expected return value
# convert_to_currency(100) => "$100"
# convert_to_currency(1000) => "$1000"
