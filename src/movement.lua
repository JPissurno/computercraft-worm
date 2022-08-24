local function move(direction)
 if debugging then
  log.writeLine("=====Moving=====")
  log.write("|Direction = ")
  log.writeLine(direction)
 end
 if direction == "up" then
  while not turtle.up() do
   if debugging then log.writeLine("|Could not move, attacking up!!") end
   turtle.attackUp()
  end
  if debugging then log.writeLine("|Moved up") end
  return
 elseif direction == "down" then
  while not turtle.down() do
   if debugging then log.writeLine("|Could not move, attacking down!!") end
   turtle.attackDown()
  end
  if debugging then log.writeLine("|Moved down") end
  return
 elseif direction == "left" then
  turtle.turnLeft()
  if debugging then log.writeLine("|Turned left") end
 elseif direction == "right" then
  turtle.turnRight()
  if debugging then log.writeLine("|Turned right") end
 elseif direction == "back" then
  turtle.turnRight()
  turtle.turnRight()
  if debugging then log.writeLine("|Turned back (Right 2x)") end
 end
 while not turtle.forward() do
  if debugging then log.writeLine("|Could not move, attacking front!!") end
  turtle.attack()
 end
 if direction == "left" then
  turtle.turnRight()
  if debugging then log.writeLine("|Turned right (returning position)") end
 elseif direction == "right" then
  turtle.turnLeft()
  if debugging then log.writeLine("|Turned left (returning position)") end
 elseif direction == "back" then
  turtle.turnLeft()
  turtle.turnLeft()
  if debugging then log.writeLine("|Turned front (Left 2x, returning position)") end
 end
 if debugging then log.writeLine("=====Moved======") log.flush() end
end

return { move = move }
