local inventory = require("inventory")
local movement  = require("movement")

local function cover(direction)
 inventory.checkBlocks()
 turtle.select(blockSlot)
 if direction == "up" then
  if not turtle.detectUp() then
   if debugging then log.writeLine("|No block above, covering...") end
   while not turtle.placeUp() do
    if debugging then log.writeLine("|Could not cover up, attacking up!!") end
    turtle.attackUp()
   end
  end
 elseif direction == "down" then
  if not turtle.detectDown() then
   if debugging then log.writeLine("|No block below, covering...") end
   while not turtle.placeDown() do
    if debugging then log.writeLine("|Could not cover down, attacking down!!") end
    turtle.attackDown()
   end
  end
 else
  if debugging then log.writeLine("covering...") end
  while not turtle.place() do
   if debugging then
    if direction == "left" then
	 log.writeLine("could not cover left, attacking left!!")
	else
	 log.writeLine("could not cover right, attacking right!!")
	end
   end
   turtle.attack()
  end
 end
end

return { cover = cover }