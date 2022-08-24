local function save()
 log.flush()
 debugFlag = not debugFlag
end

local function printVariables()
 log.writeLine("!!===========Variables==============!!")
 log.write("flag = ")
 log.writeLine(flag)
 log.write("step = ")
 log.writeLine(step)
 log.write("length = ")
 log.writeLine(length)
 log.write("minFuel = ")
 log.writeLine(minFuel)
 log.write("maxStack = ")
 log.writeLine(maxStack)
 log.write("fuelType = ")
 log.writeLine(fuelType)
 log.write("fuelValue = ")
 log.writeLine(fuelValue)
 log.write("percentage = ")
 log.writeLine(percentage)
 log.write("torchSpace = ")
 log.writeLine(torchSpace)
 log.write("fuelSlot = ")
 log.writeLine(fuelSlot)
 log.write("blockSlot = ")
 log.writeLine(blockSlot)
 log.write("torchSlot = ")
 log.writeLine(torchSlot)
 log.write("spaceLimit = ")
 log.writeLine(spaceLimit)
 log.write("oreChestSlot = ")
 log.writeLine(oreChestSlot)
 log.write("fuelChestSlot = ")
 log.writeLine(fuelChestSlot)
 log.write("blockChestSlot = ")
 log.writeLine(blockChestSlot)
 log.write("torchChestSlot = ")
 log.writeLine(torchChestSlot)
 for i = 1, #oresNames do
  log.write("Ore number ")
  log.write(i)
  log.write(": ")
  log.writeLine(oresNames[i])
 end
 log.writeLine("!!==================================!!")
 log.flush()
end

local function getFunctionStats(name, param)
 if name == "checkFuel" then
  if debugFlag then 
   log.writeLine("\n!!==========Checking Fuel===========!!")
   log.writeLine("[Before refueling]:")
  else
   log.writeLine("[After refueling]:")
  end
  log.write("|Fuel level = ")
  log.writeLine(turtle.getFuelLevel())
  log.write("|Item count (fuelSlot) = ")
  log.writeLine(turtle.getItemCount(fuelSlot))
  log.write("|Item detail (fuelSlot) = ")
  log.writeLine(turtle.getItemDetail(fuelSlot))
  log.write("|Item detail (fuelChestSlot) = ")
  log.writeLine(turtle.getItemDetail(fuelChestSlot))
  log.write("|Is there a block below? = ")
  log.writeLine(turtle.detectDown())
  if not debugFlag then log.writeLine("!!===========Checked Fuel===========!!") end
  save()
  
 elseif name == "checkSpace" then
  if debugFlag then
   log.writeLine("\n!!==========Checking Space==========!!")
   log.writeLine("[Before checking]:")
  else
   log.writeLine("[After checking]:")
  end
  log.write("|Item detail (oreChestSlot) = ")
  log.writeLine(turtle.getItemDetail(oreChestSlot))
  log.write("|Item detail (spaceLimitSlot) = ")
  log.writeLine(turtle.getItemDetail(spaceLimit))
  log.write("|N° of items (spaceLimitSlot) = ")
  log.writeLine(turtle.getItemCount(spaceLimit))
  log.write("|Is there a block below? = ")
  log.writeLine(turtle.detectDown())
  if not debugFlag then log.writeLine("!!==========Checked Space===========!!") end
  save()
  
  elseif name == "checkTorch" then
   if debugFlag then
    log.writeLine("\n!!=========Checking Torch===========!!")
	log.writeLine("[Before checking]:")
   else
    log.writeLine("[After checking]:")
   end
   log.write("|Item detail (torchSlot) = ")
   log.writeLine(turtle.getItemDetail(torchSlot))
   log.write("|Item detail (torchChestSlot) = ")
   log.writeLine(turtle.getItemDetail(torchChestSlot))
   log.write("|N° of items (torchSlot) = ")
   log.writeLine(turtle.getItemCount(torchSlot))
   log.write("|Is there a block below? = ")
   log.writeLine(turtle.detectDown())
   if not debugFlag then log.writeLine("!!==========Checked Torch===========!!") end
   save()
 
 elseif name == "checkLight" then
  log.writeLine("\n!!=========Checking Light===========!!")
  log.write("|Step = ")
  log.writeLine(step)
  log.write("|Space in-between torches = ")
  log.writeLine(torchSpace)
  log.write("|Is there a block below? = ")
  log.writeLine(turtle.detectDown())
  log.writeLine("!!==========Checked Light===========!!")
  log.flush()
  
 elseif name == "checkBlocks" then
  if debugFlag then
   log.writeLine("\n!!=========Checking Blocks==========!!")
   log.writeLine("[Before checking]:")
  else
   log.writeLine("[After checking]:")
  end
  log.write("|Item detail (blockSlot) = ")
  log.writeLine(turtle.getItemDetail(blockSlot))
  log.write("|Item detail (blockChestSlot) = ")
  log.writeLine(turtle.getItemDetail(blockChestSlot))
  log.write("|N° of items (blockSlot) = ")
  log.writeLine(turtle.getItemCount(blockSlot))
  log.write("|Is there a block below? = ")
  log.writeLine(turtle.detectDown())
  if not debugFlag then log.writeLine("!!==========Checked Blocks==========!!") end
  save()
 end
end

return { printVariables   = printVariables,
         getFunctionStats = getFunctionStats }