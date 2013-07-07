# Render Useable, Descriptive Ruby Exceptions

# Ever since reading Avdi Grimm's book, Exceptional Ruby, 
# the thought of highly readable, useable, exceptions crosses my mind. 
# Looking at the following example this idiomatic code 
# not only provides a readable syntax in the source but 
# a great log message when exceptions occur.

def initialize(params={})
  @course = params.fetch(:course, nil)
  raise ArgumentError, "#{self.class.name} was given a nil course; a valid course is required" if @course.nil?
end

# :)
