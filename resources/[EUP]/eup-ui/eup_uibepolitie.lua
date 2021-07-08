local outfits = {
    ['Unmarked Outfit'] = {
        category = 'Politie Uniformen',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },	
            { 1, 0, 0 },	
            { 2, 0, 0 },	
            { 3, 0, 0 },	
        },
        components = {
            { 1, 32, 1 },	
            { 3, 32, 1 },	
            { 4, 49, 4 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 1, 1 },
            { 8, 58, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },	
            { 11, 58, 1 },
        },
    },
	    ['Badge'] = {
        category = 'Overig',
        ped = 'mp_m_freemode_01',
        components = {
            { 10, 22, 2 },
        },
    },
		    ['Oranje Reflectie Hesje'] = {
        category = 'Overig',
        ped = 'mp_m_freemode_01',
        components = {
            { 10, 29, 6 },
        },
    },
    ['Kogelwerend vest'] = {
        category = 'Overig',
        ped = 'mp_m_freemode_01',
        components = {
            { 9, 13, 2 },
        },
    },
    ['Ambulance medewerker'] = {
        category = 'Federale Politie',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 0, 0 },
            { 1, 0, 0 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 86, 1 },
            { 4, 50, 2 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 127, 1 },
            { 8, 43, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 95, 1 },
        },
    },
   
	
}



local function setOutfit(outfit)
    local ped = PlayerPedId()

    RequestModel(outfit.ped)

    while not HasModelLoaded(outfit.ped) do
        Wait(0)
    end

    if GetEntityModel(ped) ~= GetHashKey(outfit.ped) then
        SetPlayerModel(PlayerId(), outfit.ped)
    end

    ped = PlayerPedId()

    for _, comp in ipairs(outfit.components) do
       SetPedComponentVariation(ped, comp[1], comp[2] - 1, comp[3] - 1, 0)
    end

    for _, comp in ipairs(outfit.props) do
        if comp[2] == 0 then
            ClearPedProp(ped, comp[1])
        else
            SetPedPropIndex(ped, comp[1], comp[2] - 1, comp[3] - 1, true)
        end
    end
end

local categoryOutfits = {}

for name, outfit in pairs(outfits) do
    if not categoryOutfits[outfit.category] then
        categoryOutfits[outfit.category] = {}
    end

    categoryOutfits[outfit.category][name] = outfit
end

local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('Belgische EUP', 'Kies je afdeling')

for name, list in pairs(categoryOutfits) do
    local subMenu = menuPool:AddSubMenu(mainMenu, name)

    for id, outfit in pairs(list) do
        outfit.item = NativeUI.CreateItem(id, 'Pak hier je kleding')
        subMenu:AddItem(outfit.item)
    end

    subMenu.OnItemSelect = function(sender, item, index)
        -- find the outfit
        for _, outfit in pairs(list) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

    RegisterCommand('bepolitie', function()

        PlayerData = ESX.GetPlayerData()

        if PlayerData.job.name == 'police' or PlayerData.job.name == 'belg' or PlayerData.job.name == 'belg' or PlayerData.job.name == 'belg' or PlayerData.job.name == 'belg' then
        
            mainMenu:Visible(not mainMenu:Visible())
        else
            ESX.ShowNotification('~r~Je hebt geen permissies om dit uit te voeren.')
            Citizen.Wait(100)
            ESX.ShowNotification('~y~Het management is contacteerd, probeer dit niet nogmaals!')
            ESX.ShowNotification('~r~Er zullen sancties oplopen als je dit te vaak doet.')
            Citizen.Wait(100)

        end

    end, false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)