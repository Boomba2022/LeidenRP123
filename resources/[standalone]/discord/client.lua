Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(846356239587213312)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('leidenroleplay_wit1')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('LeidenRP')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('leidenroleplay_wit1')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/KxWzHAgUAS')


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join de discord!", "https://discord.gg/KxWzHAgUAS")
        SetDiscordRichPresenceAction(1, "Speel mee!", "fivem://connect/185.117.21.174:30120")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)