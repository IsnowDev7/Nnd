--[[
    Nnd / Modded Obsidian UI - Complete Example

    Included current features:
    - UserPanelBox with optional Roblox headshot and configurable glow
    - GameThumbnail and direct CDN image support
    - Notification History and Enabled Features header panels
    - Collapsible groupboxes
    - Toggle, slider, dropdown, input, label, image, button, and hold button
    - KeyPicker and window minimize/restore animation controls
    - Safe unload cleanup
    - Sequential pre-window AddPopup/AddNextPopup dialogs
    - Groupbox:AddTabbox1 nested tabs

    The old floating display component was removed.
]]

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua"
))()

local Window = Library:CreateWindow({
    Title = "Steal An Egg | Nnd Example",
    SubTitle = "Modded Obsidian UI",
    Footer = "Complete Component Demo",
    Size = UDim2.fromOffset(760, 540),
    Position = UDim2.new(0.5, -380, 0.5, -270),
    Center = true,
    CornerRadius = 10,
    ToggleKeybind = Enum.KeyCode.RightControl,
    Icon = "rbxassetid://6031075931",

    -- Existing window appearance and transition options.
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

    -- These values are consumed by the current minimize/restore implementation.
    -- The library synchronizes the main window and minimized card automatically.
    Minimizable = true,
    MinimizedWidth = 280,
    MinimizedSubtitle = "RightControl to reopen",

    -- These popups appear before the main window opens. The second item is
    -- shown after the first popup's Proceed button is pressed.
    Popups = {
        {
            Title = "News!",
            Image = "rbxassetid://6031075931",
            Description = "Yoooo, a new update just dropped.",
            ButtonText = "Proceed",
        },
        {
            Title = "New Update",
            Image = "https://tr.rbxcdn.com/180DAY-79e666901b2c722b06310d267bc6c152/768/432/Image/Webp/noFilter",
            Description = "Notification History, Enabled Features, glow, and synchronized animations are ready.",
            ButtonText = "Open UI",
        },
    },
})

Window:SetSidebarWidth(44)
Window:SetCornerRadius(10)
Window:SetMinimizedSubtitle("RightControl to reopen")

local InfoTab = Window:AddTab({
    Name = "Info",
    Icon = "info",
    IconColor = "BlueColor",
})

local ComponentsTab = Window:AddTab({
    Name = "Components",
    Icon = "layout-grid",
    IconColor = "PurpleColor",
})

local SettingsTab = Window:AddTab({
    Name = "Settings",
    Icon = "settings",
    IconColor = "GreenColor",
})

--[[
    USER PANEL

    This panel is created only because UserPanelBox is explicitly defined here.
    If a tab does not call UserPanelBox, no small placeholder panel appears.
]]
InfoTab:UserPanelBox({
    Title = "Welcome to the Nnd Example",
    UserIcon = true,
    Username = true,
    Information = {
        "Game: Steal An Egg",
        "UI: Modded Obsidian",
        { Label = "Release", Value = "First Release V1" },
        { Label = "Status", Value = "All systems ready" },
    },
    Glow = {
        Enabled = true,
        Color = Color3.fromRGB(80, 150, 255),
        Thickness = 4,
        Transparency = 0.72,
    },
})

local ChangelogBox = InfoTab:AddLeftGroupbox(
    "Changelog",
    "history",
    true,
    false,
    false
)

ChangelogBox:AddLabel("Update Changelogs")
ChangelogBox:AddLabel("First Release V1")
ChangelogBox:AddLabel("UserPanel glow support added")
ChangelogBox:AddLabel("Notification History added")
ChangelogBox:AddLabel("Enabled Features panel added")
ChangelogBox:AddLabel("Synchronized minimize animation added")

local GameDetailsBox = InfoTab:AddRightGroupbox(
    "Steal An Egg",
    "gamepad-2",
    true,
    false,
    false
)

-- Automatically loads the current game's thumbnail using game.PlaceId.
GameDetailsBox:AddImage("GameThumbnail", {
    GameThumbnail = true,
    Height = 150,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})

GameDetailsBox:AddLabel("Steal An Egg")
GameDetailsBox:AddLabel("Game details and information")
GameDetailsBox:AddLabel("Status: First Release V1")

-- Direct image URLs are supported by the current AddImage implementation.
-- Replace this URL with a Roblox CDN, HTTPS CDN, PNG, JPEG, or GIF URL.
GameDetailsBox:AddImage("ExternalImage", {
    Image = "https://tr.rbxcdn.com/180DAY-79e666901b2c722b06310d267bc6c152/768/432/Image/Webp/noFilter",
    Height = 120,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})

local ChangelogRightBox = InfoTab:AddRightGroupbox(
    "Library Features",
    "sparkles",
    true,
    true,
    false
)

ChangelogRightBox:AddLabel("Click any groupbox title or arrow to collapse it.")
ChangelogRightBox:AddLabel("The groupbox starts collapsed in this example.")

--[[ COMPONENTS TAB ]]

local ToggleBox = ComponentsTab:AddLeftGroupbox(
    "Toggles",
    "toggle-left",
    true,
    false,
    false
)

local FeatureToggle = ToggleBox:AddToggle("ExampleToggle", {
    Text = "Example Toggle",
    Default = false,
    Callback = function(Value)
        Library:Notify({
            Title = "Toggle Changed",
            Description = "Example Toggle is now " .. (Value and "enabled" or "disabled") .. ".",
            Duration = 2,
        })
    end,
})

ToggleBox:AddToggle("SecondToggle", {
    Text = "Second Toggle",
    Default = true,
})

local ControlsBox = ComponentsTab:AddRightGroupbox(
    "Controls",
    "sliders-horizontal",
    true,
    false,
    false
)

ControlsBox:AddSlider("ExampleSlider", {
    Text = "Animation Speed",
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        print("Animation speed:", Value)
    end,
})

ControlsBox:AddDropdown("ExampleDropdown", {
    Values = { "First", "Second", "Third" },
    Default = 1,
    Multi = false,
    Text = "Example Dropdown",
    Callback = function(Value)
        print("Dropdown value:", Value)
    end,
})

ControlsBox:AddInput("ExampleInput", {
    Default = "",
    Numeric = false,
    Finished = false,
    Text = "Example Input",
    Placeholder = "Type something...",
    Callback = function(Value)
        print("Input value:", Value)
    end,
})

ControlsBox:AddLabel("Normal label component")

-- AddTabbox1 places a tabbox inside this groupbox using a shorter API.
local ModesTabbox = ControlsBox:AddTabbox1({
    Name = "Modes",
})

local BasicModeTab = ModesTabbox:AddTab("Basic", "circle")
BasicModeTab:AddLabel("Basic mode content")
BasicModeTab:AddToggle("BasicModeToggle", {
    Text = "Enable Basic Mode",
    Default = false,
})

local AdvancedModeTab = ModesTabbox:AddTab("Advanced", "settings")
AdvancedModeTab:AddLabel("Advanced mode content")
AdvancedModeTab:AddSlider("AdvancedPower", {
    Text = "Power",
    Default = 25,
    Min = 1,
    Max = 100,
    Rounding = 0,
})

local ImageBox = ComponentsTab:AddLeftGroupbox(
    "Images",
    "image",
    true,
    true,
    false
)

ImageBox:AddImage("RobloxCDNExample", {
    Image = "https://tr.rbxcdn.com/180DAY-79e666901b2c722b06310d267bc6c152/768/432/Image/Webp/noFilter",
    Height = 140,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})

ImageBox:AddLabel("This groupbox starts collapsed.")

local ActionsBox = ComponentsTab:AddRightGroupbox(
    "Actions",
    "mouse-pointer-click",
    true,
    false,
    false
)

ActionsBox:AddButton({
    Text = "Normal Button",
    Func = function()
        Library:Notify({
            Title = "Button Pressed",
            Description = "The normal button callback fired.",
            Duration = 2,
        })
    end,
})

-- HoldButton fills its progress bar while the button is held.
ActionsBox:AddHoldButton("HoldToNotify", {
    Text = "Hold for Notification",
    HoldTime = 1.25,
    Func = function()
        Library:Notify({
            Title = "HoldButton Complete",
            Description = "The button was held long enough.",
            Duration = 3,
        })
    end,
})

ActionsBox:AddButton({
    Text = "Toggle Minimized Window",
    Func = function()
        Window:ToggleMinimized()
    end,
})

--[[ SETTINGS TAB ]]

local SettingsBox = SettingsTab:AddLeftGroupbox(
    "Settings",
    "settings-2",
    true,
    false,
    false
)

SettingsBox:AddToggle("BlurToggle", {
    Text = "Background Blur",
    Default = true,
    Callback = function(Value)
        print("Background blur setting:", Value)
    end,
})

SettingsBox:AddToggle("AnimationToggle", {
    Text = "Window Animations",
    Default = true,
    Callback = function(Value)
        Window:SetAnimations({
            ToggleWindow = Value,
            TabSwitch = Value,
            Groupbox = Value,
            Dropdown = Value,
            KeyPicker = Value,
        })
    end,
})

local KeybindLabel = SettingsBox:AddLabel("Window Keybind")

KeybindLabel:AddKeyPicker("WindowKeybind", {
    Text = "Toggle Window",
    Default = "RightControl",
    Mode = "Toggle",
    Callback = function()
        print("RightControl pressed")
    end,
})

local NotificationsBox = SettingsTab:AddRightGroupbox(
    "Notifications",
    "bell",
    true,
    false,
    false
)

NotificationsBox:AddButton({
    Text = "Send Test Notification",
    Func = function()
        Library:Notify({
            Title = "Test Notification",
            Description = "This notification is added to Notification History.",
            Duration = 4,
        })
    end,
})

NotificationsBox:AddButton({
    Text = "Clear Notification History",
    Func = function()
        Library:ClearNotificationHistory()
        Library:Notify({
            Title = "Notification History",
            Description = "History cleared.",
            Duration = 2,
        })
    end,
})

NotificationsBox:AddLabel("Use the bell in the window header to open history.")
NotificationsBox:AddLabel("Use the sliders/features icon to view enabled features.")

local LifecycleBox = SettingsTab:AddLeftGroupbox(
    "Window Lifecycle",
    "power",
    true,
    false,
    false
)

LifecycleBox:AddButton({
    Text = "Minimize Window",
    Func = function()
        Window:SetMinimized(true)
    end,
})

LifecycleBox:AddButton({
    Text = "Restore Window",
    Func = function()
        Window:SetMinimized(false)
    end,
})

LifecycleBox:AddButton({
    Text = "Unload Library",
    Func = function()
        Library:Unload()
    end,
})

Window:SelectTab(InfoTab)

Library:Notify({
    Title = "Nnd Example Loaded",
    Description = "UserPanel, glow, popups, nested tabbox, animations, hold button, notifications, and collapsible groupboxes are ready.",
    Duration = 4,
})
