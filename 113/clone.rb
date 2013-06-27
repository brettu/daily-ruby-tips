# here we see the difference between clone and dub in the context of singleton methods

beer = "pilsner"

def beer.style
  puts 'lager'
end

beer.style
#=> lager

another_beer = beer.clone
another_beer.style
#=> lager

yet_another_beer = beer.dup
yet_another_beer.style
#=> clone.rb:17: undefined method `style' for "pilsner":String (NoMethodError)

