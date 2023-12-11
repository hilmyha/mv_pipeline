local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

-- blips coords
CreateThread(function()
  PipelineResto = AddBlipForCoord(-2191.72, -383.75, 13.3)
  SetBlipSprite(PipelineResto, 93)
  SetBlipDisplay(PipelineResto, 4)
  SetBlipScale(PipelineResto, 0.9)
  SetBlipAsShortRange(PipelineResto, true)
  SetBlipColour(PipelineResto, 57)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Pipeline Resto")
  EndTextCommandSetBlipName(PipelineResto)
end)

-- on resource start
AddEventHandler('onResourceStart', function(resourceName)
  if GetCurrentResourceName() == resourceName then
    PlayerJob = QBCore.Functions.GetPlayerData().job
    PipelineZones()
  end
end)

-- on resource stop
AddEventHandler('onResourceStop', function(resourceName)
  if GetCurrentResourceName() == resourceName then
    for k, v in pairs(Config.Zones) do
      exports['qb-target']:RemoveZone("pipeline" .. k)
    end
  end
end)

-- on player loaded
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
  PlayerJob = QBCore.Functions.GetPlayerData().job
  PipelineZones()
end)

-- on player unloaded
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
  PlayerJob = {}
  for k, v in pairs(Config.Zones) do
    exports['qb-target']:RemoveZone("pipeline" .. k)
  end
end)

function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Wait(0)
  end
end

function PipelineZones()
  for k, v in pairs(Config.Zones) do
    exports['qb-target']:AddCircleZone("pipeline" .. k, v.coords, v.radius, {
      name = "pipeline" .. k,
      debugPoly = false,
      useZ = true,
    }, {
      options = {
        {
          type = "client",
          event = v.event,
          icon = v.icon,
          label = v.label,
          job = v.job,
        },
      },
      distance = 1.5
    })
  end
  -- if not DoesEntityExist(jobPed) then
  --   RequestModel(Config.GaragePed)
  --   while not HasModelLoaded(Config.GaragePed) do Wait(0) end

  --   jobPed = CreatePed(0, Config.GaragePed, Config.PedLocation, false, false)

  --   SetEntityAsMissionEntity(jobPed, true, true)
  --   SetPedFleeAttributes(jobPed, 0, 0)
  --   SetBlockingOfNonTemporaryEvents(jobPed, true)
  --   SetEntityInvincible(jobPed, true)
  --   FreezeEntityPosition(jobPed, true)
  --   loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")
  --   TaskPlayAnim(jobPed, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0,
  --     0, 0, 0)

  --   exports['qb-target']:AddTargetEntity(jobPed, {
  --     options = {
  --       {
  --         type = "client",
  --         event = "dareu_pipeline:client:jobGarage",
  --         icon = "fa-solid fa-clipboard-check",
  --         label = "Garage",
  --         job = "burgershot"
  --       },
  --       {
  --         type = "client",
  --         event = "dareu_pipeline:client:storeGarage",
  --         icon = "fa-solid fa-clipboard-check",
  --         label = "Store Vehicle",
  --         job = "burgershot"
  --       },
  --     },
  --     distance = 1.5,
  --   })
  -- end
end

-- tray
RegisterNetEvent("dareu_pipeline:client:frontTray", function()
  TriggerEvent("inventory:client:SetCurrentStash", "pipetray")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "pipetray", {
    maxweight = 30000,
    slots = 12,
  })
end)

-- fridge
RegisterNetEvent("dareu_pipeline:client:jobFridge", function()
  TriggerEvent("inventory:client:SetCurrentStash", "pipefridge")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "pipefridge", {
    maxweight = 300000,
    slots = 12,
  })
end)

-- toggle on duty
RegisterNetEvent('dareu_pipeline:clientToggleDuty', function()
  TriggerServerEvent("QBCore:ToggleDuty")
end)

-- billing
RegisterNetEvent("dareu_pipeline:bill", function()
  local bill = exports['qb-input']:ShowInput({
    header = "Cash Register",
    submitText = "Charge",
    inputs = {
      {
        text = "Server ID(#)",
        name = "citizenid",
        type = "text",
        isRequired = true       -- isRequired is optional, defaults to false
      },
      {
        text = "   Bill Price ($)",
        name = "billprice",
        type = "number",
        isRequired = false       -- isRequired is optional, defaults to false
      }

    }
  })
  if bill ~= nil then
    if bill.citizenid == nil or bill.billprice == nil then
      return
    end
    TriggerServerEvent("dareu_pipeline:server:billPlayer", bill.citizenid, bill.billprice)
  end
end)
