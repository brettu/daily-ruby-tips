# Ruby inheritance is pretty cool, and today's we look at how sub classing a Struct object
# and using the Struct block can return the same result.

# A normal struct object doesnt have a very pretty output
Park = Struct.new(:location, :capacity)
cp = Park.new("Central Park", "1,200,000")
puts cp
#=> #<struct Park location="Central Park", capacity="1,200,000">

# By creating a method on the Park class
# we can make this much prettier
Boardwalk = Struct.new(:location, :capacity)
class Boardwalk
  def to_s
    "#{self.location} can hold #{self.capacity} people."
  end
end
vb = Boardwalk.new("Venice Beach", "200,000")
puts vb
#=> Venice Beach can hold 200,000 people.

# We can inherit the Struct and reduce our code
class Mall < Struct.new(:location, :capacity)
  def to_s
    "#{self.location} can hold #{self.capacity} people."
  end
end
moa = Mall.new("Mall of America", "300,000")
puts moa
#=> Mall of America can hold 300,000 people.

# BUT the cool thing about Struct is it takes a block
Beach = Struct.new(:location, :capacity) do
  def to_s
    "#{self.location} can hold #{self.capacity} people."
  end
end
mb = Beach.new("Manhattan Beach", "25,000")
puts mb
#=> Manhattan Beach can hold 25,000 people.






