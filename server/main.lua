local QBCore = exports['qb-core']:GetCoreObject()

-- food

-- beef stir fry
RegisterNetEvent('dareu_pipeline:server:makeBeefstirfry', function()
  local Player = QBCore.Functions.GetPlayer(source)
  if not Player then return end
  Player.Functions.RemoveItem("raw_beef", 5)
  Player.Functions.RemoveItem("apple", 3)
  Player.Functions.RemoveItem("chillypepper", 2)
  Player.Functions.RemoveItem("greenpepper", 2)
  Player.Functions.AddItem("beefstirfry", 5)
end)

-- grape milkshake
RegisterNetEvent('dareu_pipeline:server:makeGrapemilkshake', function()
  local Player = QBCore.Functions.GetPlayer(source)
  if not Player then return end
  Player.Functions.RemoveItem("grapes", 5)
  Player.Functions.RemoveItem("milk", 3)
  Player.Functions.AddItem("grapemilkshake", 5)
end)




-- usable items
QBCore.Functions.CreateUseableItem("beefstirfry", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
    TriggerClientEvent("dareu_pipeline:client:Eat", source, item.name)
  end
end)

QBCore.Functions.CreateUseableItem("grapemilkshake", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)
  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
    TriggerClientEvent("dareu_pipeline:client:MshakeDrink", source, item.name)
  end
end)


-- handle billing
RegisterNetEvent("dareu_pipeline:server:billPlayer", function(playerId, amount)
  local biller = QBCore.Functions.GetPlayer(source)
  local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
  local amount = tonumber(amount)
  if biller.PlayerData.job.name == 'pipeline' then
    if billed ~= nil then
      if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
        if amount and amount > 0 then
          billed.Functions.RemoveMoney('bank', amount)
          TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
          TriggerClientEvent('QBCore:Notify', billed.PlayerData.source,
            'You have been charged $' .. amount .. ' for your order at Pipeline.')
          exports['qb-management']:AddMoney('pipeline', amount)
        else
          TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0.', 'error')
        end
      else
        TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself.', 'error')
      end
    else
      TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
    end
  end
end)
