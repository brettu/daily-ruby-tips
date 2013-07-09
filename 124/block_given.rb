# Block_given? is a cool method under used in Ruby
# This method is created in Kernal and returns true or false. 
# It is most useful when combined with the yield of a method

# Let us create an example of registering a student

def register_student
  if block_given?
    # ... do a bunch of stuff like:
    # Create an Enrollment 
    # Change the status of the school
    # Set a cookie 
    yield
  else  
    raise "To register a student a block must be supplied"
  end
end

Student = Struct.new(:name, :age, :major)
student = Student.new("Zak Smith", 23, "Fine Art")
puts register_student { student }
#=> #<struct Student name="Zak Smith", age=23, major="Fine Art">

puts register_student
#=> block_given.rb:14:in `register_student: To register a student a block must be supplied (RuntimeError) from block_given.rb:20:in `<main>'
