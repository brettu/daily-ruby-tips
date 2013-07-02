# Today I was doing some security upgrades and 
# I noticed my cookies in one of my app weren't 
# being set to http_only => true in Rails 3.2. 
# After doing a little digging I found Rails 3+ 
# changed the reference to :httponly => true.

# Setting a cookie in Rails < 3
cookies["u_name"] = { :value => "BrettU", :http_only => true }

# Setting a cookie in Rails >= 3
cookies["u_name"] = { :value => "BrettU", :httponly => true }
