local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua"
))()

local Window = Library:CreateWindow({
    Title = "Example Hub",
    SubTitle = "v1.0",
    Footer = "Obsidian UI",
    Size = UDim2.new(0, 700, 0, 500),
    Position = UDim2.new(0.5, -350, 0.5, -250),
    Center = true,
    CornerRadius = 8,
    ThemeTag = "Dark",
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

local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "home",
    IconColor = "BlueColor",
})

local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings",
    IconColor = "GreenColor",
})

-- Exact UserPanelBox usage requested.
MainTab:UserPanelBox({
    Title = "Welcome In EXAMPLE ONLY",
    UserIcon = true,
    Username = true,
    Information = "Yooooo",
})

local MainLeft = MainTab:AddLeftGroupbox("Main Features", "box")
local MainRight = MainTab:AddRightGroupbox("Options", "info")

MainLeft:AddButton({
    Text = "Click Me",
    Func = function()
        Library:Notify({
            Title = "Clicked",
            Description = "Button works!",
            Duration = 2,
        })
    end,
})

MainLeft:AddToggle("ExampleToggle", {
    Text = "Enable Feature",
    Description = "Example toggle callback.",
    Default = false,
    Callback = function(enabled)
        print("Toggle:", enabled)
    end,
})

MainLeft:AddSlider("ExampleSlider", {
    Text = "Adjust Speed",
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(value)
        print("Slider:", value)
    end,
})

MainLeft:AddDropdown("ExampleDropdown", {
    Text = "Choose Option",
    Values = { "Option 1", "Option 2", "Option 3" },
    Default = "Option 1",
    Callback = function(value)
        print("Dropdown:", value)
    end,
})

MainLeft:AddInput("ExampleInput", {
    Text = "Enter Text",
    Default = "",
    Placeholder = "Type here...",
    Callback = function(value)
        print("Input:", value)
    end,
})

MainRight:AddLabel("This is a label")
MainRight:AddLabel("Another label")

MainRight:AddKeyPicker("ExampleKeybind", {
    Text = "Keybind",
    Default = "RightShift",
    Mode = "Toggle",
    Callback = function()
        print("Key pressed")
    end,
})

MainRight:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end,
})

local SettingsBox = SettingsTab:AddLeftGroupbox("Settings", "gear")

SettingsBox:AddToggle("BlurToggle", {
    Text = "Background Blur",
    Default = true,
    Callback = function(enabled)
        print("Blur:", enabled)
    end,
})

SettingsBox:AddButton({
    Text = "Notify",
    Func = function()
        Library:Notify({
            Title = "Notification",
            Description = "Obsidian UI is ready.",
            Duration = 3,
        })
    end,
})

Window:SelectTab(MainTab)

Library:Notify({
    Title = "Loaded",
    Description = "UI ready",
    Duration = 3,
})
