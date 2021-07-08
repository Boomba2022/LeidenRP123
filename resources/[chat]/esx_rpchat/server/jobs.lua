ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('job', function(source, args, raw)

	local xPlayer = ESX.GetPlayerFromId(source)
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	if xPlayer["job"]["name"] == "mechanic" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(209, 98, 0, 0.76); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('mec_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chatanwb', name, args)
	elseif xPlayer["job"]["name"] == "police" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(19, 109, 212, 0.76); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('pol_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chatpol', name, args)
	elseif xPlayer["job"]["name"] == "ambulance" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(217, 204, 22, 0.84); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('med_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chatmed', name, args)
	elseif xPlayer["job"]["name"] == "taxi" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(192, 186, 54, 1); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('tax_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chattax', name, args)
	elseif xPlayer["job"]["name"] == "cardealer" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(0, 255, 75, 0.6); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('dealer_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chatdeal', name, args)
	elseif xPlayer["job"]["name"] == "realestateagent" then
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(162, 168, 76, 1.0); border-radius: 3px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('mak_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		TriggerEvent('logs:chatmak', name, args)
  end
end, false)

RegisterCommand('bedrijfsgeld', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
          TriggerClientEvent('b1g_notify:client:Notify', source, { type = 'msg', text = 'Het berdijf heeft momenteel $' .. money .. ' in de pot' })

																	
	else

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Geen toegang!'})
																			
	end
end, false)

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end
