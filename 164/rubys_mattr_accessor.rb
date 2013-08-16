require 'rails'

module MastersLevel
  mattr_accessor :valedictorian  
  self.valedictorian = "The Good Learner"
end

class SeniorYear
  include MastersLevel
  #mattr_accessor :valedictorian
end


p MastersLevel.valedictorian
#=> "The Good Learner"

p SeniorYear.valedictorian
#=> "The Good Learner"
