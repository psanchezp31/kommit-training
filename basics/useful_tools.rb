
# Modules
module Tools #can be used in multiple classes
  def say_hi(name)
      puts "Hello, #{name}"
  end
end

include Tools
Tools.say_hi("Mike")
