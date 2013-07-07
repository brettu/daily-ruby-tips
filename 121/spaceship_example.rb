# A fun example for the 4th of July
# We can compare the age of countries
# on America's birthday

# Ruby 2.0.0-rc
class Country
  include Comparable
 
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  def <=>(other_country)
    age <=> other_country.age
  end

end
  
america = Country.new(217)
canada = Country.new(146)
norway = Country.new(1141)

puts "America/Canada comparison"
puts america < canada
puts america == canada
puts canada < america

puts "Norway/Canada comparison"
puts canada < norway
puts canada != norway
puts norway < canada
