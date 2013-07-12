# Catch and throw in Ruby doesn't always provide the most
# verbose code around, but there is a cool feature 
# with throw which allows us to return pretty much anything
# as the value of catch once throw is met.

def prompt(text)
  print text
  input = readline.chomp
  throw(:quit, lambda {return "New Action to Render"} ) if input == ""
  return input
end

value = catch :quit do
  name = prompt("Name: ")
  age  = prompt("Age:  ")
  sex  = prompt("Sex:  ")
end

puts value.call


