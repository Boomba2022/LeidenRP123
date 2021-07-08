ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(5)
        if ESX ~= nil then
       
        else
            ESX = nil
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end
end)

local isJudge = false
local isPolice = false
local isMedic = false
local isDoctor = false
local isNews = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}
 
rootMenuConfig =  {
    {
        id = "general",
        displayName = "Algemeen",
        icon = "#globe-europe",
        enableMenu = function()
		return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = {"general:emotes", "general:geiselnehmen", "general:givekeys"}
    },
    --{
        --id = "clothes",
        --displayName = "Kleding",
        --icon = "#globe-europe",
        --enableMenu = function()
        --return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        --end,
        --subMenus = {"cloth:all", "cloth:tshirt", "cloth:pants", "cloth:helmet", "cloth:boots", "cloth:mask", "cloth:glasses"}
    --},
    {
        id = "license",
        displayName = "Bewijzen",
        icon = "#kimlik",
        enableMenu = function()
		return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = {"personalausweis", "personalausweis2", "fahrlizenz", "fahrlizenz2"}
    },
    {
        id = "police-action",
        displayName = "Politie acties",
        icon = "#police-action",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "police" and not fuck then
                return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
            end
        end,
        subMenus = {"esx_policejob:kelepce", "esx_policejob:kelepcecoz", "esx_policejob:tasi", "mdt:radialopen", "medic:revive", "police:gsr", "st:ceza", "police:community", "police:fine", "squad"}
    },
    {
        id = "police-vehicle",
        displayName = "Voertuig acties",
        icon = "#police-vehicle",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "police" and not fuck then
                return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
            end
		end,
        subMenus = {"esx_policejob:putInVehicle", "esx_policejob:OutVehicle", "police:open", "police:impound"}
    },	
    {
        id = "blips",
        displayName = "GPS",
        icon = "#blips",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = { "blips:gasstations", "blips:barbershop", "fk:deleteblip", "blips:tattooshop", "fk:karakol", "fk:hastane"}
    },	
    {
        id = "policeDead",
        displayName = "10-13",
        icon = "#police-dead",
        functionName = "st:panicTrigger",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "police" and fuck then
                return true
            end
        end,
    },
    {
        id = "emsDead",
        displayName = "10-14",
        icon = "#ems-dead",
        functionName = "st:panicTriggerMedic",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "ambulance" and fuck then
                return true
            end
        end,
    },
    {
        id = "animations",
        displayName = "Loopstijlen",
        icon = "#walking",
        enableMenu = function()
         
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
    },
	{
        id = "propmenu",
        displayName = "Ambulance acties",
        icon = "#blips-garages",
        enableMenu = function()
        local ped = PlayerPedId()
            PlayerData = ESX.GetPlayerData() 
         
        if PlayerData.job.name == "ambulance" and not fuck then
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
            end
        end,
        subMenus = { "rollstuhl", "rollstuhlentfernen", "bahre", "bahreentfernen" }
    },
    {
        id = "expressions",
        displayName = "Expressies",
        icon = "#expressionss",
        enableMenu = function()
         
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful",  "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird"}
    },
    {
        id = "judge-actions",
        displayName = "ANWB acties",
        icon = "#mechanic",
        enableMenu = function()
            local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "mechanic" and not fuck then
               return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
            end
        end,
        subMenus = { "mechanic:hijack", "mechanic:clean", "mechanic:impound", "mechanic:repair"}
    },
    {
        id = "medic",
        displayName = "Ambulance",
        icon = "#medic",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
            
            if PlayerData.job.name == "ambulance" and not fuck then
                return (not isDead and not IsPedInAnyVehicle(PlayerPedId(), false))
            end
        end,
        subMenus = { "medic:revive", "medic:heal", "medic:bigheal"}
    },

    {
        id = "news",
        displayName = "Nieuws",
        icon = "#news",
        enableMenu = function()
            return (not isDead and isNews)
        end,
        subMenus = { "news:setCamera", "news:setMicrophone", "news:setBoom" }
    },
	--{
      --  id = "vehicle",
        -- displayName = "Araç İşlemleri",
        -- icon = "#vehicle-options-vehicle",
        -- functionName = "carcontrol:open",
        -- enableMenu = function()
         --   return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        --end
   -- },


	
}

newSubMenus = {
    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu"
    },
    ['general:givekeys'] = {
        title = "Autosteutels geven",
        icon = "#general-emotes",
        functionName = "fv:givekeys"
    },
	['general:geiselnehmen'] = {
        title = "Gijzelen",
        icon = "#take-hostage",
        functionName = "geisel"
    },
    ['general:putinvehicle'] = {
        title = "Zet in voertuig",
        icon = "#general-put-in-veh",
        functionName = "police:forceEnter"
    },
    ['blips:gasstations'] = {
        title = "Tank station",
        icon = "#blips-gasstations",
        functionName = "ygx:togglegas"
    },    
    ['blips:garages'] = {
        title = "Garage",
        icon = "#blips-garages",
        functionName = "Garages:ToggleGarageBlip"
    },
	['fk:deleteblip'] = {
        title = "Verwijder GPS",
        icon = "#deleteblipz",
        functionName = "fk:deleteblip"
    }, 
    ['blips:barbershop'] = {
        title = "Kapper",
        icon = "#blips-barbershop",
        functionName = "ygx:togglebarber"
    }, 
    ['fk:karakol'] = {
        title = "Politie bureau",
        icon = "#police-action",
        functionName = "fk:karakol"
    },
    ['fk:hastane'] = {
        title = "Ziekenhuis",
        icon = "#medic",
        functionName = "fk:hastane"
    },
    ['blips:tattooshop'] = {
        title = "Tattooshop",
        icon = "#blips-tattooshop",
        functionName = "ygx:toggletattos"
    },	
    ['attach:prop_cs_cardbox_01'] = {
        title = "Kutu",
        icon = "#animation-tough",
        functionName = "attach:prop_cs_cardbox_01"
    },
    ['xm_prop_x17_bag_01a'] = {
        title = "Çanta",
        icon = "#animation-tough",
        functionName = "attach:xm_prop_x17_bag_01a"
    },
    ['rollstuhl'] = {
        title = "Rolstoel",
        icon = "#chair-ambulance",
        functionName = "rollstuhl"
    },	
	['rollstuhlentfernen'] = {
        title = "Rolstoel weghalen",
        icon = "#chair-ambulance",
        functionName = "rollstuhlentfernen"
    },	
	['bahre'] = {
        title = "Brancard",
        icon = "#bed-ambulance",
        functionName = "bahre"
    },	
	['bahreentfernen'] = {
        title = "Brancard wegdoen",
        icon = "#bed-ambulance",
        functionName = "bahreentfernen"
    },	

    ['general:unseatnearest'] = {
        title = "Haal speler uit voertuig",
        icon = "#general-unseat-nearest",
        functionName = "unseatPlayer"
    },     	
    ['animations:brave'] = {
        title = "Braaf",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "Haast",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "aangeschoten",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Bezeerd",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Stoer",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Verdrietig",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Chique",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Gled",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Gangster",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Homo",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "Chichi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Normaal",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['mechanic:hijack'] = {
        title = "Aracı Aç",
        icon = "#police-vehicle",
        functionName = "st:open"
    },
    ['mechanic:repair'] = {
        title = "Tamir Et",
        icon = "#police-vehicle",
        functionName = "nk_repair:MenuRipara"
    },
    ['mechanic:clean'] = {
        title = "Temizle",
        icon = "#police-vehicle",
        functionName = "st:mechclean"
    },
    ['mechanic:impound'] = {
        title = "Çek",
        icon = "#police-vehicle",
        functionName = "st:menuimpound"
    },
    ['cuffs:cuff'] = {
        title = "Boeien",
        icon = "#cuffs-cuff",
        functionName = "st:cuff"
    }, 
    ['cuffs:uncuff'] = {
        title = "Ontboeien",
        icon = "#cuffs-uncuff",
        functionName = "st:uncuff"
    },
    ['cuffs:unseat'] = {
        title = "Haal uit voertuig",
        icon = "#cuffs-unseat-player",
        functionName = "esx_ambulancejob:pullOutVehicle"
    },
    ['cuffs:checkphone'] = {
        title = "Read Phone",
        icon = "#cuffs-check-phone",
        functionName = "police:checkPhone"
    },
    ['medic:revive'] = {
        title = "Reanimeren",
        icon = "#medic-revive",
        functionName = "st:emsRevive"
    },
    ['medic:put'] = {
        title = "Kişiyi Arabadan Çıkar",
        icon = "#general-put-in-veh",
        functionName = "st:outv"
    },
	['attach:xm_prop_x17_bag_med_01a'] = {
        title = "İlk Yardım Çantası",
        icon = "#general-put-in-veh",
        functionName = "attach:xm_prop_x17_bag_med_01a"
    },
    ['medic:out'] = {
        title = "Kişiyi Arabaya Koy",
        icon = "#general-unseat-nearest",
        functionName = "st:putv"
    },
    ['medic:heal'] = {
        title = "Kleine wonden genezen",
        icon = "#medic-heal",
        functionName = "st:emssmallheal"
    },
    ['medic:bigheal'] = {
        title = "Reanimeren",
        icon = "#medic-heal",
        functionName = "st:emsbigheal"
    },
	['attach:xm_prop_smug_crate_s_medical'] = {
        title = "İlk Yardım Kutusu",
        icon = "#medic-heal",
        functionName = "attach:xm_prop_smug_crate_s_medical"
    },
    ['police:escort'] = {
        title = "Meenemen",
        icon = "#general-escort",
        functionName = "st:escort"
    },
    ['mdt:radialopen'] = {
        title = "Polis Tableti",
        icon = "#mdt",
        functionName = "mdt:radialopen"
    },	
    ['police:revive'] = {
        title = "Canlandır",
        icon = "#medic-revive",
        functionName = "st:pdrevive"
    },
    ['attach:prop_roadcone02a'] = {
        title = "Koni",
        icon = "#general-put-in-veh",
        functionName = "attach:prop_roadcone02a"
    },
	['xm_prop_x17_bag_01a'] = { 
        title = "Çanta",
        icon = "#general-unseat-nearest",
        functionName = "attach:xm_prop_x17_bag_01a"
    },
    ['police:impound'] = {
        title = "Aracı Çek",
        icon = "#police-vehicle",
        functionName = "st:menuimpound"
    },
    ['police:open'] = {
        title = "Aracı Aç",
        icon = "#police-vehicle",
        functionName = "st:open"
    },
    ['police:community'] = {
        title = "Topluluk Hizmeti",
        icon = "#animation-hobo",
        functionName = "st:kamu"
    },
    ['police:fine'] = {
        title = "Üstünü Ara",
        icon = "#animation-business",
        functionName = "disc-inventoryhud:search"
    },
    ['ustara'] = {
        title = "Üstünü Ara",
        icon = "#animation-business",
        functionName = "ustara"
    },
    ['police:cuff'] = {
        title = "Boeien",
        icon = "#cuffs-cuff",
        functionName = "police:cuffFromMenu"
    },
    ['police:checkbank'] = {
        title = "Check Bank",
        icon = "#police-check-bank",
        functionName = "police:checkBank"
    },
    ['police:checklicenses'] = {
        title = "Controleer bewijzen",
        icon = "#police-check-licenses",
        functionName = "police:checkLicenses"
    },
	['esx_policejob:putInVehicle'] = {
        title = "Kişiyi Araca Sok",
        icon = "#general-put-in-veh",
        functionName = "esx_policejob:putInVehicle"
    },
	['esx_policejob:OutVehicle'] = {
        title = "Kişiyi Araçtan Çıkar",
        icon = "#general-put-in-veh",
        functionName = "esx_policejob:OutVehicle"
    },
	['squad'] = {
        title = "Squad",
        icon = "#general-put-in-veh",
        functionName = "squad"
    },	
	['hirsiz:OutVehicle'] = {
        title = "Kişiyi Araçtan Çıkar",
        icon = "#general-put-in-veh",
        functionName = "hirsiz:OutVehicle"
    },	
	['hirsiz:putVehicle'] = {
        title = "Kişiyi Araçtan Çıkar",
        icon = "#general-put-in-veh",
        functionName = "hirsiz:OutVehicle"
    },		
    ['police:gsr'] = {
        title = "Barut Testi",
        icon = "#police-action-gsr",
        functionName = "st:checkGSR"
    },
    ['st:ceza'] = {
        title = "Fatura Kes",
        icon = "#police-action-gsr",
        functionName = "st:ceza"
    },		
    ['police:getid'] = {
        title = "Ödenmemiş Faturalar",
        icon = "#police-vehicle-plate",
        functionName = "esx_policejob:odenmemisfatura"
    },
    ['esx_policejob:kelepce'] = {
        title = "Kelepçele",
        icon = "#cuffs",
        functionName = "fesseln"
    },
	['esx_policejob:tasi'] = {
        title = "Taşı",
        icon = "#general-put-in-veh",
        functionName = "st:escort"
    },
    ['esx_policejob:kelepcecoz'] = {
        title = "Kelepçele Çöz",
        icon = "#cuffs-uncuff",
        functionName = "st:uncuff"
    },	
	['personalausweis'] = {
        title = "Bekijk ID",
        icon = "#kimlik",
        functionName = "license:ps"
    },	
    ['personalausweis2'] = {
        title = "ID kaart geven",
        icon = "#kimlik",
        functionName = "license:pz"
    },
    ['fahrlizenz'] = {
        title = "Rijbewijs bekijken",
        icon = "#ehliyet",
        functionName = "license:fs"
    },	
    ['fahrlizenz2'] = {
        title = "Rijbewijs Geven",
        icon = "#ehliyet",
        functionName = "license:fz"
    },		
    --['waffenlizenz'] = {
      --  title = "Waffenlizenz sehen",
        --icon = "#ehliyet",
        --functionName = "license:ws"
    --},		
    --['waffenlizenz2'] = {
      --  title = "Waffenlizenz zeigen",
        --icon = "#ehliyet",
        --functionName = "license:wz"
    --},		
--[[     ['police:toggleradar'] = {
        title = "Toggle Radar",
        icon = "#police-vehicle-radar",
        functionName = "startSpeedo"
    }, ]]
--[[     ['police:frisk'] = {
        title = "Frisk",
        icon = "#police-action-frisk",
        functionName = "police:frisk"
    }, ]]
    ['judge:grantDriver'] = {
        title = "Grant Drivers",
        icon = "#judge-licenses-grant-drivers",
        functionName = "police:grantDriver"
    }, 
    ['judge:grantBusiness'] = {
        title = "Grant Business",
        icon = "#judge-licenses-grant-business",
        functionName = "police:grantBusiness"
    },  
    ['judge:grantWeapon'] = {
        title = "Grant Weapon",
        icon = "#judge-licenses-grant-weapon",
        functionName = "police:grantWeapon"
    },
    ['judge:grantHouse'] = {
        title = "Grant House",
        icon = "#judge-licenses-grant-house",
        functionName = "police:grantHouse"
    },
    ['judge:grantBar'] = {
        title = "Grant BAR",
        icon = "#judge-licenses-grant-bar",
        functionName = "police:grantBar"
    },
    ['judge:grantDA'] = {
        title = "Grant DA",
        icon = "#judge-licenses-grant-da",
        functionName = "police:grantDA"
    },
    ['judge:removeDriver'] = {
        title = "Remove Drivers",
        icon = "#judge-licenses-remove-drivers",
        functionName = "police:removeDriver"
    },
    ['judge:removeBusiness'] = {
        title = "Remove Business",
        icon = "#judge-licenses-remove-business",
        functionName = "police:removeBusiness"
    },
    ['judge:removeWeapon'] = {
        title = "Remove Weapon",
        icon = "#judge-licenses-remove-weapon",
        functionName = "police:removeWeapon"
    },
    ['judge:removeHouse'] = {
        title = "Remove House",
        icon = "#judge-licenses-remove-house",
        functionName = "police:removeHouse"
    },
    ['judge:removeBar'] = {
        title = "Remove BAR",
        icon = "#judge-licenses-remove-bar",
        functionName = "police:removeBar"
    },
    ['judge:removeDA'] = {
        title = "Remove DA",
        icon = "#judge-licenses-remove-da",
        functionName = "police:removeDA"
    },
    ['judge:denyWeapon'] = {
        title = "Deny Weapon",
        icon = "#judge-licenses-deny-weapon",
        functionName = "police:denyWeapon"
    },
    ['judge:denyDriver'] = {
        title = "Deny Drivers",
        icon = "#judge-licenses-deny-drivers",
        functionName = "police:denyDriver"
    },
    ['judge:denyBusiness'] = {
        title = "Deny Business",
        icon = "#judge-licenses-deny-business",
        functionName = "police:denyBusiness"
    },
    ['judge:denyHouse'] = {
        title = "Deny House",
        icon = "#judge-licenses-deny-house",
        functionName = "police:denyHouse"
    },
    ['news:setCamera'] = {
        title = "Camera",
        icon = "#news-job-news-camera",
        functionName = "camera:setCamera"
    },
    ['news:setMicrophone'] = {
        title = "Microphone",
        icon = "#news-job-news-microphone",
        functionName = "camera:setMic"
    },
    ['news:setBoom'] = {
        title = "Microphone Boom",
        icon = "#news-job-news-boom",
        functionName = "camera:setBoom"
    },
    ['weed:currentStatusServer'] = {
        title = "Request Status",
        icon = "#weed-cultivation-request-status",
        functionName = "weed:currentStatusServer"
    },   
    ['weed:weedCrate'] = {
        title = "Remove A Crate",
        icon = "#weed-cultivation-remove-a-crate",
        functionName = "weed:weedCrate"
    },
    ['cocaine:currentStatusServer'] = {
        title = "Request Status",
        icon = "#meth-manufacturing-request-status",
        functionName = "cocaine:currentStatusServer"
    },
    ['cocaine:methCrate'] = {
        title = "Remove A Crate",
        icon = "#meth-manufacturing-remove-a-crate",
        functionName = "cocaine:methCrate"
    },
    ["expressions:angry"] = {
        title="Boos",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Dronken",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Oen",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Geschokt",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Chagrijnig",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Blij",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Gewond",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Blijdschap",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:normal"]  = {
        title="Normaal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="Knip oog",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Geschokt",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Slapen",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="Zelfgenoegzaam",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculatief",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Gestresst",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Pruilen",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Grappig",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["cloth:all"]  = {
        title="Aantrekken",
        icon="#tshirt",
        functionName = "fizz:loadskin"
    },
    ["cloth:tshirt"]  = {
        title="T-shirt",
        icon="#tshirt",
        functionName = "fv:tshirt"
    },
    ["cloth:pants"]  = {
        title="Broek",
        icon="#pantolon",
        functionName = "fv:hose"
    },
    ["cloth:helmet"]  = {
        title="Helm",
        icon="#pantolon",
        functionName = "fv:helm"
    },
    ["cloth:boots"]  = {
        title="Schoenen",
        icon="#shoes",
        functionName = "fv:schuhe"
    },
    ["cloth:mask"]  = {
        title="Masker",
        icon="#shoes",
        functionName = "fv:maske"
    },
    ["cloth:glasses"]  = {
        title="Bril",
        icon="#shoes",
        functionName = "fv:brille"
    },
}


RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)


RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    if myJob == "driving instructor" then
        isInstructorMode = mode
    end
end)

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end
