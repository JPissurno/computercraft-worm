local function checkFuel()
 if turtle.getFuelLevel() <= minFuel then
  if debugging then debug.getFunctionStats("checkFuel") end
  miner.mine("down")
  turtle.select(fuelChestSlot)
  turtle.placeDown()
  turtle.select(fuelSlot)
  if fuelType == "lava" then
   turtle.dropDown()
   sleep(6)
   turtle.suckDown(1)
   turtle.refuel()
   turtle.select(fuelChestSlot)
   turtle.digDown()
  else
   turtle.suckDown(maxStack-turtle.getItemCount())
   turtle.refuel()
   turtle.select(fuelChestSlot)
   turtle.digDown()
  end
  if debugging then debug.getFunctionStats("checkFuel") end
 end
end

return { checkFuel = checkFuel }