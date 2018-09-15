local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  }
  
ESX                           = nil
local isFishing 			  = false
local isHoldingFiskeSpo       = false

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local blips = {
    
    {title="Fiskeplats", colour=3, id=68, x = -1752.61, y = -1141.63, z = 12.1};
	{title="Sälj fisk", colour=3, id=356, x = -1845.41, y = -1196.15, z = 18.5};
	{title="Fiskeutrustning", colour=25, id=52, x = -1340.91, y = -1266.41, z = 4.05};

}
  
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
      while true do
      
      Citizen.Wait(0)
      
          local coords = GetEntityCoords(GetPlayerPed(-1))
          if GetDistanceBetweenCoords(coords, -1741.82, -1129.24, 12.17, true) < 100 then
              DrawMarker(27, -1741.82, -1129.24, 12.17, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
              if GetDistanceBetweenCoords(coords, -1741.82, -1129.24, 12.17, true) < 1.5 then
              Draw3DText(-1741.82, -1129.24, 12.96, tostring("Tryck på ~r~[E]~w~ för att fiska."))
              if IsControlPressed(0,  Keys['E']) and not isFishing then
                TriggerServerEvent('loffe-fishing:checkItem')
                Citizen.Wait(500)
              end
          end
		  end
		  if GetDistanceBetweenCoords(coords, -1743.83, -1131.65, 12.17, true) < 100 then
              DrawMarker(27, -1743.83, -1131.65, 12.17, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
              if GetDistanceBetweenCoords(coords, -1743.83, -1131.65, 12.17, true) < 1.5 then
              Draw3DText(-1743.83, -1131.65, 12.97, tostring("Tryck på ~r~[E]~w~ för att fiska."))
              if IsControlPressed(0,  Keys['E']) and not isFishing then
                TriggerServerEvent('loffe-fishing:checkItem')
                Citizen.Wait(500)
              end
          end
		  end
		  if GetDistanceBetweenCoords(coords, -1739.94, -1126.98, 12.17, true) < 100 then
              DrawMarker(27, -1739.94, -1126.98, 12.17, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
              if GetDistanceBetweenCoords(coords, -1739.94, -1126.98, 12.17, true) < 1.5 then
              Draw3DText(-1739.94, -1126.98, 12.97, tostring("Tryck på ~r~[E]~w~ för att fiska."))
              if IsControlPressed(0,  Keys['E']) and not isFishing then
                TriggerServerEvent('loffe-fishing:checkItem')
                Citizen.Wait(500)
              end
          end
		  end
		  if GetDistanceBetweenCoords(coords, -1845.28, -1195.79, 18.33, true) < 100 then
              DrawMarker(27, -1845.28, -1195.79, 18.33, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
              if GetDistanceBetweenCoords(coords, -1845.28, -1195.79, 18.337, true) < 1.5 then
              Draw3DText(-1845.28, -1195.79, 19.32, tostring("Tryck på ~r~[E]~w~ för att sälja alla dina fiskar."))
              if IsControlPressed(0,  Keys['E']) and not isFishing then
                TriggerServerEvent('loffe-fishing:sellFish')
                Citizen.Wait(500)
              end
          end
		  end
		  if GetDistanceBetweenCoords(coords, -1340.6, -1266.57, 4.05, true) < 100 then
              DrawMarker(27, -1340.6, -1266.57, 4.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
              if GetDistanceBetweenCoords(coords, -1340.6, -1266.57, 4.05, true) < 1.5 then
              Draw3DText(-1340.6, -1266.57, 4.85, tostring("Tryck på ~r~[E]~w~ för att handla fiskeutrustning."))
              if IsControlPressed(0,  Keys['E']) then
                OpenFishMenu()
                Citizen.Wait(500)
              end
          end
      end
      end
end) 
  
RegisterNetEvent('loffe-fishing:startFishing')
AddEventHandler('loffe-fishing:startFishing', function()

	isFishing = true
end)

function DrawScreenText(text, color, position, size, center)
	SetTextCentre(center)
	SetTextColour(color[1], color[2], color[3], color[4])
	SetTextFont(color[1])
	SetTextScale(size[1], size[2])
	Citizen.InvokeNative(0x61BB1D9B3A95D802, 7)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(position[1], position[2])
end

function OpenFishMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'fish_menu',
        {
            title    = 'Fiskeutrustning',
            elements = {
				{label = 'Fiskespö x 1 [1500 SEK]', value = 'sausage_1', item = 'fiskespo', price = 1500, amount = 1},
				{label = 'Fiskebete x 1 [5 SEK]', value = 'sausage_1', item = 'bait', price = 5, amount = 1},
				{label = 'Fiskebete x 25 [100 SEK]', value = 'water_1', item = 'bait', price = 100, amount = 25},
            }
        },
        function(data, menu)
            local item = data.current.item
            local price = data.current.price
			local amount = data.current.amount
            TriggerServerEvent('loffe-fishing:buy', item, price, amount)
        end,
    function(data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function()
	
	while true do
	
	Citizen.Wait(0)
	local randomTime = math.random(5000, 10000)
	local coords = GetEntityCoords(GetPlayerPed(-1), true)
	local fishingRod = GetClosestObjectOfType(coords, 10.0, GetHashKey("prop_fishing_rod_01"), false, false, false)
	if isFishing and not isHoldingFiskeSpo then
	isFishing = false
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, false)
	SetEntityHeading(GetPlayerPed(-1), 232.46)
	Citizen.Wait(randomTime)
	isHoldingFiskeSpo = true
	end
	if isHoldingFiskeSpo then
	DrawScreenText('Tryck på ~g~ENTER ~w~för att fånga fisken!', {255, 255, 255, 255, 1}, { 0.600, 0.930 }, { 0.75, 0.75 }, true)
	if IsControlPressed(0,  Keys['ENTER']) then
	TriggerServerEvent('loffe-fishing:giveFish')
	isHoldingFiskeSpo = false
	ClearPedTasks(GetPlayerPed(-1))
	Citizen.Wait(500)
	SetEntityAsMissionEntity(fishingRod, 1, 1)
	DeleteEntity(fishingRod)
	end
	end
	end
end)
  
function Draw3DText(x, y, z, text)
      local onScreen, _x, _y = World3dToScreen2d(x, y, z)
      local p = GetGameplayCamCoords()
      local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
      local scale = (1 / distance) * 2
      local fov = (1 / GetGameplayCamFov()) * 100
      local scale = scale * fov
      if onScreen then
          SetTextScale(0.0*scale, 0.35*scale)
          SetTextFont(0)
          SetTextProportional(1)
          SetTextColour(255, 255, 255, 255)
          SetTextDropshadow(0, 0, 0, 0, 255)
          SetTextEdge(2, 0, 0, 0, 150) 
          SetTextDropShadow()
          SetTextOutline()
          SetTextEntry("STRING")
          SetTextCentre(1)
          AddTextComponentString(text)
          DrawText(_x,_y)
      end
end

--[[
--]]
