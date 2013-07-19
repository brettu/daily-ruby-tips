# It would make sense to think a private method in a Ruby mixin
# might not be available in the object which that method is mixed,
# but this isn't the case.

module MastersCriteria
  
  private 
 
  def global_capacity
    5
  end

  def project_basaed?
    true
  end

end


class Course
  include MastersCriteria

  def initialize(name, capacity, students)
    @name = name
    @capacity = capacity
    @students = students
  end

  def over_capacity?
    @students.length >= (global_capacity ? global_capacity : @capacity)
  end

end

course = Course.new("Contemporary Painting", 45, [43, 234, 21, 4567])
course_2 = Course.new("Contemporary Painting", 45, [43, 234, 1, 34534, 23, 47, 9797])
p course.over_capacity?
#=> false
p course_2.over_capacity?
#=> true
