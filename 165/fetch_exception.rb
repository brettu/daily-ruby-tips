@data = {daily_fish:{ocean:"sea bass", lake:"walleye"}}

def daily_ocean_fish
  @data[:daily_fish].fetch(:ocean) { raise "Daily ocean fish node has changed or is unavailable" }
end

def daily_river_fish
  @data[:daily_fish].fetch(:river) { raise "Daily river fish node has changed or is unavailable" }
end

p daily_ocean_fish
p daily_river_fish

#=> "sea bass"
#=> fetch_exception.rb:8:in `block in daily_river_fish': Daily river fish node has changed or is unavailable (RuntimeError)
