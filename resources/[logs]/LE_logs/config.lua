Config = {}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "LeidenRP" 							-- Bot Username
Config.avatar = "https://cdn.discordapp.com/attachments/836731038050680832/837594626428370944/ddfgdfsfds_1.png"				-- Bot Avatar
Config.communtiyName = "LeidenRP"					-- Icon top of the embed
Config.communtiyLogo = "https://cdn.discordapp.com/attachments/836731038050680832/837594626428370944/ddfgdfsfds_1.png"		-- Icon top of the embed
Config.FooterText = "2020 - 2021 © LeidenRP"						-- Footer text for the embed
Config.FooterIcon = "https://cdn.discordapp.com/attachments/836731038050680832/837594626428370944/ddfgdfsfds_1.png"			-- Footer icon for the embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.InlineFields = true			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = true				-- set to false to disable license in the logs
Config.IP = false					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={		-- For more info have a look at the docs: https://docs.preffech.com
	chat = "#A1A1A1",				-- Chat Message
	joins = "#3AF241",				-- Player Connecting
	leaving = "#F23A3A",			-- Player Disconnected
	deaths = "#000000",				-- Shooting a weapon
	shooting = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {		-- For more info have a look at the docs: https://docs.preffech.com
	all = "DISCORD_WEBHOOK",		-- All logs will be send to this channel
	chat = "https://discord.com/api/webhooks/837597422959460371/0cDZYsV004Q93sIcfTH-ntDrsM277zHSPABJN8QxnrRazMJrbSnB2OIyQYgT0m5QP7oT",		-- Chat Message
	joins = "https://discord.com/api/webhooks/837597534859952138/l6NbRS_n5OW3Rq_tvOt_OpjF0m0uDh2jlK-uA7V1BdI9sFezRBAQPvi3tp1cnElzaf32",		-- Player Connecting
	leaving = "https://discord.com/api/webhooks/837597534859952138/l6NbRS_n5OW3Rq_tvOt_OpjF0m0uDh2jlK-uA7V1BdI9sFezRBAQPvi3tp1cnElzaf32",	-- Player Disconnected
	deaths = "https://discord.com/api/webhooks/837597682196283402/wK0ac5TSumc9Nx-OpXqCk_9jsAsqgYFPJwh7YPgZQ735irW5Mbfc_P9weHW1_k4p6b_0",		-- Shooting a weapon
	shooting = "https://discord.com/api/webhooks/837597791551225859/WXdbmLYDDYInfTNBjTa8o3JtFm5JzgauGTuzK--eYWYmzK8gLLgw5b5j4yxZbBeUiMxa",	-- Player Died
	resources = "https://discord.com/api/webhooks/837597879060791326/HsfeqN7FqxCmx4FSe_eEGEwqsE7nKcSmE3-ljpEUF9XRfvMqGNwTVpdv3pZzeZ0ah8MD",	-- Resource Stopped/Started	
}

Config.TitleIcon = {		-- For more info have a look at the docs: https://docs.preffech.com
	chat = "💬",				-- Chat Message
	joins = "📥",				-- Player Connecting
	leaving = "📤",			-- Player Disconnected
	deaths = "💀",				-- Shooting a weapon
	shooting = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.2.0"
