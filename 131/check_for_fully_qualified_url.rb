# We might encounter a time when we need to see if our input data contains a url. 
# Today's tip is a simple regex for determining just that.

def url?(link)
  true if link =~ /\Ahttps?:\/\//
end 

p url?("foobar")
#=> nil

p url?("http://rubyinside.com")
#=> true

p url?("http://rubyrogues.com/")
#=> true

p url?("https://railscasts.com/")
#=> true

p url?("rubytapas.com")
#=> true
