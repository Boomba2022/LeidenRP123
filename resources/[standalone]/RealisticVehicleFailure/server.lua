------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--

ESX 						   = nil
local MechanicConnected        = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function checkWhitelist(id)
	for key, value in pairs(RepairWhitelist) do
		if id == value then
			return true
		end
	end	
	return false
end

AddEventHandler('chatMessage', function(source, _, message)
	local msg = string.lower(message)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/repareer" then
		CancelEvent()
		if RepairEveryoneWhitelisted == true and MechanicConnected < 2 then
			TriggerClientEvent('iens:repair', source)
		else
			if checkWhitelist(identifier) then
				TriggerClientEvent('iens:repair', source)
			else
				TriggerClientEvent('iens:notAllowed', source)
			end
		end
	end
end)

-- Telt de anwb
function CountMechanic()

	local xPlayers = ESX.GetPlayers()

	MechanicConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'mechanic' then
			MechanicConnected = MechanicConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountMechanic)
end

CountMechanic()


RegisterServerEvent('repareer:betaal')
AddEventHandler('repareer:betaal', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local amount = ESX.Math.Round(price)


		if price > 0 then
			xPlayer.removeAccountMoney('bank', amount)
		end
	end)