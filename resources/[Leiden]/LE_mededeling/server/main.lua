ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("mededeling", function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	
    if xPlayer.getGroup() == 'owner' or xPlayer.getGroup() == 'hman' then
	    TriggerClientEvent("messageAnnouncement", -1, source, table.concat(args, " "))
	end	
end)

