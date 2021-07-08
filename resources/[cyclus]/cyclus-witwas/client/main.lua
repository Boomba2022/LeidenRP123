local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX              = nil
local PlayerData = {}

local currentMoney = 0
local currentblackMoney = 0
local currentWashCost = 0

MenuOpened = false
letsleep = false
beslissing = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
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



local isMenuOpen = false

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 1074.16, -2450.96, 29.12, true)
        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped)
		letsleep = true
		if dist < 3.0 then 
				letsleep = false
				DrawScriptText(vector3(1074.16, -2450.96, 29.12) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Aankloppen')
				DrawMarker(20, vector3(1074.16, -2450.96, 29.12), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 

                    Progressbar("kloppen", "Aankloppen bij warehouse...", 2000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "timetable@jimmy@doorknock@",
                        anim = "knockdoor_idle",
                        flags = 16
                    }, {}, {}, function() -- Done
                        SetEntityCoords(ped, 1137.84, -3197.86, -39.67, false, false, false, true)
                    end, function()
                end)
            end
        end
    end
    if letsleep then 
        Wait(500)
    end
end)


Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 1129.57, -3194.13, -40.4, true)
		letsleep = true
		if dist < 3.0 then 
				letsleep = false
				DrawScriptText(vector3(1129.57, -3194.13, -40.4) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Witwassen')
				DrawMarker(20, vector3(1129.57, -3194.13, -40.4), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 

                    Progressbar("inloggen", "Aan het inloggen op de tablet...", 2000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mp_prison_break",
                        anim = "hack_loop",
                        flags = 8
                    }, {}, {}, function() -- Done
                        ESX.TriggerServerCallback('cyclus-witwas:getPlayerStats', function(blackmoney, money) 
                            currentblackMoney = blackmoney
                            currentMoney = money
                            currentWashCost = Config.WashingCost
                        end)
                    Citizen.Wait(500)
                    SetDisplay(not display)
                    isMenuOpen = true  
                    end, function()
                end)
            end
        end
    end
    if letsleep then 
        Wait(500)
    end
end)


RegisterNUICallback("exit", function(data) 
    print("UI Closed")
    SetDisplay(false) 
    isMenuOpen = false
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    print(currentblackMoney)
    SendNUIMessage({
        type = "ui",
        status = bool,
        currentblackMoney = currentblackMoney,
        currentWashCost = currentWashCost,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)


Citizen.CreateThread(function()
        local blip = Config.MoneyWashingDealer["pos"]


        if Config.MoneyWashingDealer["showBlip"] == true then

            if blip then
                    blip = AddBlipForCoord(Config.MoneyWashingDealer["pos"]["x"], Config.MoneyWashingDealer["pos"]["y"], Config.MoneyWashingDealer["pos"]["z"])
                    SetBlipSprite(blip, 225)
                    SetBlipDisplay(blip, 4)
                    SetBlipScale(blip, 1.0)
                    SetBlipColour(blip, 46)
                    SetBlipAsShortRange(blip, true)
    
                    BeginTextCommandSetBlipName("moneyWashBlip")
                    AddTextEntry("moneyWashBlip", Config.MoneyWashingDealer["blipName"])
                    EndTextCommandSetBlipName(blip)
                
            end

        end

        
    
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 1118.77, -3193.29, -40.39, true)
        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped)
		letsleep = true
		if dist < 3.0 then 
				letsleep = false
				DrawScriptText(vector3(1118.77, -3193.29, -40.39) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Warehouse verlaten')
				DrawMarker(20, vector3(1118.77, -3193.29, -40.39), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 

                    Progressbar("verlaten", "Warehouse verlaten...", 2000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "timetable@jimmy@doorknock@",
                        anim = "knockdoor_idle",
                        flags = 16
                    }, {}, {}, function() -- Done
                        SetEntityCoords(ped, 1074.16, -2450.96, 29.12, false, false, false, true)
                        exports['mn-notify']:grotenotification('Warehouse', 'Verlaat stil het warehouse! Voordat, iemand het verdacht vind', 'fas fa-warehouse', '5000', '#19608f', true)
                    end, function()
                end)
            end
        end
    end
    if letsleep then 
        Wait(500)
    end
end)

Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish ~= nil then
                onFinish()
            end
        else
            if onCancel ~= nil then
                onCancel()
            end
        end
    end)
end

function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end


RegisterNUICallback("success", function(data) 
    SetDisplay(false) 
    isMenuOpen = false

    TriggerServerEvent("cyclus-witwas:successEvent")
   

    
end)