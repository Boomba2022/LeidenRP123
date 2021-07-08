ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local currentjob = ""

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    local job = xPlayer.job.name

    currentjob = job
    if currentjob == "police" or currentjob == "ambulance" then -- job's name here
        TriggerServerEvent("utk_sl:userjoined", job)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if currentjob == "police" or currentjob == "ambulance" then -- job's name here
        if not (currentjob == job.name) then
            TriggerServerEvent("utk_sl:jobchanged", currentjob, job.name, 1)
        end
    else
        if currentjob == "police" or currentjob == "ambulance" then -- job's name here
            TriggerServerEvent("utk_sl:jobchanged", currentjob, job.name, 0)
        end
    end
    currentjob = job.name
end)
