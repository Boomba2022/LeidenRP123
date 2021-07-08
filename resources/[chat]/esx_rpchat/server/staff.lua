ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local savedCoords   = {}
local Owner = "command.bh"
local abh = "command.abh"
local hman = "command.hman"
local ahman = "command.ahman"
local sman = "command.sman"
local man = "command.man"
local jman = "command.jman"
local hmod = "command.hmod"
local smod = "command.smod"
local mod = "command.mod"
local jmod = "command.jmod"

RegisterCommand('sb', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

    CancelEvent()
          if IsPlayerAceAllowed(source, Owner) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(78, 196, 187, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('bh_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
		elseif IsPlayerAceAllowed(source, abh) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(0, 249, 255, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('abh_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
		elseif IsPlayerAceAllowed(source, hman) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(160, 0, 144, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('hman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
		elseif IsPlayerAceAllowed(source, ahman) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(122, 196, 48, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('ahman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
		elseif IsPlayerAceAllowed(source, sman) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(142, 18, 221, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('sman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
          elseif IsPlayerAceAllowed(source, man) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(164, 68, 235, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('man_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
          elseif IsPlayerAceAllowed(source, jman) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(192, 97, 255, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('jman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
          elseif IsPlayerAceAllowed(source, smod) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(5, 158, 1, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('smod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
	        elseif IsPlayerAceAllowed(source, mod) then
				TriggerClientEvent('chat:addMessage', -1, { 
					template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(8, 173, 5, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
					args = { _U('mod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
				})
	        elseif IsPlayerAceAllowed(source, jmod) then
				TriggerClientEvent('chat:addMessage', -1, { 
					template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(10, 221, 2, 0.6); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
					args = { _U('jmod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
				})
			end
end)

--Revive iedereen
RegisterCommand('reviveall', function(source, args, rawCommand)
	TriggerClientEvent('esx_ambulancejob:revive', -1)
end, true)

--Eindig iedereens celstraf
RegisterCommand('unjailall', function(source, args, rawCommand)
	TriggerClientEvent('esx-qalle-jail:unJailPlayer', -1)
end, true)

--Eindig iedereens taakstraf
RegisterCommand('endcomservall', function(source, args, rawCommand)
	TriggerClientEvent('esx_communityservice:finishCommunityService', -1)
end, true)

--naar persoon
RegisterCommand("gt", function(source, args, rawCommand)	-- /goto [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local targetCoords = xTarget.getCoords()
        			local playerCoords = xPlayer.getCoords()
        			savedCoords[source] = playerCoords
        			xPlayer.setCoords(targetCoords)
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('goto_admin', args[1]))
					TriggerClientEvent("chatMessage", xTarget.source,  _U('goto_player'))
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, "Dit ID is niet online.")
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, "Verkeerd ID")
    		end
	end
end, true)

--Terug naar oude locatie
RegisterCommand("gb", function(source, args, rawCommand)	-- /goback will teleport you back where you was befor /goto
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	    	local playerCoords = savedCoords[source]
	    	if playerCoords then
	      		xPlayer.setCoords(playerCoords)
				TriggerClientEvent("chatMessage", xPlayer.source, _U('goback'))
	      		savedCoords[source] = nil
	    	end
	end
end, true)

---------- Bring / Bringback ----------
RegisterCommand("br", function(source, args, rawCommand)	-- /bring [ID]
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	    	if args[1] and tonumber(args[1]) then
	      		local targetId = tonumber(args[1])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget then
	        		local targetCoords = xTarget.getCoords()
	        		local playerCoords = xPlayer.getCoords()
	        		savedCoords[targetId] = targetCoords
	        		xTarget.setCoords(playerCoords)
	        		TriggerClientEvent("chatMessage", xPlayer.source, "De speler is naar je toegebracht", args[1])
	        		TriggerClientEvent("chatMessage", xTarget.source, "Je bent naar een Admin gebracht")
	      		else
	        		TriggerClientEvent("chatMessage", xPlayer.source, "Speler is niet online", 'BRING')
	      		end
	    	else
	      		TriggerClientEvent("chatMessage", xPlayer.source, "Geen geldige input", 'BRING')
	  	end
	end
end, true)

RegisterCommand("bt", function(source, args, rawCommand)	-- /bringback [ID] will teleport player back where he was before /bring
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local playerCoords = savedCoords[targetId]
        			if playerCoords then
          			xTarget.setCoords(playerCoords)
          			TriggerClientEvent("chatMessage", xTarget.source,  "Je bent terug gebracht", 'BRINGBACK')
          			savedCoords[targetId] = nil
        		else
          			TriggerClientEvent("chatMessage", xPlayer.source, "Geen locatie om je persoon terug te brengen")
        			end
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, 'test', 'BRINGBACK')
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, "Geen geldige input", 'BRINGBACK')
  		end
	end
end, true)