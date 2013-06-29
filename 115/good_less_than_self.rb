# Ruby's class << self is a common method for creating class methods,
# but it becomes very difficult to read a large class and
# know if a method id a class method. 

class Restaurant

  class << self
    def location
      puts "Manhattan"
    end
  end

end 

# The above doesn't have any benefit
# other saving a few keystrokes.

class Restaurant

  def self.location
    puts "Manhattan"
  end

end

# There is an important time to use 
# the class << self syntax. 
# When we are setting getter and setters
# on the class, not the instance

class Restaurant

  @created_at = nil

  class << self
    attr_accessor :created_at
  end

  def initialize
    # ...
    Restaurant.created_at = Time.now
  end

end

Restaurant.new
puts "This Restaurant was created at #{Restaurant.created_at}"

sleep(5)
Restaurant.new
puts "This Restaurant was created at #{Restaurant.created_at}"


