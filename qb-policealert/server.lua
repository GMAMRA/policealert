QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
ishold = false

QBCore.Commands.Add("onalert", "onalert", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "sheriff" then
		TriggerEvent('qb-policealert:Server:isOnAlert')
	else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "لا يمكنك استعمال هذا الامر")
    end
end)

QBCore.Commands.Add("offalert", "off alert", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "sheriff" then
		TriggerEvent('qb-policealert:Server:isOffAlert')
	else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "لا يمكنك استعمال هذا الامر")
    end
end)

RegisterNetEvent('qb-policealert:Server:isOnAlert')
AddEventHandler('qb-policealert:Server:isOnAlert', function()
	ishold = true
	Citizen.Wait(1)
	TriggerClientEvent('chatMessage',-1, "POLICE", "police", "Alert ON:Mayo9reb 7ad meldoura elzar9a")
	TriggerClientEvent('qb-policealert:Client:UpdateAlert', -1, ishold)
end)

RegisterNetEvent('qb-policealert:Server:isOffAlert')
AddEventHandler('qb-policealert:Server:isOffAlert', function()
	ishold = false
	TriggerClientEvent('chatMessage',-1, "POLICE", "police", "Alert OFF:Wadh3iya ta7t saytra")
	TriggerClientEvent('qb-policealert:Client:UpdateAlert', -1, ishold)
end)

