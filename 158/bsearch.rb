arr = [1,3,4,5,6,8,9,10,11,12,19]

p "=> #{arr.find {|i| p i; i == 11 }}"
p "******"
p "=> #{arr.bsearch {|i| p i; i == 11 }}"
