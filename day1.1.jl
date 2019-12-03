f = open("day1.in.txt")

lines = readlines(f)

# Fuel required to launch a given module is based on its mass. 
# Specifically, to find the fuel required for a module, take its mass, 
# divide by three, round down, and subtract 2.

totalFuel = 0
for v in lines
	global totalFuel
	totalFuel += floor(parse(Float64,v) / 3) - 2
end

println(Int64(totalFuel))