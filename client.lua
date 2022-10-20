
letSleep = false
local PlayerJob = {}
local QBCore = exports['qb-core']:GetCoreObject()




function openmenu()

 

  local Menu = {
    {
        header = "Armory Weapons",
        txt = ' 1x Taser , 1x Pistol 1x, Nightstick  ',
        params = {
            event = "giveweapons",
        }
    },
    {
      header = "Armory Items",
      txt = " 5x Armor, 5x Pistol Ammo ,  1x Radio",
      params = {
          event = "policeitems",
      },
    },

  {
    header = "Armour",
    txt = "Full Armour",
    params = {
        event = "givearmour",
    },
  },
  {
    header = "Heal",
    txt = "Full Heal",
    params = {
        event = "giveheal",
    },

},
{
  header = "Wardrobe",
  txt = "Change Clothes",
  params = {
      event = "sendclothmenu",
  },

},
  
  
    

}


exports['qb-menu']:openMenu(Menu)

end

RegisterNetEvent('sendclothmenu', function ()
    local Menu = {


      {
        header = "Short Sleeve",
        txt = '',
        params = {
            event = "ShortSleeve",
        }
    },
    {
      header = "Long Sleeve",
      txt = '',
      params = {
          event = "LongSleeve",
      }
   },
   {
    header = "Trooper",
    txt = '',
    params = {
        event = "TrooperTan",
    }
  },
  {
    header = "Trooper Black",
    txt = '',
    params = {
        event = "TrooperBlack",
    }
  },
  
  {
    header = "Swat",
    txt = '',
    params = {
        event = "swat",
    }
  },
  

    

}


exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('giveweapons', function()
  TriggerServerEvent('armory:givepoliceweapons')
end)
RegisterNetEvent('policeitems', function()
  TriggerServerEvent('armory:givepoliceitems')
end)













function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


CreateThread(function()
  while true do
      Wait(1)
      letSleep = true
     if PlayerJob.name == "police" or PlayerJob.name == 'sheriff' then
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed, true)
          for k, v in pairs(Config.ArmoryLocations) do
              local loc = #(playerCoords - v)
              if loc < 3.0 then
                  letSleep = false
                  DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false)
                  if loc < 2.0 then
                      DrawText3Ds(v.x, v.y, v.z, '~g~E~w~ - Armory')
                      if IsControlJustPressed(0, 38) then
                        openmenu()
                    end
                  end
              end
          end
      else
          letSleep = false
      end

      if letSleep then
          Wait(1000)
      end
  end
end)



function checkhealth ()

  local playerPed = PlayerPedId()
  local health = GetEntityHealth(playerPed)

  if health == 200 then
  else
    SetEntityHealth(playerPed, 200)

  end
end

function checkarmour ()

  local playerPed = PlayerPedId()
  local armour = GetPedArmour(playerPed)

  if armour == 100 then

  else
    SetPedArmour(playerPed, 100)


  end
end





RegisterNetEvent('ShortSleeve', function()
  if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
  SetPedComponentVariation(PlayerPedId(), 8, Dollar.ShortSleeveMale["t-shirt"].ComponentOne, Dollar.ShortSleeveMale["t-shirt"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 4, Dollar.ShortSleeveMale["pants"].ComponentOne, Dollar.ShortSleeveMale["pants"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.ShortSleeveMale["torso2"].ComponentOne, Dollar.ShortSleeveMale["torso2"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.ShortSleeveMale["shoes"].ComponentOne, Dollar.ShortSleeveMale["shoes"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.ShortSleeveMale["accessory"].ComponentOne, Dollar.ShortSleeveMale["accessory"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.ShortSleeveMale["bag"].ComponentOne, Dollar.ShortSleeveMale["bag"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.ShortSleeveMale["mask"].ComponentOne, Dollar.ShortSleeveMale["mask"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.ShortSleeveMale["vest"].ComponentOne, Dollar.ShortSleeveMale["vest"].texture ,0)
  ClearPedProp(PlayerPedId(), 0)

  SetPedPropIndex(PlayerPedId(), 0, Dollar.ShortSleeveMale["hat"].ComponentOne,Dollar.ShortSleeveMale["hat"].texture ,0  )
  SetPedPropIndex(PlayerPedId(), 1, Dollar.ShortSleeveMale["glass"].ComponentOne,Dollar.ShortSleeveMale["glass"].texture ,0  )

  SetPedComponentVariation(PlayerPedId(),3 , Dollar.ShortSleeveMale['arms'].ComponentOne, Dollar.ShortSleeveMale["arms"].texture ,0)
  else
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.ShortSleeveFemale["t-shirt"].ComponentOne, Dollar.ShortSleeveFemale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.ShortSleeveFemale["pants"].ComponentOne, Dollar.ShortSleeveFemale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.ShortSleeveFemale["torso2"].ComponentOne, Dollar.ShortSleeveFemale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.ShortSleeveFemale["shoes"].ComponentOne, Dollar.ShortSleeveFemale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.ShortSleeveFemale["accessory"].ComponentOne, Dollar.ShortSleeveFemale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.ShortSleeveFemale["bag"].ComponentOne, Dollar.ShortSleeveFemale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.ShortSleeveFemale["mask"].ComponentOne, Dollar.ShortSleeveFemale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.ShortSleeveFemale["vest"].ComponentOne, Dollar.ShortSleeveFemale["vest"].texture ,0)
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.ShortSleeveFemale["hat"].ComponentOne,Dollar.ShortSleeveFemale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.ShortSleeveFemale["glass"].ComponentOne,Dollar.ShortSleeveFemale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.ShortSleeveFemale['arms'].ComponentOne, Dollar.ShortSleeveFemale["arms"].texture ,0)
  
  end
end)


RegisterNetEvent('LongSleeve', function()
  if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then

  SetPedComponentVariation(PlayerPedId(), 8, Dollar.LongSleeve["t-shirt"].ComponentOne,Dollar.LongSleeve["t-shirt"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 4, Dollar.LongSleeve["pants"].ComponentOne, Dollar.LongSleeve["pants"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.LongSleeve["torso2"].ComponentOne, Dollar.LongSleeve["torso2"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.LongSleeve["shoes"].ComponentOne,Dollar.LongSleeve["shoes"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.LongSleeve["accessory"].ComponentOne, Dollar.LongSleeve["accessory"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.LongSleeve["bag"].ComponentOne, Dollar.LongSleeve["bag"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.LongSleeve["mask"].ComponentOne, Dollar.LongSleeve["mask"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.LongSleeve["vest"].ComponentOne, Dollar.LongSleeve["vest"].texture ,0)

  ClearPedProp(PlayerPedId(), 0)
  ClearPedProp(PlayerPedId(), 1)


  SetPedPropIndex(PlayerPedId(), 0, Dollar.LongSleeve["hat"].ComponentOne,Dollar.LongSleeve["hat"].texture ,0  )
  SetPedPropIndex(PlayerPedId(), 1, Dollar.LongSleeve["glass"].ComponentOne,Dollar.LongSleeve["glass"].texture ,0  )

  SetPedComponentVariation(PlayerPedId(),3 , Dollar.LongSleeve['arms'].ComponentOne, Dollar.LongSleeve["arms"].texture ,0)
  else
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.LongSleevefemale["t-shirt"].ComponentOne,Dollar.LongSleevefemale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.LongSleevefemale["pants"].ComponentOne, Dollar.LongSleevefemale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.LongSleevefemale["torso2"].ComponentOne, Dollar.LongSleevefemale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.LongSleevefemale["shoes"].ComponentOne,Dollar.LongSleevefemale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.LongSleevefemale["accessory"].ComponentOne, Dollar.LongSleevefemale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.LongSleevefemale["bag"].ComponentOne, Dollar.LongSleevefemale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.LongSleevefemale["mask"].ComponentOne, Dollar.LongSleevefemale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.LongSleevefemale["vest"].ComponentOne, Dollar.LongSleevefemale["vest"].texture ,0)
  
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.LongSleevefemale["hat"].ComponentOne,Dollar.LongSleevefemale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.LongSleevefemale["glass"].ComponentOne,Dollar.LongSleevefemale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.LongSleevefemale['arms'].ComponentOne, Dollar.LongSleevefemale["arms"].texture ,0)


  end


end)

RegisterNetEvent('TrooperTan', function()
  if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then

  SetPedComponentVariation(PlayerPedId(), 8, Dollar.TrooperTan["t-shirt"].ComponentOne,Dollar.TrooperTan["t-shirt"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 4, Dollar.TrooperTan["pants"].ComponentOne, Dollar.TrooperTan["pants"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.TrooperTan["torso2"].ComponentOne, Dollar.TrooperTan["torso2"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.TrooperTan["shoes"].ComponentOne,Dollar.TrooperTan["shoes"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.TrooperTan["accessory"].ComponentOne, Dollar.TrooperTan["accessory"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.TrooperTan["bag"].ComponentOne, Dollar.TrooperTan["bag"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.TrooperTan["mask"].ComponentOne, Dollar.TrooperTan["mask"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.TrooperTan["vest"].ComponentOne, Dollar.TrooperTan["vest"].texture ,0)

  ClearPedProp(PlayerPedId(), 0)
  ClearPedProp(PlayerPedId(), 1)


  SetPedPropIndex(PlayerPedId(), 0, Dollar.TrooperTan["hat"].ComponentOne,Dollar.TrooperTan["hat"].texture ,0  )
  SetPedPropIndex(PlayerPedId(), 1, Dollar.TrooperTan["glass"].ComponentOne,Dollar.TrooperTan["glass"].texture ,0  )

  SetPedComponentVariation(PlayerPedId(),3 , Dollar.TrooperTan['arms'].ComponentOne, Dollar.TrooperTan["arms"].texture ,0)

  else
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.TrooperTanfemale["t-shirt"].ComponentOne,Dollar.TrooperTanfemale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.TrooperTanfemale["pants"].ComponentOne, Dollar.TrooperTanfemale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.TrooperTanfemale["torso2"].ComponentOne, Dollar.TrooperTanfemale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.TrooperTanfemale["shoes"].ComponentOne,Dollar.TrooperTanfemale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.TrooperTanfemale["accessory"].ComponentOne, Dollar.TrooperTanfemale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.TrooperTanfemale["bag"].ComponentOne, Dollar.TrooperTanfemale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.TrooperTanfemale["mask"].ComponentOne, Dollar.TrooperTanfemale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.TrooperTanfemale["vest"].ComponentOne, Dollar.TrooperTanfemale["vest"].texture ,0)
  
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.TrooperTanfemale["hat"].ComponentOne,Dollar.TrooperTanfemale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.TrooperTanfemale["glass"].ComponentOne,Dollar.TrooperTanfemale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.TrooperTanfemale['arms'].ComponentOne, Dollar.TrooperTanfemale["arms"].texture ,0)
  



  end





end)

RegisterNetEvent('TrooperBlack', function()
  if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then

  SetPedComponentVariation(PlayerPedId(), 8, Dollar.TrooperBlack["t-shirt"].ComponentOne, Dollar.TrooperBlack["t-shirt"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 4, Dollar.TrooperBlack["pants"].ComponentOne, Dollar.TrooperBlack["pants"].texture, 0)
  SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.TrooperBlack["torso2"].ComponentOne, Dollar.TrooperBlack["torso2"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.TrooperBlack["shoes"].ComponentOne, Dollar.TrooperBlack["shoes"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.TrooperBlack["accessory"].ComponentOne, Dollar.TrooperBlack["accessory"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.TrooperBlack["bag"].ComponentOne, Dollar.TrooperBlack["bag"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.TrooperBlack["mask"].ComponentOne,Dollar.TrooperBlack["mask"].texture ,0)
  SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.TrooperBlack["vest"].ComponentOne, Dollar.TrooperBlack["vest"].texture ,0)

  ClearPedProp(PlayerPedId(), 0)
  ClearPedProp(PlayerPedId(), 1)


  SetPedPropIndex(PlayerPedId(), 0, Dollar.TrooperBlack["hat"].ComponentOne,Dollar.TrooperBlack["hat"].texture ,0  )
  SetPedPropIndex(PlayerPedId(), 1, Dollar.TrooperBlack["glass"].ComponentOne,Dollar.TrooperBlack["glass"].texture ,0  )

  SetPedComponentVariation(PlayerPedId(),3 , Dollar.TrooperBlack['arms'].ComponentOne, Dollar.TrooperBlack["arms"].texture ,0)

  else
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.TrooperBlackfemale["t-shirt"].ComponentOne, Dollar.TrooperBlackfemale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.TrooperBlackfemale["pants"].ComponentOne, Dollar.TrooperBlackfemale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.TrooperBlackfemale["torso2"].ComponentOne, Dollar.TrooperBlackfemale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.TrooperBlackfemale["shoes"].ComponentOne, Dollar.TrooperBlackfemale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.TrooperBlackfemale["accessory"].ComponentOne, Dollar.TrooperBlackfemale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.TrooperBlackfemale["bag"].ComponentOne, Dollar.TrooperBlackfemale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.TrooperBlackfemale["mask"].ComponentOne,Dollar.TrooperBlackfemale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.TrooperBlackfemale["vest"].ComponentOne, Dollar.TrooperBlackfemale["vest"].texture ,0)
  
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.TrooperBlackfemale["hat"].ComponentOne,Dollar.TrooperBlackfemale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.TrooperBlackfemale["glass"].ComponentOne,Dollar.TrooperBlackfemale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.TrooperBlackfemale['arms'].ComponentOne, Dollar.TrooperBlackfemale["arms"].texture ,0)
  






  end




end)

RegisterNetEvent("swat", function()
  if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then

  
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.swatmale["t-shirt"].ComponentOne, Dollar.swatmale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.swatmale["pants"].ComponentOne, Dollar.swatmale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.swatmale["torso2"].ComponentOne, Dollar.swatmale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.swatmale["shoes"].ComponentOne, Dollar.swatmale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.swatmale["accessory"].ComponentOne, Dollar.swatmale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.swatmale["bag"].ComponentOne, Dollar.swatmale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.swatmale["mask"].ComponentOne,Dollar.swatmale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.swatmale["vest"].ComponentOne, Dollar.swatmale["vest"].texture ,0)
  
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.swatmale["hat"].ComponentOne,Dollar.swatmale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.swatmale["glass"].ComponentOne,Dollar.swatmale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.swatmale['arms'].ComponentOne, Dollar.swatmale["arms"].texture ,0)
  else

  
    SetPedComponentVariation(PlayerPedId(), 8, Dollar.swatfemale["t-shirt"].ComponentOne, Dollar.swatfemale["t-shirt"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 4, Dollar.swatfemale["pants"].ComponentOne, Dollar.swatfemale["pants"].texture, 0)
    SetPedComponentVariation(PlayerPedId(), 11 ,Dollar.swatfemale["torso2"].ComponentOne, Dollar.swatfemale["torso2"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 6 ,Dollar.swatfemale["shoes"].ComponentOne, Dollar.swatfemale["shoes"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 7 ,Dollar.swatfemale["accessory"].ComponentOne, Dollar.swatfemale["accessory"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 5 ,Dollar.swatfemale["bag"].ComponentOne, Dollar.swatfemale["bag"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 1 ,Dollar.swatfemale["mask"].ComponentOne,Dollar.swatfemale["mask"].texture ,0)
    SetPedComponentVariation(PlayerPedId(), 9 ,Dollar.swatfemale["vest"].ComponentOne, Dollar.swatfemale["vest"].texture ,0)
  
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
  
  
    SetPedPropIndex(PlayerPedId(), 0, Dollar.swatfemale["hat"].ComponentOne,Dollar.swatfemale["hat"].texture ,0  )
    SetPedPropIndex(PlayerPedId(), 1, Dollar.swatfemale["glass"].ComponentOne,Dollar.swatfemale["glass"].texture ,0  )
  
    SetPedComponentVariation(PlayerPedId(),3 , Dollar.swatfemale['arms'].ComponentOne, Dollar.swatfemale["arms"].texture ,0)





  end

end)


RegisterNetEvent("giveheal", function(data)
  checkhealth()
end)
RegisterNetEvent("givearmour", function(data)
  checkarmour()
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


AddEventHandler("onResourceStart", function(JobInfo)
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)