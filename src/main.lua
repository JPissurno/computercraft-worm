require("variables")
require("oresInfo")
local inventory = require("inventory")
local torch     = require("torch")
local fuel      = require("fuel")
miner           = require("miner")
if debugging then
 log = fs.open(logName, "w")
 debug = require("debug")
 debug.printVariables()
end

--[[

	To start, just make sure
	all core items are in their
	respective slot ID.

]]--

turtle.select(fuelSlot)
turtle.refuel()
turtle.select(blockSlot)
while true do
 fuel.checkFuel()
 inventory.checkSpace()
 if step == (length+1)/2 then
  miner.division()
 end
 if step == length then
  miner.turn(flag)
  flag = not flag
  step = 0
 end
 miner.begin(step)
 step = step+1
 torch.checkLight(step)
 if debugging then
  if fs.getSize(logName) > maxLogSize then
   log.close()
   log = fs.open(logName, "w")
  end
 end
end
