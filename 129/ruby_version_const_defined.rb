# As of Ruby 1.9+ Module#const_defined? takes an additional parameter.

# Module#const_defined?(sym, inherit=true)
p String.const_defined?(:Enumerable)
#=> true

# This means Ruby will look up the chain to find the constant. Setting the flag to false keeps the context local.

p String.const_defined?(:Enumerable, false)
#=> false

# Be careful in Ruby 1.8 with any additional parameters as you get a stack trace if you pass the second variable.
# Ruby 1.8.7
p String.const_defined?(:Enumerable, false)
#=> ruby_version_const_defined.rb:1:in `const_defined?': wrong number of arguments (2 for 1) (ArgumentError) from ruby_version_const_defined.rb:1



# The cool thing about Ruby Module is we can ask how many arguments a method can take.
# Ruby 1.8.7
p Module.method(:const_defined?).arity == 1
#=> true

# Ruby 1.9.2
p Module.method(:const_defined?).arity == 1
#=> false

# This way we could write a wrapper method around const_defined? for both versions.

# :)
