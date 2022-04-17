ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('KrX-Ammunation:buyweapon')
AddEventHandler('KrX-Ammunation:buyweapon', function(price, weapon, label, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.hasWeapon(weapon) then
			TriggerClientEvent('esx:showNotification', source,'Vous possédez déjà ~b~cette arme !')
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
	    	xPlayer.addWeapon(weapon, 42) 
			TriggerClientEvent('esx:showNotification', source, 'Vous avez acheté 1 ' .. label .. " pour ~g~" .. price .. "$ !")
	    end
	end
end)

ESX.RegisterServerCallback('KrX-Ammunation:buyLicense', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= 45000 then
		xPlayer.removeMoney(45000)
		TriggerClientEvent('esx:showNotification', source, 'Vous avez acheté la license de port d\'arme pour ~g~ .. 45000 .. "$ !')
		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
			cb(true)
		end)
	else
		TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent ~r~sur vous !  !')
		cb(false)
	end
end)


