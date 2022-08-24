flag = false --true == firts turn right, else first turn left
logName = "logTurtle1"
maxLogSize = 25000 --in bytes
debugging = true --for debug only, probably a lot slower operation
debugFlag = true --always true
step = 0 --miner's step; should not change
length = 65 --Tunnel length; always odd
maxStack = 1 --only if fuelType ~= lava
fuelType = "lava"
fuelValue = 1000 --varies for each type of fuel. Default is bucket of lava: 1000
percentage = 1/4 --what percentage of fuelValue should turtle refuel
minFuel = fuelValue*percentage
torchSpace = 5 --space in-between torches. Optimal is 5
--======Turtle's inventory IDs======--

--[[
	If you change anything,
	you should check the limits
	for the for loop in the
	'inventory.lua' library.
	It's recommended to have 
	core items in ID sequence,
	except for the fuel.
	1 >= ID <= 16
]]--

fuelSlot = 16 --16 recommended
blockSlot = 5
torchSlot = 6
spaceLimit = 14 --14 recommended; 
oreChestSlot = 1
fuelChestSlot = 2
blockChestSlot = 3
torchChestSlot = 4
