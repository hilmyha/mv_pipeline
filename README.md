# Pipeline Restaurant script for QBCore Framework.

## Dependencies
- [QBCore Framework]()
- [qb-simplefarming]()

---
### Add this to `qb-core/shared/items.lua`



```lua
QBShared.Items = {
  beefstirfry = {name = 'beefstirfry', label = 'Beef Stir Fry', weight = 300, type = 'item', image = 'beefstirfry.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Beef Stir Fry'},
  grapemilkshake = {name = 'grapemilkshake', label = 'Grape Milkshake', weight = 300, type = 'item', image = 'grapemilkshake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Grape Milkshake'},
}
```

### Add this to `qb-core/shared/jobs.lua`

```lua
pipeline = {
  label = "Pipeline",
  defaultDuty = true,
  grades = {
    ['0'] = { name = "Trainee", payment = 50 },
    ['1'] = { name = "Employee", payment = 75 },
    ['2'] = { name = "Burger Flipper", payment = 100 },
    ['3'] = { name = "Manager", payment = 125 },
    ['4'] = { name = "Owner", isboss = true, payment = 150 },
  },
},
```