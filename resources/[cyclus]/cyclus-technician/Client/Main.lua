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

ESX             = nil
local PlayerData = {}

MenuOpened = false
OnDuty = false
CurrentJob = nil
LastVehicle = 0

MainBlip = nil
letsleep = false
hoertjevdb = false
fixt = false
beslissing = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	while true do
		if ESX == nil then
			Citizen.Wait(1)
		else
			ESX.PlayerData = xPlayer
			break
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(7)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 135.11, 322.98, 116.63, true)
		letsleep = true
		if dist < 2.5 then 
			if not hoertjevdb then
				letsleep = false
				DrawScriptText(vector3(135.11, 322.98, 116.63) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Inklokken')
				DrawMarker(20, vector3(135.11, 322.98, 116.63), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 
					hoertjevdb = true
					exports['mythic_notify']:SendAlert('success', 'Je bent ingeklokt veel werk plezier!')
				end
			else
				letsleep = false
				DrawScriptText(vector3(135.11, 322.98, 116.63) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Uitklokken')
				DrawMarker(20, vector3(135.11, 322.98, 116.63), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 
					hoertjevdb = false
					exports['mythic_notify']:SendAlert('error', 'Je bent uitgeklokt doe maar weer saai!')
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
		Citizen.Wait(7)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 149.61, 322.11, 112.14, true)
		letsleep = true
		if dist < 2.5 then 
			if hoertjevdb then
				letsleep = false
				DrawScriptText(vector3(149.61, 322.11, 112.14) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Garage')
				DrawMarker(20, vector3(149.61, 322.11, 112.14), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
				if IsControlJustReleased(0, Keys["E"]) then 
					VehicleHash = GetHashKey("speedo4")

					RequestModel(VehicleHash)
						Progressbar("pakken", "Voertuig pakken...", 2000, false, true, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {
						}, {}, {}, function() -- Done
							NewVehicle = CreateVehicle(
								VehicleHash, 
								Cyclus.VehicleSpawn.X, Cyclus.VehicleSpawn.Y, Cyclus.VehicleSpawn.Z,
								Cyclus.VehicleSpawn.Heading,
								true, false
							)
		
							if (Cyclus.LicensePlate ~= "") then
								SetVehicleNumberPlateText(NewVehicle, Cyclus.LicensePlate)
							end
		
							SetVehicleOnGroundProperly(NewVehicle)
							SetModelAsNoLongerNeeded(VehicleHash)
		
							startgps()
							TaskWarpPedIntoVehicle(PlayerPedId(), NewVehicle, -1)
						end, function()
					end)
				end
			end
		end
		if letsleep then 
			Wait(500)
		end
	end
end)

startgps = function()
	if CurrentJob == nil then
		RandomJob = Cyclus.Jobs[math.random(1, #Cyclus.Jobs)]
							
		CurrentJob = {}

		CurrentJob["X"] = RandomJob.X
		CurrentJob["Y"] = RandomJob.Y
		CurrentJob["Z"] = RandomJob.Z

		CurrentJob["Blip"] = AddBlipForCoord(CurrentJob.X, CurrentJob.Y, CurrentJob.Z)
		SetBlipSprite(CurrentJob.Blip, 1)
		SetBlipDisplay(CurrentJob.Blip, 4)
		SetBlipScale(CurrentJob.Blip, 1.25)
		SetBlipColour(CurrentJob.Blip, 73)
		SetBlipAsShortRange(CurrentJob.Blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Cyclus.JobBlipName)
		EndTextCommandSetBlipName(CurrentJob.Blip)
		SetBlipRoute(CurrentJob.Blip, true)

		CurrentJob["Enabled"] = false

		exports['mythic_notify']:SendAlert('inform', 'GPS ingesteld!')

	else
		exports['mythic_notify']:SendAlert('error', 'Je bent nog bezig met een opdracht! U moet deze eerst beëindigen')
	end
end

RegisterCommand('endtechnician', function(source)
	if hoertjevdb then 
		if CurrentJob then
			if CurrentJob ~= {} then
				RemoveBlip(CurrentJob.Blip)
				DeleteWaypoint()
				CurrentJob = nil

				exports['mythic_notify']:SendAlert('inform', 'Opdracht succesvol beëindigd')

			else
				ESX.ShowNotification(Cyclus.TranslationList[Cyclus.Translation]["MENU_NONE"], false, true, 90)
			end
		else
			exports['mythic_notify']:SendAlert('error', 'Je bent nog geen opdracht gestart')
		end
	else
		exports['mythic_notify']:SendAlert('error', 'Je bent nog niet ingeklokt!')
	end
end)

RegisterNUICallback("main", function(RequestData)
	if RequestData.ReturnType == "EXIT" then
		if CurrentJob ~= {} then
			CurrentJob.Enabled = false

			SetNuiFocus(false, false)
			SendNUIMessage({RequestType = "Visibility", RequestData = false})
			fixt = false
		else
			ESX.ShowNotification(Cyclus.TranslationList[Cyclus.Translation]["MENU_NONE"], false, true, 90)
		end
	elseif RequestData.ReturnType == "DONE" then
		if CurrentJob ~= {} then
			fixt = true
			SetNuiFocus(false, false)
			SendNUIMessage({RequestType = "Visibility", RequestData = false})

			RemoveBlip(CurrentJob.Blip)
			DeleteWaypoint()
			CurrentJob = nil

			Progressbar("fix_job", "Elektriciteit fixen...", 2000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "anim@gangops@facility@servers@",
				anim = "hotwire",
				flags = 16,
			}, {}, {}, function()
				fixt = false
				RemoveBlip(currentblip)
				TriggerServerEvent('cyclus-technician:PayMoney')
				ClearPedTasksImmediately(GetPlayerPed(-1))
				beslissing = true
				exports['mythic_notify']:SendAlert('inform', 'Wil je nog een opdracht starten? Ja [G] Nee [H]')
				end, function()
			end)
		else
			ESX.ShowNotification(Cyclus.TranslationList[Cyclus.Translation]["MENU_NONE"], false, true, 90)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)
		if not fixt then
			if beslissing then
				if IsControlJustReleased(0, Keys['G']) then
					startgps()
				elseif IsControlJustReleased(0, Keys['H']) then
					beslissing = false
					exports['mythic_notify']:SendAlert('inform', 'Ga weer terug naar de loods om je voertuig terug te brengen')
				end
			else
				Wait(500)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(7)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if hoertjevdb then
            if CurrentJob ~= nil then
                local dist = GetDistanceBetweenCoords(coords, CurrentJob.X, CurrentJob.Y, CurrentJob.Z , true)
                if dist < 2.5 then 
					DrawMarker(20, vector3(CurrentJob.X, CurrentJob.Y, CurrentJob.Z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
					DrawScriptText(vector3(CurrentJob.X, CurrentJob.Y, CurrentJob.Z), '~b~E~w~ · Elektriciteit fixen')
					if IsControlJustReleased(0, Keys["E"]) then
						SendNUIMessage({
							action = "main"
						})
						SetNuiFocus(true, true)
						SendNUIMessage({RequestType = "Visibility", RequestData = true})
					end
                end
            end
        end
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

LockerCoords = vector3(Cyclus.Locker.X, Cyclus.Locker.Y, Cyclus.Locker.Z)
GarageCoords = vector3(Cyclus.Garage.X, Cyclus.Garage.Y, Cyclus.Garage.Z)
DeleteCoords = vector3(Cyclus.VehicleDelete.X, Cyclus.VehicleDelete.Y, Cyclus.VehicleDelete.Z)

Citizen.CreateThread(function() -- Locker
	while true do
		Citizen.Wait(1)

		if ESX ~= nil then
			PlayerJobInfo = ESX.PlayerData.job

			if PlayerJobInfo ~= nil then
				if PlayerJobInfo.name == "technician" then
					-- Blip
					if MainBlip == nil then
						MainBlip = AddBlipForCoord(Cyclus.Locker.X, Cyclus.Locker.Y, Cyclus.Locker.Z)
						SetBlipSprite(MainBlip, 354)
						SetBlipDisplay(MainBlip, 4)
						SetBlipScale(MainBlip, 1.5)
						SetBlipColour(MainBlip, 73)
						SetBlipAsShortRange(MainBlip, true)
						BeginTextCommandSetBlipName("STRING")
						AddTextComponentString(Cyclus.BlipName)
						EndTextCommandSetBlipName(MainBlip)
					end
				else
					if MainBlip ~= nil then
						RemoveBlip(MainBlip)
						MainBlip = nil
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local dist = GetDistanceBetweenCoords(coords, 143.01, 309.20, 112.13, true)
		letsleep = true
		if dist < 5 then 
			if hoertjevdb then
				letsleep = false
				if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
					DrawScriptText(vector3(143.01, 309.20, 112.13) + vector3(0.0, 0.0, 0.20), '~b~E~w~ · Voertuig wegzetten')
					DrawMarker(20, vector3(143.01, 309.20, 112.13), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
					if IsControlJustReleased(0, Keys["E"]) then
						PlayerVehicle = GetVehiclePedIsIn(PlayerPedId()) 
						SetEntityAsMissionEntity(PlayerVehicle, true, true)
							Progressbar("wegzetten", "Voertuig wegzetten..", 2000, false, true, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							}, {
							}, {}, {}, function() -- Done
							DeleteVehicle(PlayerVehicle)
							RemoveBlip(currentblip)
							CurrentJob = nil
							end,  function()
						end)
					end
				end
			end
		end
		if letsleep then 
			Wait(500)
		end
	end
end)


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