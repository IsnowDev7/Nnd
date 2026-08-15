local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua"
))()

local Window = Library:CreateWindow({
    Title = "Example Hub",
    SubTitle = "v1.0",
    Footer = "Steal An Egg",
    Size = UDim2.new(0, 700, 0, 500),
    Position = UDim2.new(0.5, -350, 0.5, -250),
    Center = true,
    CornerRadius = 8,
    ToggleKeybind = Enum.KeyCode.RightControl,
    Icon = "rbxassetid://6031075931",
    BackgroundBlur = true,
    TitleAnimation = true,
    IconAnimation = true,
    AddGroupboxAnimation = true,
    AutoResizable = true,
    Animations = {
        ToggleWindow = true,
        TabSwitch = true,
        Groupbox = true,
        Dropdown = true,
        KeyPicker = true,
    },
    TabTransitionTime = 0.22,
    TabSwipeOffset = 26,
    TabSwipeFrom = "bottom",
})

Window:SetSidebarWidth(40)
Window:SetCornerRadius(10)

local InfoTab = Window:AddTab({
    Name = "Info",
    Icon = "info",
    IconColor = "BlueColor",
})

local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings",
    IconColor = "GreenColor",
})

InfoTab:UserPanelBox({
    Title = "Welcome In EXAMPLE ONLY",
    UserIcon = true,
    Username = true,
    Information = {
        "Game: Steal An Egg",
        { Label = "Version", Value = "First Release V1" },
    },
})

-- Left side: changelog.
local ChangelogBox = InfoTab:AddLeftGroupbox("Changelog", "history")

ChangelogBox:AddLabel("Update Changelogs")
ChangelogBox:AddLabel("First Release V1")

-- Right side: game details.
local GameDetailsBox = InfoTab:AddRightGroupbox("Steal An Egg", "gamepad-2")

-- GameThumbnail automatically uses the current game's PlaceId. No image URL
-- is required; the title/groupbox name can describe the game normally.
GameDetailsBox:AddImage("StealAnEggThumbnail", {
    GameThumbnail = true,
    Height = 150,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})

GameDetailsBox:AddLabel("Steal An Egg")
GameDetailsBox:AddLabel("Game details and information")
GameDetailsBox:AddLabel("Status: First Release V1")

local SettingsBox = SettingsTab:AddLeftGroupbox("Settings", "settings-2")

SettingsBox:AddToggle("BlurToggle", {
    Text = "Background Blur",
    Default = true,
    Callback = function(enabled)
        print("Background blur:", enabled)
    end,
})

local KeybindLabel = SettingsBox:AddLabel("Window Keybind")

KeybindLabel:AddKeyPicker("WindowKeybind", {
    Text = "Toggle Window",
    Default = "RightControl",
    Mode = "Toggle",
    Callback = function()
        print("Window keybind pressed")
    end,
})

SettingsBox:AddButton({
    Text = "Notify",
    Func = function()
        Library:Notify({
            Title = "Steal An Egg",
            Description = "Information tab loaded.",
            Duration = 3,
        })
    end,
})

SettingsBox:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end,
})

Window:SelectTab(InfoTab)

Library:Notify({
    Title = "Loaded",
    Description = "Info tab ready.",
    Duration = 3,
})
