require_relative "useful_tools.rb"
include Tools

puts "Mike"
print "Hello, world!"
puts " "

puts "   /|"
puts "  / |"
puts " /  |"
puts "/___|"


#Data types
name = "Mike" #string
age = 25 #integer
gpa = 3.2 #float
is_student = true #boolean
flaws = nil #nil

#Working with strings
phrase = "Giraffe Academy"
puts phrase.upcase()  # convert to uppercase    
puts phrase.downcase()  # convert to lowercase
puts phrase.strip()  # remove spaces
puts phrase.length()  # count the number of characters
puts phrase.include? "Academy"  # check if the string includes "Academy"
puts phrase[0]  # get the first character
puts phrase[0, 3]  # get the first 3 characters
puts phrase.index("Academy")  # get the index of the first occurrence of "Academy"

#Working with numbers
puts 2
puts 2.34
puts - 2.34
puts 2 + 2
puts 2 - 2
puts 2 * 2
puts 2 / 2

## Getting user input
puts "Enter your name: "
name = gets.chomp()  # get user input and remove the newline character
puts "Hello, " + name + "!"

## Building a calculator
puts "Enter a number: "
num1 = gets.chomp().to_f  # convert to float
puts "Enter another number: "
num2 = gets.chomp().to_f  # convert to float
puts (num1 + num2)

# Arrays
friends = ["Kevin", "Karen", "Oscar", "Angela"]
puts friends[0]  # get the first element
puts friends[-1]  # get the last element
puts friends[0, 2]  # get the first 2 elements
puts friends.length()  # get the number of elements
puts friends.include? "Karen"  # check if the array includes "Karen"
puts friends.reverse()  # reverse the array
puts friends.sort()  # sort the array

# Hashes
states = {
    "Pennsylvania": "PA",
    "New York": "NY",
    "Oregon": "OR"
}
puts states["Pennsylvania"]  # get the value of the key "Pennsylvania"

# Methods
def say_hi(name, age)
    puts "Hello, " + name + ", you are " + age.to_s + " years old."
end

say_hi("Mike", 25)

# Return statement
def cube(num)
    return num * num * num #return word is optional
end

puts cube(3)

# If statements
is_student = false
is_smart = false

if is_student and is_smart
    puts "You are a student"
end

# Case expressions
def get_day_name(day)
    day_name = ""
    
    case day
    when "mon"
        day_name = "Monday"
    when "tue"
        day_name = "Tuesday"
    else
        day_name = "Invalid day"
    end
    
    return day_name
end

# While loop
index = 1
while index <= 5
    puts index
    index += 1
end 

# For loop
for index in 0..5
    puts index
end 

6.times do |index|
    puts index
end

# For loop with arrays
friends = ["Kevin", "Karen", "Oscar", "Angela"]
for friend in friends
    puts friend
end

# Reading files
File.open("employees.txt", "r") do |file| # r is for read
    puts file.read()
end

# Writing to files
File.open("employees.txt", "w") do |file| # w is for write
    file.write("Oscar, Accounting")
end

# Handling errors
begin
    # code that might raise an error
rescue
    # code that runs if an error is raised
end

# Classes & Objects
class Book
    attr_accessor :title, :author, :pages
    def initialize(title, author, pages)
        @title = title
        @author = author
        @pages = pages
    end
end

book1 = Book.new("Harry Potter", "J.K. Rowling", 400)
puts book1.title

# Inheritance
class Chef
    def make_chicken
        puts "The chef makes chicken"
    end
end 

class ItalianChef < Chef
    def make_special_dish
        puts "The chef makes chicken parm"
    end
end 

chef = Chef.new()
chef.make_chicken()

italian_chef = ItalianChef.new()
italian_chef.make_special_dish()

Tools.say_hi("Mike")
