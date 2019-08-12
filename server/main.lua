ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_hospital:pay')
AddEventHandler('esx_hospital:pay', function(fiyat)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeBank(fiyat)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid', ESX.Math.GroupDigits(fiyat)))
end)

RegisterServerEvent('esx_hospital:pay100')
AddEventHandler('esx_hospital:pay100', function()
local xPlayer = ESX.GetPlayerFromId(source)
local price = 100
local _source = source
if (xPlayer.getBank() >= price) then
	xPlayer.removeBank(price)
						
						TriggerClientEvent("pNotify:SendNotification", source,{
						
							text = ("$100 dolar karşılığında tedavi edildiniz."),
							type = "alert",
							theme = "metroui",
							timeout = 3000,
							layout = "topRight"
						}
					)
					
					
			
		else
					
					TriggerClientEvent("pNotify:SendNotification", source,{
						
							text = ("Paran Yok!."),
							type = "alert",
							theme = "metroui",
							timeout = 3000,
							layout = "topRight"
						}
					)

	end
end)

RegisterServerEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function(target)
		TriggerClientEvent('esx_ambulancejob:revive', target)
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)

	if type(isDead) ~= 'boolean' then
		print(('esx_ambulancejob: %s attempted to parse something else than a boolean to setDeathStatus!'):format(identifier))
		return
	end

	MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@isDead'] = isDead
	})
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)

	MySQL.Async.fetchScalar('SELECT is_dead FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(isDead)
		if isDead then
			print(('esx_ambulancejob: %s attempted combat logging!'):format(identifier))
		end

		cb(isDead)
	end)
end)

ESX.RegisterServerCallback('esx_hospital:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getBank() >= 3000)
end)