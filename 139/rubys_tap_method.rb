# Ruby 2.0.0 
# Exploring Ruby's tap()

Student = Struct.new(:name, :gpa)

class Course

  attr_accessor :students
  attr_accessor :cost

  def initialize(students, cost)
    @students = students
    @cost     = cost
  end

  def render_bad_kids
    @students.each do |student| 
      student.tap do |attr| 
        attr.gpa < 3.0 ? p(attr.name + "-terrible-student") : p(attr.name)
      end
    end
  end

end

s1 = Student.new("Evil Dave", 2.0)
s2 = Student.new("Nice Jenny", 4.0)

c1 = Course.new([s1, s2], "11,000.00")
p c1.render_bad_kids

#=> "Evil Dave-terrible-student"
#=> "Nice Jenny"
#=> [#<struct Student name="Evil Dave", gpa=2.0>, #<struct Student name="Nice Jenny", gpa=4.0>]




