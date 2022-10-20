local QBCore = exports['qb-core']:GetCoreObject()




RegisterServerEvent('armory:givepoliceweapons', function()
  local src = source

    
      local Player = QBCore.Functions.GetPlayer(src)


      TriggerClientEvent('QBCore:Notify', src, 'You Got', 'success')
			for i=1, #Config.Weapons, 1 do
				Player.Functions.AddItem(Config.Weapons[i].name, Config.Weapons[i].count)	
        TriggerClientEvent('QBCore:Notify', src, Config.Weapons[i].count..'x '..Config.Weapons[i].label, 'success')

      end
      

end)



RegisterServerEvent('armory:givepoliceitems', function()
local src = source
    
  local Player = QBCore.Functions.GetPlayer(src)

  TriggerClientEvent('QBCore:Notify', src, 'You Got', 'success')
  Citizen.Wait(250)
  for i=1, #Config.Items, 1 do
    Player.Functions.AddItem(Config.Items[i].name, Config.Items[i].count)	

    TriggerClientEvent('QBCore:Notify', src, Config.Items[i].count..'x '..Config.Items[i].label, 'success')
  end

end)  



local adprint = true
function DebugPrint(msg)
        msg = "^6SOURCE: ^0" .. tostring(msg) .. "^7"
        print(msg)
end
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
    else
    if adprint then
       Wait(5000)
        DebugPrint("^5" .." [" ..GetCurrentResourceName().."]".." ".. '^2Script Started ^5')
    end
end
  end)


