def cpu_usage
  cpu = `ps -o %cpu #{$$}`
  cpu.strip.gsub(/\n/, ": ")
end

p cpu_usage
#=> "%CPU:   0.0"

(0..25000).each do |int|
  p cpu_usage
end

#=> %CPU:  34.7" 
#=> %CPU:  35.1" 
#=> ...
