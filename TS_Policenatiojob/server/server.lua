ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'police', 'alerte police', true, true)

TriggerEvent('esx_society:registerSociety', 'police', 'police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterNetEvent('equipementbase')
AddEventHandler('equipementbase', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier
	local steam
	local playerId = source
	local PcName = GetPlayerName(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'steam:') then
			steam = string.sub(v, 7)
			break
		end
	end

xPlayer.addWeapon('WEAPON_NIGHTSTICK', 42)
xPlayer.addWeapon('WEAPON_STUNGUN', 42)
xPlayer.addWeapon('WEAPON_FLASHLIGHT', 42)
xPlayer.addWeapon('WEAPON_PISTOL', 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de base")
end)

RegisterNetEvent('armurerie')
AddEventHandler('armurerie', function(arme, prix)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.addWeapon(arme, 42)
TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~arme~s~")
end)


ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then

			MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

RegisterServerEvent('esx_policejob:prendreitems')
AddEventHandler('esx_policejob:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('esx_policejob:stockitem')
AddEventHandler('esx_policejob:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


ESX.RegisterServerCallback('esx_policejob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_policejob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_policejob:forceBlip')
AddEventHandler('esx_policejob:forceBlip', function()
	TriggerClientEvent('esx_policejob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'police')
	end
end)

RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)




-- ALERTE TN75


RegisterServerEvent('TireEntenduServeur')
AddEventHandler('TireEntenduServeur', function(gx, gy, gz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('TireEntendu', xPlayers[i], gx, gy, gz)
		end
	end
end)


RegisterServerEvent('PriseAppelServeur')
AddEventHandler('PriseAppelServeur', function(gx, gy, gz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName(source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('PriseAppel', xPlayers[i], name)
		end
	end
end)

RegisterServerEvent('police:PriseEtFinservice')
AddEventHandler('police:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('police:InfoService', xPlayers[i], _raison, name)
		end
	end
end)



RegisterServerEvent('esx_policejob:requestarrest')
AddEventHandler('esx_policejob:requestarrest', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('esx_policejob:getarrested', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('esx_policejob:doarrested', _source)
end)

RegisterServerEvent('esx_policejob:requestrelease')
AddEventHandler('esx_policejob:requestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('esx_policejob:getuncuffed', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('esx_policejob:douncuffing', _source)
end)

RegisterServerEvent('renfort')
AddEventHandler('renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison, name)
		end
	end
end)

----------------------

------------------------------------------------ Intéraction


RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
  TriggerClientEvent('esx_policejob:handcuff', target)
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_policejob:drag', target, _source)
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
  TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
    TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

-------------------------------- Fouiller

RegisterNetEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
			if sourceXPlayer.canCarryItem(itemName, sourceItem.count) then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				sourceXPlayer.showNotification(_U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				targetXPlayer.showNotification(_U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
			else
				sourceXPlayer.showNotification(_U('quantity_invalid'))
			end
		else
			sourceXPlayer.showNotification(_U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		local targetAccount = targetXPlayer.getAccount(itemName)

		-- does the target player have enough money?
		if targetAccount.money >= amount then
			targetXPlayer.removeAccountMoney(itemName, amount)
			sourceXPlayer.addAccountMoney   (itemName, amount)

			sourceXPlayer.showNotification(_U('you_confiscated_account', amount, itemName, targetXPlayer.name))
			targetXPlayer.showNotification(_U('got_confiscated_account', amount, itemName, sourceXPlayer.name))
		else
			sourceXPlayer.showNotification(_U('quantity_invalid'))
		end

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end

		-- does the target player have weapon?
		if targetXPlayer.hasWeapon(itemName) then
			targetXPlayer.removeWeapon(itemName, amount)
			sourceXPlayer.addWeapon   (itemName, amount)

			sourceXPlayer.showNotification(_U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
			targetXPlayer.showNotification(_U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
		else
			sourceXPlayer.showNotification(_U('quantity_invalid'))
		end
	end
end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)
	if Config.EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(target)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height,
			license    = license
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	else
		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)
	end
end)


RegisterNetEvent('jejey:confiscatePlayerItem')
AddEventHandler('jejey:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem   (itemName, amount)
            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~b~"..amount..' '..sourceItem.label.."~s~.")
            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~b~"..amount..' '..sourceItem.label.."~s~.")
        else
			TriggerClientEvent("esx:showNotification", source, "~r~Quantité invalide")
		end
        
    if itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney   (itemName, amount)
        
        TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~b~"..amount.." d' "..itemName.."~s~.")
        TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous aconfisqué ~b~"..amount.." d' "..itemName.."~s~.")
        
    elseif itemType == 'item_weapon' then
        if amount == nil then amount = 0 end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon   (itemName, amount)

        TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~b~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~b~"..amount.."~s~ balle(s).")
        TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a confisqué ~b~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~b~"..amount.."~s~ balle(s).")
    end
end)

RegisterServerEvent('Ouvre:pn')
AddEventHandler('Ouvre:pn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'POLICE NATIONALE', '~r~ETAT', 'Police Nationale ! ~g~Disponible~s~ par appel.', 'CHAR_PN', 8)
	end
end)

RegisterServerEvent('Ferme:pn')
AddEventHandler('Ferme:pn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'POLICE NATIONALE', '~r~ETAT', 'Police Nationale ~r~ferme~s~ pour le moment !', 'CHAR_PN', 8)
	end
end)

RegisterServerEvent('Recru:pn')
AddEventHandler('Recru:pn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'POLICE NATIONALE', '~r~ETAT', 'Recrutement en cours, ~y~rendez-vous~s~ au Ciat !', 'CHAR_PN', 8)
	end
end)

RegisterCommand('pn', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "police" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'POLICE NATIONALE', '~r~ETAT', ''..msg..'', 'CHAR_PN', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~r~Erreur' , '~r~Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_PN', 0)
    end
else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~r~Erreur' , '~r~Tu n\'es pas membre de cette entreprise pour faire cette commande', 'CHAR_PN', 0)
end
end, false)