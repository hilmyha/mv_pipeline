Config = {}

Config.NewCore = true -- Set to false if you are using the old core (esx)

HungerFill = {
  -- Fill up the hunger bar
  ["beefstirfry"] = 45
}

ThirstFill = {
  -- Fill up the thirst bar
  ["grapemilkshake"] = 45
}

Config.Zones = {
  -- Add your zones here

  -- tray
  [1] = {
    coords = vector3(-2191.19, -396.36, 13.32),
    radius = 1.0,
    icon = "far fa-clipboard",
    event = "dareu_pipeline:client:frontTray",
    label = "Food Tray",
  },
  -- billing
  [2] = {
    coords = vector3(-2193.02, -395.02, 13.32),
    radius = 0.45,
    icon = "fa-brands fa-cc-visa",
    event = "dareu_pipeline:bill",
    label = "Bill Customer",
    job = "pipeline"
  },
  -- duty
  [3] = {
    coords = vector3(-2201.77, -386.64, 13.32),
    radius = 1.0,
    icon = "fa-solid fa-clock",
    event = "dareu_pipeline:clientToggleDuty",
    label = "Clock In/Out",
    job = "pipeline"
  },
  -- cooking
  [4] = {
    coords = vector3(-2214.24, -379.74, 13.32),
    radius = 1.0,
    icon = "fa-solid fa-burger",
    event = "dareu_pipeline:client:cookFoods",
    label = "Make Foods",
    job = "pipeline"
  },
  -- drinks
  [5] = {
    coords = vector3(-2205.43, -380.77, 13.32),
    radius = 1.0,
    icon = "fa-solid fa-beer-mug-empty",
    event = "dareu_pipeline:client:drinkStation",
    label = "Make Drinks",
    job = "pipeline"
  },
  -- fridge
  [6] = { 
    coords = vector3(-2208.29, -372.96, 13.32), 
    radius = 1.15, 
    icon = "fa-solid fa-square-up-right", 
    event = "dareu_pipeline:client:jobFridge", 
    label = "Fridge", 
    job = "pipeline" },
}
