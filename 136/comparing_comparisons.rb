# Final file 
# read the post here 
# http://brettu.com/rails-daily-ruby-tips-136-comparing-comparisons/ 

module MastersCriteria
  private 
    def global_capacity
      5
    end
end


class Course
  #include MastersCriteria

  def method_missing(meth)
    meth = nil
  end

  def initialize(name, capacity, students)
    @name = name
    @capacity = capacity
    @students = students
  end

  def over_capacity?
    @students.length >= (global_capacity || @capacity)
  end

end

course = Course.new("Contemporary Painting", 45, [43, 234, 21, 4567])
p course.over_capacity?
#=> false
