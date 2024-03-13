# Libro The Well-Grounded Rubyist
# Capitulo 1
# Bootstrapping Your Ruby Literacy

# Valid variable names in Ruby by variable type
firts_name_local = "Hector" # Local variable
@first_name_instance = "Hector" # Instance variable
$first_name_global = "Hector" # Global variable

# Listing 1.1 Simple. limited-purpose Celsius to Fahrenheit convert(c2f.rb)
celsius = 100
fahrenheit = celsius * 9 / 5 + 32
puts fahrenheit
puts "."

# Seconf converter iteration
print "The result is "
print fahrenheit
puts "."

# Listing 1.2 Interactive temperature converter(c2f.rb)
print "Hello, Please enter a Celsius value: "
celsius = gets
fahrenheit = (celsius.to_i * 9/5) + 32
print "The Fahrenheit equivalent is "
print fahrenheit
puts "."

# Listing 1.3 Temperature converter using file input(c2ffin.rb)
puts "Reading Celsius temperature value from data file..."
num = File.read("Files/temp.dat")
celsius = num.to_i
fahrenheit = (celsius * 9/5) + 32
puts "The number is " + num
print "Result: "
puts fahrenheit

# Listing 1.4 Temperature converter with file output(c2fout.rb)
print "Hello, Please enter a Celsius value: "
celsius = gets.to_i
fahrenheit = (celsius * 9/5) + 32
puts "Saving result to output file 'temp.out'"
fh = File.new("Files/temp.out", "w")
fh.puts fahrenheit
fh.close
