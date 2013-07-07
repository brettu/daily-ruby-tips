# Ruby's method respond_to_missing? is a great addition 
# to method_missing implementations and should be used.
# Today we look at why you should use respond_to_missing. 

# Example is good/clean path first because of stack trace in bad path
# Sensible explanation at http://brettu.com/?p=897
require 'ostruct'

class Sport
  def student
    @_student ||= OpenStruct.new(name: 'Patty Strikes', age: 21, major: 'Education')
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s =~ /student_(.*)/
      student.send($1, *arguments, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('student_') || super
  end

end

sport = Sport.new
puts sport.student_name
puts sport.respond_to?(:student_name)
puts sport.method(:student_name)

#=> Patty Strikes
#=> true
#=> #<Method: Sport#student_name>

class Course
  def student
    @_student ||= OpenStruct.new(name: 'Hank Lefterson', age: 22, major: 'Sports Medicine')
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s =~ /student_(.*)/
      student.send($1, *arguments, &block)
    else
      super
    end
  end

end

course = Course.new
puts course.student_name
puts course.respond_to?(:student_name)
puts course.method(:student_name)

#=> Hank Lefterson
#=> false
#=> respond_to_missing_with_method_missing.rb:49:in `method': undefined method `student_name' for class `Course' (NameError) from respond_to_missing_with_method_missing.rb:49:in `<main>'
