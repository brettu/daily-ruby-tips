class Course  
  def initialize(title)  
    @title = title
  end  
  
  def results  
    "#@title, #@loc"  
  end  
end  
  
class Location < Course  
  def initialize(title, loc)  
    super(title)  
    @loc = loc  
  end  
end  

puts Location.new("Painting with Value", "Main Campus").results
#=> Perspective Painting, West Campus
