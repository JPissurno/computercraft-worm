local inventory = require("inventory")

local function checkLight(step)
 if step%torchSpace == 0 then
  if debugging then debug.getFunctionStats("checkLight") end
  inventory.checkTorch()
  turtle.select(torchSlot)
  turtle.placeDown()
 end
end

return { checkLight = checkLight }