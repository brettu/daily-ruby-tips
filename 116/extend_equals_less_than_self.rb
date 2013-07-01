# We have already looked the the difference of 
# extend and include in Modules. 
# Extend includes the class level Module methods and
# Include includes the instance level Module methods,
# so today we will see how to include and extend them both

module LakeCharacteristics
    
  # Ruby hook method
  def self.included(cls)
    cls.extend LakeData 
  end

  module LakeData
    def default_ph
      puts "8.1"
      new
    end
  end 

  def inspected
    # implement a counter
    puts "PH ph inspected"
  end
end

class Fish 
  include LakeCharacteristics
end

f = Fish.default_ph
puts f.inspected

# Without the Ruby hook method 
# this would need to have been written like so

class Fish
  include LakeCharacterisitics
  extend LakeCharacteristics::LakeData
end
