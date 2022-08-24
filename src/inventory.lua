local function checkSpace()
 if turtle.getItemCount(spaceLimit) ~= 0 then
  if debugging then debug.getFunctionStats("checkSpace") end
  miner.mine("down")
  turtle.select(oreChestSlot)
  turtle.placeDown()
  for i = 7, 15 do
   turtle.select(i)
   turtle.dropDown()
  end
  turtle.select(oreChestSlot)
  turtle.digDown()
  if debugging then debug.getFunctionStats("checkSpace") end
 end
end

local function checkTorch()
 if turtle.getItemCount(torchSlot) <= 16 then
  if debugging then debug.getFunctionStats("checkTorch") end
  turtle.select(torchChestSlot)
  turtle.placeDown()
  turtle.select(torchSlot)
  turtle.suckDown(64-turtle.getItemCount())
  turtle.select(torchChestSlot)
  turtle.digDown()
  if debugging then debug.getFunctionStats("checkTorch") end
 end
end

local function checkBlocks()
 if turtle.getItemCount(blockSlot) <= 16 then
  if debugging then debug.getFunctionStats("checkBlocks") end
  turtle.select(blockChestSlot)
  turtle.placeDown()
  turtle.select(blockSlot)
  turtle.suckDown(64-turtle.getItemCount())
  turtle.select(blockChestSlot)
  turtle.digDown()
  if debugging then debug.getFunctionStats("checkBlocks") end
 end
end

return { checkSpace = checkSpace,
         checkTorch = checkTorch,
         checkBlocks = checkBlocks }