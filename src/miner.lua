local movement = require("movement")
local checkOre = require("checkOre")

local function mine(direction) --safe for falling blocks
 if direction == "up" then
  while turtle.detectUp() do
   if debugging then log.writeLine("|Safe digging up...") end
   turtle.digUp()
   sleep(1)
  end
 elseif direction == "down" then
  if turtle.inspectDown() then
   if debugging then log.writeLine("|Safe digging down...") end
   turtle.digDown()
  end
 else
  while turtle.detect() do
   if debugging then log.writeLine("|Safe digging front...") end
   turtle.dig()
   sleep(1)
  end
 end
end

local function chew(direction)
 if debugging then
  log.writeLine("\n=======Chewing========")
  log.write("|Direction = ")
  log.writeLine(direction)
 end
 if direction == "left" then
  turtle.turnLeft()
  if debugging then	log.writeLine("|Turned left (chew)") end
 elseif direction == "right" then
  turtle.turnRight()
  if debugging then	log.writeLine("|Turned right (chew)") end
 end
 mine("front")
 movement.move("forward")
 mine("down")
 if debugging then log.writeLine("===Finished Chewing===") log.flush() end
end

local function division()
 if debugging then log.writeLine("\n=============Dividing=============") end
 chew("left")
 checkOre.checkAll(true)
 movement.move("back")
 turtle.turnRight()
 if debugging then log.writeLine("|Turned right (division)...") end
 chew("right")
 checkOre.checkAll(true)
 movement.move("back")
 turtle.turnLeft()
 if debugging then log.writeLine("|Turned left (division, returning position)...") end
 if debugging then log.writeLine("========Finished Dividing=========") log.flush() end
end

local function turn(flag)
 if debugging then
  log.writeLine("\n==========Turning Tunnel==========")
  if flag then
   log.writeLine("|Direction = right")
  else
   log.writeLine("|Direction = left")
  end
 end
 chew("front")
 checkOre.checkAll(true)
 if flag then chew("right") else chew("left") end
 checkOre.checkAll(true)
 for i = 1, 2 do
  chew()
  checkOre.checkAll(true)
 end
 if flag then
  turtle.turnRight()
  if debugging then log.writeLine("|Turned right (turn, returning position)") end
 else
  turtle.turnLeft()
  if debugging then log.writeLine("|Turned left (turn, returning position)") end
 end
 if debugging then log.writeLine("===========Turned Tunnel==========") log.flush() end
end

local function begin(step)
 if debugging then
  log.writeLine("\n============Beginning=============")
  log.write("|Current step = ")
  log.writeLine(step)
 end
 chew("front")
 checkOre.checkAll(true)
 if debugging then log.writeLine("==============Ended===============") log.flush() end
end

return { division = division,
         begin    = begin,
		 mine     = mine,
		 turn     = turn }