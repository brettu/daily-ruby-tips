# When a Ruby method returns an Array we can immediately loop over the array again, but we can pass arguments to that method on the fly. This makes a nice syntax reducing code.
require 'date'

class School

  def initialize
    @enrolled = []
  end

  def enrolling(from, to, student)
    @enrolled << [DateTime.parse(from) .. DateTime.parse(to), student] 
  end 

  def display_enrolled_students(datetime)
    dt = DateTime.parse(datetime)
    puts "_____ Student ______"
    check_enrollment(dt).each do |range, student|
      puts "Name: #{student}"
    end
    puts "_____ End _______"
  end

  def check_enrollment(datetime)
    @enrolled.each_with_object([]) do |enroll, match|
      match << enroll if enroll.first.cover?(datetime)
    end
  end

end

sch = School.new
sch.enrolling "2013.09.04", "2014.06.12", "Louis CK"
sch.enrolling "2013.09.04", "2014.06.12", "Tosh.0"
sch.enrolling "2012.09.03", "2013.06.11", "Zach Galifianakis"
p sch.display_enrolled_students "2013.12.24"
