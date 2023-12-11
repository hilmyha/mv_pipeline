# Pipeline Restaurant script for QBCore Framework.
A restaurant job script for QBCore Framework.

## Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target) or [ox-target](https://github.com/overextended/ox_target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [PolyZone](https://github.com/mkafrin/PolyZone)
- [qb-simplefarming](https://github.com/trclassic92/qb-simplefarming)

# How to install mv_pipeline

1. Drag `mv_pipeline` into your resources folder or any subfolder.
2. Make sure that the folder is named `mv_pipeline` and not `mv_pipeline-main`
3. Make sure you have the latest update of QBCore Framework.
4. Add `ensure mv_pipeline` to your server.cfg

### Add this to `qb-core/shared/items.lua`

This for the items that you can get from the restaurant.

```lua
QBShared.Items = {
  beefstirfry = {name = 'beefstirfry', label = 'Beef Stir Fry', weight = 300, type = 'item', image = 'beefstirfry.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Beef Stir Fry'},
  grapemilkshake = {name = 'grapemilkshake', label = 'Grape Milkshake', weight = 300, type = 'item', image = 'grapemilkshake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Grape Milkshake'},
}
```

### Add this to `qb-core/shared/jobs.lua`

This for the job that you can get for the pipeline restaurant.

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

### Pipeline Restaurant MLO.

For MLO you can download it from [MalibuTechTeam](https://github.com/MalibuTechTeam/iak_pipeline_inn/releases/tag/v1.0.0)

## Troubleshooting or Support
For help troubleshooting issues you've encountered (that aren't in the FAQ), or to suggest new features, use the [issues page](https://github.com/hilmyha/mv_pipeline/issues). Just a reminder though, I do this in my free time and so there is no guarantee an issue will be fixed or a feature will be added. In lieu of my limited time, I will prioritize issues and bugs over features.

## License
Please see the LICENSE file. That file will always overrule anything mentioned in the README.md or wiki