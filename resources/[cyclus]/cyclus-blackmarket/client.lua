----------------------------------------
------------- Made By Atrixx#0001 ------
---------- Founder | Cyclus Scripts ----
----------------------------------------

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

ESX = nil

local initialCooldownSeconds = Cyclus.Cooldown
local cooldownSecondsRemaining = Cyclus.StartCooldown

beslissing = false
letsleep = false
CurrentJob = nil
hoertjevdb = false
gestart = false 


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('cyclus-blackmarket:setcooldown')
AddEventHandler('cyclus-blackmarket:setcooldown', function(time)
	cooldown = time
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, Cyclus.Locatie[1].x, Cyclus.Locatie[1].y, Cyclus.Locatie[1].z, true)
        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped)
		letsleep = true
		if dist < 3.0 then 
				letsleep = false
                if cooldownSecondsRemaining == 0 then
				DrawScriptText(vector3(Cyclus.Locatie[1].x, Cyclus.Locatie[1].y, Cyclus.Locatie[1].z) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Inloggen')
				DrawMarker(20, vector3(Cyclus.Locatie[1].x, Cyclus.Locatie[1].y, Cyclus.Locatie[1].z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then

                        Progressbar("inloggen", "Inloggen...", 2000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_prison_break",
                            anim = "hack_loop",
                            flags = 8
                        }, {}, {}, function() -- Done
                            TriggerEvent("mhacking:show")
                            TriggerEvent("mhacking:start",Cyclus.HackBlocks,Cyclus.HackTime,hackeoEvent)
                        end, function()
                    end)
                end
            else 
                local seconds = cooldownSecondsRemaining
                DrawScriptText(vector3(Cyclus.Locatie[1].x, Cyclus.Locatie[1].y, Cyclus.Locatie[1].z), 'Hack Cooldown: '..seconds..' sec')
            end
        end
        if letsleep then 
            Wait(500)
        end
    end
end)

function hackeoEvent(success)
	local ped = GetPlayerPed(-1)
	local coords = GetEntityCoords(ped)
	TriggerEvent('mhacking:hide')	
	if success then	
		boveda = true
		inVault = false
		TriggerServerEvent('union:vault',true)
		TriggerServerEvent('union:log')
		DeleteObject(StandObject)
        beslissing = true
        exports['cyclus-notify']:grotenotification('Blackmarket', 'Wil je de coördinaten instellen, van de blackmarket? [G] · Ja | [H] · Nee', 'fas fa-user-secret', '5000', '#146dc8', true)
        cooldownSecondsRemaining = 150
    else 
        cooldownSecondsRemaining = 150
	end		
	ClearPedTasksImmediately(ped)
end

Citizen.CreateThread(function()
	while true do
		Wait(5)
		if not fixt then
			if beslissing then
				if IsControlJustReleased(0, Keys['G']) then
					startgps()
                    gestart = true 
				elseif IsControlJustReleased(0, Keys['H']) then
					beslissing = false
					exports['mythic_notify']:SendAlert('inform', 'Dit was een unieke kans, om de locatie van de blackmarket te achterhalen!!!')
				end
			end
		end
        if letsleep then 
            Wait(500)
        end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, Cyclus.Locatie[2].x, Cyclus.Locatie[2].y, Cyclus.Locatie[2].z, true)
        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped)
		letsleep = true
        if gestart then
            if dist < 2.5 then 
                    letsleep = false
                    DrawScriptText(vector3(Cyclus.Locatie[2].x, Cyclus.Locatie[2].y, Cyclus.Locatie[2].z) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Bekijk Assortiment')
                    DrawMarker(20, vector3(Cyclus.Locatie[2].x, Cyclus.Locatie[2].y, Cyclus.Locatie[2].z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
                    if IsControlJustReleased(0, Keys["E"]) then
                    exports['br-menu']:SetTitle("Blackmarket")
                    exports['br-menu']:AddButton("Pistol .50" , "Koop vuurwapen voor: 200k" ,'cyclus-blackmarket:WapenKopen' , 'WEAPON_PISTOL50' ,"menuone")
                    exports['br-menu']:AddButton("Sns Pistol" , "Koop item voor: 100k euro" ,'cyclus-blackmarket:WapenKopen' , 'WEAPON_SNSPISTOL' ,"menuone")
                end
            end
        end
        if letsleep then 
            Wait(500)
        end
    end
end)


RegisterNetEvent('cyclus-blackmarket:WapenKopen')
AddEventHandler('cyclus-blackmarket:WapenKopen', function(Pistol)
local src = source 
TriggerServerEvent('cyclus-blackmarket:ServerWapenKopen', Pistol)
TriggerServerEvent("cyclus-logging:createlog", Cyclus.webhook, '', false, "cyclus-blackmarket")
RemoveBlip(Blip)
exports['mythic_notify']:SendAlert('success', 'Wapen succesvol gekocht')
end)

RegisterNetEvent('cyclus-blackmarket:clientsync')
AddEventHandler('cyclus-blackmarket:clientsync', function(nigger)
cooldownSecondsRemaining = nigger
end)

Citizen.CreateThread(function()
    while true do
        if cooldownSecondsRemaining > 0 then
            Citizen.Wait(1000)
            cooldownSecondsRemaining = cooldownSecondsRemaining - 1
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterCommand('endblackmarket', function(source)
        RemoveBlip(Blip) 
        exports['mythic_notify']:SendAlert('inform', 'Locatie succesvol verwijderd')
end)

startgps = function()

	Blip = AddBlipForCoord(Cyclus.Locatie[2].x, Cyclus.Locatie[2].y, Cyclus.Locatie[2].z)
	SetBlipSprite(Blip, 1)
	SetBlipDisplay(Blip, 4)
	SetBlipScale(Blip, 1.25)
	SetBlipColour(Blip, 3)
	SetBlipAsShortRange(Blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Cyclus Scripts | Blackmarket')
	EndTextCommandSetBlipName(Blip)
	SetBlipRoute(Blip, true)

	exports['mythic_notify']:SendAlert('inform', 'Coordinaten ingesteld')
end

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