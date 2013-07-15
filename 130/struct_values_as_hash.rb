# Class Struct includes enumerable so we get a little more than a normal Class.
# Today's example shows the output of our attributes

Course = Struct.new(:name, :student_ids)
@struct = Course.new("Eastern Art History", [23, 456, 2342, 221, 3, 45, 987])
@struct.each_pair { |name, value| p("#{name} => #{value}") }
#=> "name => Eastern Art History"
#=> "student_ids => [23, 456, 2342, 221, 3, 45, 987]"

p enum = @struct.each
#=> #<Enumerator: #<struct Course name="Eastern Art History", student_ids=[23, 456, 2342, 221, 3, 45, 987]>:each>

# Spit out the count of attributes
p "The Object has #{enum.count{|attr| attr if attr.is_a?(Array)}} Array(s)"
p "The Object has #{enum.count{|attr| attr if attr.is_a?(String)}} String(s)"
#=> "The Object has 1 Array(s)"
#=> "The Object has 1 String(s)"
