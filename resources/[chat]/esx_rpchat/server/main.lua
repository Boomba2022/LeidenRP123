ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

	if Config.EnableESXIdentity then name = GetPlayerName(source) end
	end
end)

RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
		args = { _U('ooc_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
    TriggerEvent('logs:chatOoc', name, args)
end, false)
--
RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
		args = { _U('twt_prefix', name), '^*'..args }, color = { 255, 255, 255 } --{ 0, 153, 204 }
	})
	TriggerEvent('logs:chatTwt', name, args)
end, false)

RegisterCommand('fb', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(59, 89, 152, 1); border-radius: 3px;"><i class="fab fa-facebook"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
		args = { _U('twt_prefix', name), '^*'..args }, color = { 255, 255, 255 } --{ 0, 153, 204 }
	})
	TriggerEvent('logs:chatfb', name, args)
end, false)

RegisterCommand('anontwt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end


	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(3, 24, 252, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
		args = { _U('anontwt_prefix', name), '^*'..args }, color = { 255, 255, 255 } --{ 0, 153, 204 }
	})
	TriggerEvent('logs:chataTwt', name, args)
end, false)
--
RegisterCommand('ad', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(230, 165, 14, 1); border-radius: 3px;"><i class="fas fa-ad"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
		args = { _U('ad_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	TriggerEvent('logs:chatad', name, args)
end, false)

TriggerClientEvent("pNotify:SetQueueMax", -1, alerts, 5)

TriggerEvent('es:addGroupCommand', 'nlalert', "steam",function(source, args, user)
	TriggerEvent('InteractSound_SV:PlayOnAll', 'alert', 0.8)
	TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "<center><b style='color:red'>NLALERT</b> <br/><b style='color:white'> </br>" ..table.concat(args, " ").. "</b><br /></center>",
				type = "alert",
				queue = "alerts",
				timeout = 30000,
				layout = "centerLeft",
				theme = "gta",
			})		
end, {help = "Geef NL Alert uit"})

function GetPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
