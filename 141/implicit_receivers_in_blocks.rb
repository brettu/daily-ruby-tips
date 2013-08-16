# Ruby's self is implicit in classes and 
# today we'll look at how Ruby's self is also  
# implied in blocks too.


Course = Struct.new(:name, :instructor)
s1 = Course.new("Nice Jenny", 4.0) do |c|
  def my_map
    each { |attr| p attr } 
  end
end

p s1.send(:my_map)
#=> #<Enumerator: #<struct Course name="Nice Jenny", instructor=4.0>:map> 
