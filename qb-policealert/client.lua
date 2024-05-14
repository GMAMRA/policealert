local ishold = false
blips = {}
RegisterNetEvent('qb-policealert:Client:UpdateAlert')
AddEventHandler('qb-policealert:Client:UpdateAlert', function(newishold)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.5)
    ishold = newishold
    if ishold == true then
        local coords = GetEntityCoords(PlayerPedId())
        blips['Radius'] = AddBlipForRadius(coords.x , coords.y , coords.z , Config.Radius)
        SetBlipHighDetail(blips['Radius'], true)
        SetBlipColour(blips['Radius'], Config.Color)
        SetBlipAlpha (blips['Radius'], 128)
    else
        RemoveBlip(blips['Radius'])
        SetBlipSprite(blips['Radius'], 1)
    end
end)





function DrawText2(text)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(Config.X, Config.Y)
    RegisterFontFile('Arb')
    fontId = RegisterFontId('Arb')
end

