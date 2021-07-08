

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("KWiet:get")
AddEventHandler("KWiet:get", function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
		
				if xPlayer.getInventoryItem('weed').count <= 200 then
					xPlayer.addInventoryItem("weed", math.random(1,2))
					else
					TriggerClientEvent('esx:showNotification', source, '~r~Je kan niet meer wiet bladeren bij je hebben!')
				end

			
end)




ESX.RegisterServerCallback('KWiet:process', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('weed').count >= 2 then
					xPlayer.removeInventoryItem('weed', 2) 
					xPlayer.addInventoryItem('weed_pooch', 1) 
					cb(true)
				else
				TriggerClientEvent('esx:showNotification', source, '~r~Je hebt niet genoeg wiet bladeren.')
				cb(false)
				end
			

end)



