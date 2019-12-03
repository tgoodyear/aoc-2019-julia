f = open("day1.in.txt")

lines = readlines(f)

# Fuel itself requires fuel just like a module - 
#	take its mass, divide by three, round down, and subtract 2. 
# However, that fuel also requires fuel, and that fuel requires fuel, and so on. 
# Any mass that would require negative fuel should instead be treated as if 
# it requires zero fuel; the remaining mass, if any, is instead handled by 
# wishing really hard, which has no mass and is outside the scope of this calculation.

# So, for each module mass, calculate its fuel and add it to the total. 
# Then, treat the fuel amount you just calculated as the input mass and 
# repeat the process, continuing until a fuel requirement is zero or negative. 

function massToFuel(mass)
	fuel = floor(mass / 3) - 2
	return fuel < 0 ? 0 : fuel
end

function getFuelLine(fuel)
	if massToFuel(fuel) <= 0
		return 0
	end
	return massToFuel(fuel) + getFuelLine(massToFuel(fuel))
end

totalFuel = 0
for v in lines
	global totalFuel
	totalFuel += getFuelLine(parse(Float64,v))
end

println(Int64(totalFuel))