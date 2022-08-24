local movement = require("movement")
local cover    = require("cover")

local function checkOre(direction, main)
 if direction == "up" then
  local succ, block = turtle.inspectUp()
  if succ then
   if debugging then 
    log.write("|Block detail = ")
    log.writeLine(block.name)
   end
   for i = 1, #oresNames do
    if block.name == oresNames[i] then
	 if debugging then log.writeLine("|-Detected ore above") end
     miner.mine("up")
	 if debugging then log.writeLine("|-Moving up...") end
     movement.move("up")
     checkAll()
     movement.move("down")
	 if debugging then log.writeLine("|-Moved down, returned position") end
     return
    end
   end
  else
   if debugging and not main then log.writeLine("|No block above") end
  end
 elseif direction == "down" then
  local succ, block = turtle.inspectDown()
  if succ then
   if debugging then
    log.write("|Block detail = ")
    log.writeLine(block.name)
   end
   for i = 1, #oresNames do
    if block.name == oresNames[i] then
	 if debugging then log.writeLine("|-Detected ore below") end
     miner.mine("down")
	 if debugging then log.writeLine("|-Moving down...") end
     movement.move("down")
     checkAll()
     movement.move("up")
	 if debugging then log.writeLine("|-Moved up, returned position") end
     return
    end
   end
  else
   if debugging and not main then log.writeLine("|No block below") end
  end
 elseif direction == "sides" then
  local succ, block
  for i = 1, 4 do
   succ, block = turtle.inspect()
   if debugging and i == 1 then log.writeLine("|Checking front...") end
   if debugging and i == 2 then log.writeLine("|Checking left...") end
   if debugging and i == 3 then log.writeLine("|Checking back...") end
   if debugging and i == 4 then log.writeLine("|Checking right...") end
   if succ and turtle.detect() then
    if debugging then
	 log.write("|Block detail = ")
	 log.writeLine(block.name)
	end
    for j = 1, #oresNames do
	 if block.name == oresNames[j] then
	  if debugging and i == 1 then log.writeLine("|-Detected ore front") end
	  if debugging and i == 2 then log.writeLine("|-Detected ore left") end
	  if debugging and i == 3 then log.writeLine("|-Detected ore back") end
	  if debugging and i == 4 then log.writeLine("|-Detected ore right") end
	  miner.mine("front")
	  if debugging then log.writeLine("|-Moving forward...") end
	  movement.move("forward")
	  checkAll()
	  movement.move("back")
	  if debugging then log.writeLine("|-Moved back, returned position") end
	  if i == 2 then
	   if main then
	    if debugging then log.write("|No block left, ") end
	    cover.cover("left")
	   else
	    if debugging then log.writeLine("|No block left") end
	   end
	  end
	  if i == 4 then
	   if main then
	    if debugging then log.write("|No block right, ") end
	    cover.cover("right")
	   else
	    if debugging then log.writeLine("|No block right") end
	   end
	  end
	 end
	end
   else
    if debugging and i == 1 then log.writeLine("|No block front") end
	if i == 2 then
	 if main then
	  if debugging then log.write("|No block left, ") end
	  cover.cover("left")
	 else
	  if debugging then log.writeLine("|No block left") end
	 end
	end
	if debugging and i == 3 then log.writeLine("|No block back") end
    if i == 4 then
	 if main then
	  if debugging then log.write("|No block right, ") end
	  cover.cover("right")
	 else
	  if debugging then log.writeLine("|No block right") end
	 end
	end
   end
   turtle.turnLeft()
   if debugging and i == 1 then log.writeLine("|Turned to left") end
   if debugging and i == 2 then log.writeLine("|Turned to back") end
   if debugging and i == 3 then log.writeLine("|Turned to right") end
   if debugging and i == 4 then log.writeLine("|Turned to front again") end
  end
 end
end

function checkAll(main)
 if debugging then
  log.writeLine("\n=====Checking Ore=====")
  log.writeLine("|Checking ore up...")
 end
 checkOre("up", main)
 if main then cover.cover("up") end
 if debugging then
  log.writeLine("|Checked ore up")
  log.writeLine("|Checking ore down...")
 end
 checkOre("down", main)
 if debugging then
  log.writeLine("|Checked ore down")
  log.writeLine("|Checking ore sides...")
 end
 checkOre("sides", main)
 if debugging then log.writeLine("|Checked ore sides") end
 if turtle.down() then
  if debugging then
   log.writeLine("|-Moved down (checking ores)")
   log.writeLine("|Checking ore sides...")
  end
  checkOre("sides", main)
  if debugging then
   log.writeLine("|Checked ore sides")
   log.writeLine("|Checking ore down...")
  end
  checkOre("down", main)
  if main then cover.cover("down") end
  turtle.up()
  if debugging then
   log.writeLine("|Checked ore down")
   log.writeLine("|-Moved up (checking ores, returning position)")
  end
 end
 if debugging then log.writeLine("=====Checked Ore======") log.flush() end
end

return { checkAll = checkAll }
