local QBCore = exports['qb-core']:GetCoreObject()

-- consume food and drink
RegisterNetEvent('dareu_pipeline:client:Eat', function(itemName)
  QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, false, {
    disableMovement = false,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {
    animDict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
    anim = "base_idle",
    flags = 49,

  }, {
    model = "prop_cs_plate_01",
    bone = 60309,
    coords = vector3(0.01, 0.0, 0.0),
    rotation = vector3(0.0, 0.0, 0.0),
  }, {
    model = "h4_prop_h4_caviar_spoon_01a",
    bone = 28422,
    coords = vector3(0.0, 0.0, 0.0),
    rotation = vector3(0.0, 0.0, 0.0),
  }, function() -- Done
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
    if Config.NewCore then
      TriggerServerEvent("consumables:server:addHunger",
        QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
    else
      TriggerServerEvent("QBCore:Server:SetMetaData", "hunger",
        QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
    end
    TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
  end)
end)

RegisterNetEvent('dareu_pipeline:client:Drink', function(itemName)
  QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
    disableMovement = false,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {
    animDict = 'smo@milkshake_idle',
    anim = 'milkshake_idle_clip',
    flags = 49,
  }, {
    model = 'prop_rpemotes_soda01',
    bone = 28422,
    coords = vector3(0.0470, 0.0040, -0.0600),
    rotation = vector3(-88.0263, -25.036, -27.3898),
  }, {}, function() -- Done
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
    if Config.NewCore then
      TriggerServerEvent("consumables:server:addThirst",
        QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
    else
      TriggerServerEvent("QBCore:Server:SetMetaData", "thirst",
        QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
    end
    TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
  end)
end)

RegisterNetEvent('dareu_pipeline:client:MshakeDrink', function(itemName)
  QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
    disableMovement = false,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {
    animDict = 'smo@milkshake_idle',
    anim = 'milkshake_idle_clip',
    flags = 49,
  }, {
    model = 'brum_cherryshake_raspberry',
    bone = 28422,
    coords = vector3(0.0850, 0.0670, -0.0350),
    rotation = vector3(-115.0862, -165.7841, 24.1318),
  }, {}, function() -- Done
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
    if Config.NewCore then
      TriggerServerEvent("consumables:server:addThirst",
        QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
    else
      TriggerServerEvent("QBCore:Server:SetMetaData", "thirst",
        QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
    end
    TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
  end)
end)


-- production events
RegisterNetEvent('dareu_pipeline:client:makeBeefstirfry', function()
  local ingredients = QBCore.Functions.HasItem({ "raw_beef", "apple", "chillypepper", "greenpepper" })
  if ingredients then
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
    QBCore.Functions.Progressbar("bs_stuff", "Making a Food..", 8000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = 'amb@prop_human_bbq@male@idle_a',
      anim = 'idle_b',
      flags = 49,
    }, {
      model = 'prop_fish_slice_01',
      bone = 28422,
      coords = vector3(0.0, 0.0, 0.0),
      rotation = vector3(0.0, 0.0, 0.0),
    }, {}, function() -- Done
      TriggerServerEvent("dareu_pipeline:server:makeBeefstirfry")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["raw_beef"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["apple"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chillypepper"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["greenpepper"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beefstirfry"], "add")
      TriggerEvent('dareu_pipeline:client:cookFoods')
    end, function() -- Cancel
      QBCore.Functions.Notify("You changed your mind.", "error")
      TriggerEvent('dareu_pipeline:client:cookFoods')
    end)
  else
    QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
  end
end)

RegisterNetEvent('dareu_pipeline:client:makeGrapemilkshake', function()
  local ingredients = QBCore.Functions.HasItem({ "grape", "milk" })
  if ingredients then
    QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
    }, {
      animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
      anim = 'machinic_loop_mechandplayer',
      flags = 49,
    }, {}, {}, function() -- Done
      TriggerServerEvent("dareu_pipeline:server:makeGrapemilkshake")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["grapes"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["grapemilkshake"], "add")
    end, function() -- Cancel
      QBCore.Functions.Notify("You changed your mind.", "error")
    end)
  else
    QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
  end
end)


-- menus to make foods and drinks
RegisterNetEvent('dareu_pipeline:closemenu', function()
  ClearPedTasksImmediately(PlayerPedId())
  TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('dareu_pipeline:client:cookFoods', function()
  -- SetEntityCoords(PlayerPedId(), -2213.76, -379.21, 13.32)
  -- SetEntityHeading(PlayerPedId(), 136.23)
  exports['qb-menu']:openMenu({
    {
      header = "Pipeline Resto Stove",
      txt = "",
      isMenuHeader = true
    },
    {
      header = "Beef Apple Stir Fry",
      txt = "Requires:</p>5x Raw Beef | 3x Apple | 3x Chilly Pepper | 2x Green Pepper",
      icon = "fa-solid fa-bowl-food",
      params = {
        event = "dareu_pipeline:client:makeBeefstirfry",
      }
    },
    {
      header = "Exit",
      icon = "fa-solid fa-angle-left",
      params = {
        event = "dareu_pipeline:closemenu"
      }
    },
  })
end)

RegisterNetEvent('dareu_pipeline:client:drinkStation', function()
  -- SetEntityCoords(PlayerPedId(), -1198.87, -895.38, 13.0)
  -- SetEntityHeading(PlayerPedId(), 125.79)
  exports['qb-menu']:openMenu({
    {
      header = "Drink Station",
      txt = "",
      isMenuHeader = true
    },
    {
      header = "Grape Milkshake",
      txt = "Requires:</p>2x Grape | 1x Milk",
      icon = "fa-solid fa-mug-hot",
      params = {
        event = "dareu_pipeline:client:makeGrapemilkshake",
      }
    },
    {
      header = "Exit",
      icon = "fa-solid fa-angle-left",
      params = {
        event = "dareu_pipeline:closemenu"
      }
    },
  })
end)
