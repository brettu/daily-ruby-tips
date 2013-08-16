# Ruby's enumerable each_slice() method has a hidden agenda
require "benchmark"

Benchmark.bm(7) do |x|
  x.report { (1..10000).each_slice(100) { |a| a.each_with_index {|p, idx| Product.create!(title: "Shoe-#{idx}", store_id: 1) }}}
  x.report { (1..10000).each_with_index { |p, idx| Product.create!(title: "Shoe-#{idx}", store_id: 1) } }
  x.report { (1..10000).each { |i| Product.create!(title: "Shoe-#{i}", store_id: 1) } }
  x.report { 10000.times { |n| Product.create!(title: "Shoe-#{n}", store_id: 1) } }
  x.report { Product.create!(title: "Shoe-#{1}", store_id: 1)  }
end

#=> => [#<Benchmark::Tms:0x007fa71863ed60 @label="", @real=24.679326, @cstime=0.0, @cutime=0.0, @stime=4.780000000000001, @utime=16.759999999999998, @total=21.54>, #<Benchmark::Tms:0x007fa719869418 @label="", @real=24.60898, @cstime=0.0, @cutime=0.0, @stime=4.76, @utime=16.750000000000007, @total=21.510000000000005>, #<Benchmark::Tms:0x007fa7162f8658 @label="", @real=24.802445, @cstime=0.0, @cutime=0.0, @stime=4.75, @utime=16.92, @total=21.67>]

