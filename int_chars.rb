#int letters cannot downcase in RUby/ POstgres ok :)
p "π".upcase

# \W is any non-word character
p "π".gsub(/\W/, "REPLACED")
p "L".gsub(/\W/, "REPLACED")
