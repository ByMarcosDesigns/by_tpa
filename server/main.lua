RegisterNetEvent('by_tpa:confirmBool')
AddEventHandler('by_tpa:confirmBool', function (id, bool, coords)
    if bool then
        TriggerClientEvent('by_tpa:tpToCoords', id, coords)
        TriggerClientEvent('chatMessage', id, "[By TPA System]", {255, 0, 0}, "The player with ID(" .. source .. ") has accepted your teleport request!")
        TriggerClientEvent('chatMessage', source, "[By TPA System]", {255, 0, 0}, "You have successfully accepted the teleport request!")
    else
        TriggerClientEvent('chatMessage', id, "[By TPA System]", {255, 0, 0}, "The player with ID(" .. source .. ") has denied your teleport request!")
        TriggerClientEvent('chatMessage', source, "[By TPA System]", {255, 0, 0}, "You have denied the teleport request of the ID(" .. id .. ")")
    end
end)

RegisterNetEvent('by_tpa:sendNoti')
AddEventHandler('by_tpa:sendNoti', function (source, id)
    TriggerClientEvent('by_tpa:showNoti', id, source)
end)

RegisterCommand('tpa', function (source, args)
	TriggerEvent('chat:addSuggestion', '/tpa', 'Teleport to a player')

    if args ~= nil then
        local otherid = tostring(args[1])
        if GetPlayerName(otherid) then
            TriggerEvent('by_tpa:sendNoti', source, otherid)
            TriggerClientEvent('chatMessage', source, "[By TPA System]", {255, 0, 0}, "Waiting for player confirmation!")
        else
            TriggerClientEvent('chatMessage', source, "[By TPA System]", {255, 0, 0}, "The ID is not correct!")
        end
    else
        TriggerClientEvent('chatMessage', source, "[By TPA System]", {255, 0, 0}, "You must enter the ID of the person!")
    end
    
end, false)