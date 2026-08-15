# Nnd


## UserPanelBox

The password-feature library now includes a normal always-visible opaque user panel.

Raw library:

```text
https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua
```

Raw example:

```text
https://raw.githubusercontent.com/IsnowDev7/Nnd/main/UserPanelExample.lua
```

Minimal usage:

```lua
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua"
))()

local Window = Library:CreateWindow({
    Title = "Example Hub",
    SubTitle = "v1.0",
    Footer = "Obsidian UI",
})

local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "home",
    IconColor = "BlueColor",
})

MainTab:UserPanelBox({
    Title = "Welcome In EXAMPLE ONLY",
    UserIcon = true,
    Username = true,
    Information = "Yooooo",
})
```

The `Information` value may also be a table containing any number of strings or labeled rows such as `{ Label = "Map", Value = "Prison Life" }`.
