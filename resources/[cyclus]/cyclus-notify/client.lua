ESX = nil 


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterNetEvent('cyclus-notify:notification')
AddEventHandler('cyclus-notify:notification', function(text, textype, length)
    notification(text, textype, length)
end)


RegisterNetEvent('cyclus-notify:grotenotification')
AddEventHandler('cyclus-notify:grotenotification', function(title, content, icon, timeout, color, time)
    grotenotification(title, content, icon, timeout, color, time)
end)


grotenotification = function(title, content, icon, timeout, color, time)
    if time then
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = title,
                content = content, 
                icon = icon, 
                timeout = timeout, 
                color = color,
            },
        })
    else
        SendNUIMessage({
            action = "note",
            NotifyData = {
                title = title,
                content = content, 
                icon = icon, 
                timeout = timeout, 
                color = color,
            },
        })
    end
end


notification = function(text, textype, length)
    local ttype = textype ~= nil and textype or "primary"
    local length = length ~= nil and length or 5000
    SendNUIMessage({
        action = "show",
        type = ttype,
        length = length,
        text = text,
    })
end