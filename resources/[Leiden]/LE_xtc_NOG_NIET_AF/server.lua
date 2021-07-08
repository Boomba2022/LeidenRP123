print("XTC is geladen")
	
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_opiumcar:start')
AddEventHandler('esx_opiumcar:start', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('morfine').count >= 5 and xPlayer.getInventoryItem('papaverine').count >= 2 and xPlayer.getInventoryItem('kookstel').count >= 1 then
		if xPlayer.getInventoryItem('opium').count >= 30 then
				TriggerClientEvent('esx_opiumcar:notify', _source, "~r~~h~You cant hold more meth")
		else
			TriggerClientEvent('esx_opiumcar:startprod', _source)
			xPlayer.removeInventoryItem('morfine', 5)
			xPlayer.removeInventoryItem('papaverine', 2)
		end

		
		
	else
		TriggerClientEvent('esx_opiumcar:notify', _source, "~r~~h~Not enough supplies to start producing Meth")

	end
	
end)
RegisterServerEvent('esx_opiumcar:stopf')
AddEventHandler('esx_opiumcar:stopf', function(id)
local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(_source)
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx_opiumcar:stopfreeze', xPlayers[i], id)
	end
	
end)
RegisterServerEvent('esx_opiumcar:make')
AddEventHandler('esx_opiumcar:make', function(posx,posy,posz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('kookstel').count >= 1 then
	
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('esx_opiumcar:smoke',xPlayers[i],posx,posy,posz, 'a') 
		end
		
	else
		TriggerClientEvent('esx_opiumcar:stop', _source)
	end
	
end)
RegisterServerEvent('esx_opiumcar:finish')
AddEventHandler('esx_opiumcar:finish', function(qualtiy)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	print(qualtiy)
	local rnd = math.random(-5, 5)
	TriggerEvent('KLevels:addXP', _source, 20)
	xPlayer.addInventoryItem('opium', math.floor(qualtiy / 2) + rnd)
	
end)

RegisterServerEvent('esx_opiumcar:blow')
AddEventHandler('esx_opiumcar:blow', function(posx, posy, posz)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(_source)
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx_opiumcar:blowup', xPlayers[i],posx, posy, posz)
	end
	xPlayer.removeInventoryItem('kookstel', 1)
end)

