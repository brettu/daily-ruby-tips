# Ruby memstats

def memstats
  p size = `ps -v vsz #{$$}`
end

memstats
