local tp = false

RegisterNetEvent('by_tpa:showNoti')
AddEventHandler('by_tpa:showNoti', function (id)
    TriggerEvent('chatMessage', "[By TPA System]", {255, 0, 0}, "The ID(" .. id .. ") wants to teleport to you.")
    TriggerEvent('chatMessage', "[By TPA System]", {255, 0, 0}, "Put the command /tpaccept to accept or /tpdeny to deny teleportation")
    tp = true
    Citizen.CreateThread(function ()
        while tp do
            RegisterCommand('tpaccept', function (source, args)
                local pos = GetEntityCoords(PlayerPedId())
                TriggerServerEvent('by_tpa:confirmBool', id, true, pos)
                tp = false
                return
            end, false)
            
            RegisterCommand('tpdeny', function (source, args)
                local pos = GetEntityCoords(PlayerPedId())
                TriggerServerEvent('by_tpa:confirmBool', id, false, pos)
                tp = false
                return
            end, false)

            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent('by_tpa:tpToCoords')
AddEventHandler('by_tpa:tpToCoords', function (coords)
    if coords ~= nil then
        SetPedCoordsKeepVehicle(PlayerPedId(), coords)
    end    
end)