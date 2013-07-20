# When writting nested modules and libraries 
# we can describe our exception rendering
# by creating a new exception class at the top of our code
require 'date'

module MastersCriteria
  class InvalidMastersCriteria < StandardError 
    def initialize(msg = nil)
      super(msg)
    end
  end 

  class Course
    MINIMUM_DEGREE = :bachelors
    MINIMUM_GPA    = :c
    DEFAULT_START  = Date.new(2013, 9, 3)
    DEFAULT_END    = Date.new(2013, 12, 20)

    attr_accessor :num_of_students, :dates, :prerequisites

    def initialize
      self.num_of_students = {}
      self.dates           = [DEFAULT_START, DEFAULT_END]
      self.prerequisites   = {}
    end
    
    def calendar(start_date, end_date)
      raise InvalidMastersCriteria, "start date too soon" unless start_date >= DEFAULT_START 
      raise InvalidMastersCriteria, "end date too late" unless end_date   <= DEFAULT_END

      [start_date, end_date]
    end
  end

end

mc = MastersCriteria::Course.new
p mc.calendar(Date.new(2013, 9, 1), Date.new(2013, 11, 1))
#=> 137/a_more_descript_error_call.rb:28:in `calendar': start date too soon (MastersCriteria::InvalidMastersCriteria) from 137/a_more_descript_error_call.rb:38:in `<main>'

# Now we have something very descriptive to see in our logs
# :)
