# Modules
# can be used in multiple classes
module Tools
  def say_hi(name)
    puts "Hello, #{name}"
  end
end

include Tools
Tools.say_hi('Mike')
