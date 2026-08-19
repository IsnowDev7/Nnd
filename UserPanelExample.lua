local repo = "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/Library_lua_password_feature.lua"
local managerRepo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/"
local Library = loadstring(game:HttpGet(repo))()
local ThemeManager = loadstring(game:HttpGet(managerRepo .. "ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(managerRepo .. "SaveManager.lua"))()

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("ComponentGalleryThemes")
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
SaveManager:SetFolder("ComponentGallery/Showcase")
SaveManager:SetSubFolder("Showcase")


local Window = Library:CreateWindow({
    Title = "UI Component Gallery",
    SubTitle = "Normal Obsidian-style usage",
    InitialTab = "Info",
    Footer = {
        { Text = "Component Demo", Copyable = true, CopyText = "UI Component Gallery" },
        { Text = "RightControl", Copyable = true, CopyText = "RightControl" },
    },
    CopyableFooter = true,
    Size = UDim2.fromOffset(620, 470),
    Position = UDim2.new(0.5, -310, 0.5, -235),
    Center = true,
    CornerRadius = 10,
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

    Minimizable = true,
    MinimizedWidth = 250,
    MinimizedSubtitle = "RightControl to reopen",

    Popups = {
        {
            Title = "Welcome to the component gallery",
            Description = "This is a normal component demo. It contains no gameplay automation or game-specific logic.",
            ButtonText = "Continue",
        },
        {
            Title = "What is included",
            Description = "Explore controls, themes, config profiles, nested tabs, media, dependencies, notifications, and lifecycle actions.",
            ButtonText = "Open Gallery",
        },
    },
})

Window:SetSidebarWidth(48)
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
    IconColor = "AccentColor",
})

local AdvancedTab = Window:AddTab({
    Name = "Advanced",
    Icon = "panels-top-left",
    IconColor = "WhiteColor",
})

local UISettingsTab = Window:AddTab({
    Name = "UI Settings",
    Icon = "settings",
    IconColor = "AccentColor",
})

local LifecycleTab = Window:AddTab({
    Name = "Lifecycle",
    Icon = "power",
    IconColor = "BlueColor",
})

InfoTab:UserPanelBox({
    Title = "Hello World",
    UserIcon = false,
    Username = false,
    Information = "Example only",
    IsNormal = true,
    Glow = {
        Enabled = true,
        Color = Color3.fromRGB(125, 85, 255),
        Thickness = 3,
        Transparency = 0.78,
    },
})

local ChangelogBox = InfoTab:AddLeftGroupbox("Did You Know", "lightbulb", true, false, false)
ChangelogBox:AddLabel("Did you know? A groupbox can collapse from its title row.")
ChangelogBox:AddLabel("Did you know? A toggle can own a color picker addon.")
ChangelogBox:AddLabel("Did you know? Multi dropdown values can be saved by SaveManager.")
ChangelogBox:AddLabel("Did you know? ThemeManager can apply built-in and custom themes.")
ChangelogBox:AddLabel("Did you know? The footer can copy text with one click.")

local DetailsBox = InfoTab:AddRightGroupbox("Game Image Display", "image", true, false, false)
DetailsBox:AddImage("CurrentGameThumbnail", {
    GameThumbnail = true,
    Height = 116,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})
DetailsBox:AddLabel("GameThumbnail = true asks the library for the current place thumbnail.")
DetailsBox:AddLabel("No fixed game image URL is required for this mode.")
DetailsBox:AddLabel("For a fixed image, pass Image with an asset or supported HTTPS source.")

local ExternalImageBox = InfoTab:AddRightGroupbox("Image Sources", "image-plus", true, true, false)
ExternalImageBox:AddLabel("Image controls accept Roblox assets and supported HTTPS image sources.")
ExternalImageBox:AddLabel("The library converts supported external sources into a Roblox-readable asset when available.")
ExternalImageBox:AddLabel("This section is documentation only and does not target a specific game.")


local ToggleBox = ComponentsTab:AddLeftGroupbox("Toggles and Addons", "toggle-left", true, false, false)
ToggleBox:AddDivider("Toggle")

local DemoToggle = ToggleBox:AddToggle("DemoToggle", {
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

DemoToggle:AddColorPicker("DemoToggleColor", {
    Default = Color3.fromRGB(125, 85, 255),
    Title = "Toggle color",
    Callback = function(Color)
        print("Toggle color:", Color)
    end,
})

local DemoKeyToggle = ToggleBox:AddToggle("DemoKeyToggle", {
    Text = "Toggle with KeyPicker",
    Default = true,
})
DemoKeyToggle:AddKeyPicker("DemoKeyPicker", {
    Text = "Activation key",
    Default = "RightShift",
    Mode = "Toggle",
    SyncToggleState = true,
})

ToggleBox:AddCheckbox("DemoCheckbox", {
    Text = "Example Checkbox",
    Default = true,
})

ToggleBox:AddLabel("ColorPicker is an addon on the toggle, not a groupbox method.")

local ControlsBox = ComponentsTab:AddRightGroupbox("Basic Controls", "sliders-horizontal", true, false, false)
ControlsBox:AddDivider("Numeric and text controls")

local DemoSlider = ControlsBox:AddSlider("DemoSlider", {
    Text = "Animation Speed",
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(Value)
        print("Animation speed:", Value)
    end,
})

local DemoInput = ControlsBox:AddInput("DemoInput", {
    Default = "Example",
    Numeric = false,
    Finished = false,
    Text = "Example Input",
    Placeholder = "Type something...",
    Callback = function(Value)
        print("Input value:", Value)
    end,
})

local DemoSingleDropdown = ControlsBox:AddDropdown("DemoSingleDropdown", {
    Values = { "First", "Second", "Third", "Fourth" },
    Default = 1,
    Multi = false,
    Text = "Single Dropdown",
    Callback = function(Value)
        print("Single dropdown:", Value)
    end,
})

local DemoMultiDropdown = ControlsBox:AddDropdown("DemoMultiDropdown", {
    Values = { "Alpha", "Beta", "Gamma", "Delta" },
    Default = { Alpha = true, Gamma = true },
    Multi = true,
    Text = "Multi Dropdown",
    SelectAllButtons = true,
    Callback = function(Value)
        print("Multi dropdown:", Value)
    end,
})

ControlsBox:AddLabel("Dropdown supports single and Multi = true selection modes.")

local ButtonBox = ComponentsTab:AddLeftGroupbox("Buttons", "mouse-pointer-click", true, false, false)
ButtonBox:AddButton({
    Text = "Normal Button",
    Func = function()
        Library:Notify({
            Title = "Button Pressed",
            Description = "The normal button callback fired.",
            Duration = 2,
        })
    end,
})

ButtonBox:AddHoldButton("DemoHoldButton", {
    Text = "Hold Button",
    HoldTime = 1.25,
    Func = function()
        Library:Notify({
            Title = "Hold Complete",
            Description = "The button was held for the required duration.",
            Duration = 3,
        })
    end,
})

ButtonBox:AddButton({
    Text = "Send Test Notification",
    Func = function()
        Library:Notify({
            Title = "Component Gallery",
            Description = "This notification is also recorded in Notification History.",
            Duration = 3,
        })
    end,
})

local NestedBox = ComponentsTab:AddRightGroupbox("Nested Tabs", "folder-tree", true, false, false)
NestedBox:AddLabel("AddTabbox1 is the short nested-tab API.")
local NestedTabs = NestedBox:AddTabbox1({ Name = "Demo Modes", Side = 1 })

local BasicTab = NestedTabs:AddTab("Basic", "circle")
BasicTab:AddLabel("Basic nested tab content")
BasicTab:AddToggle("NestedBasicToggle", {
    Text = "Nested Toggle",
    Default = false,
})

local AdvancedNestedTab = NestedTabs:AddTab("Advanced", "settings")
AdvancedNestedTab:AddLabel("Advanced nested tab content")
AdvancedNestedTab:AddSlider("NestedSlider", {
    Text = "Nested Power",
    Default = 25,
    Min = 1,
    Max = 100,
    Rounding = 0,
})

local OfficialTabbox = ComponentsTab:AddRightTabbox("Official API")
local OfficialTab = OfficialTabbox:AddTab("Tab", "layers")
OfficialTab:AddLabel("This tabbox uses AddRightTabbox.")
OfficialTab:AddButton({
    Text = "Tabbox Button",
    Func = function()
        print("Official tabbox button pressed")
    end,
})


local AdvancedLeft = AdvancedTab:AddLeftGroupbox("Dependencies", "git-branch", true, false, false)
local DependencyToggle = AdvancedLeft:AddToggle("DependencyToggle", {
    Text = "Show dependent controls",
    Default = false,
})

local DependencyBox = AdvancedLeft:AddDependencyBox()
DependencyBox:AddLabel("This box is visible only when the toggle is enabled.")
DependencyBox:AddSlider("DependentSlider", {
    Text = "Dependent Value",
    Default = 40,
    Min = 0,
    Max = 100,
    Rounding = 0,
})
DependencyBox:SetupDependencies({
    { DependencyToggle, true },
})

local DependencyGroup = AdvancedLeft:AddDependencyGroupbox()
DependencyGroup:AddLabel("This is a dependency groupbox.")
DependencyGroup:AddToggle("NestedDependencyToggle", {
    Text = "Nested dependent toggle",
    Default = true,
})
DependencyGroup:SetupDependencies({
    { DependencyToggle, true },
})

local AdvancedRight = AdvancedTab:AddRightGroupbox("Media and Instances", "boxes", true, false, false)
AdvancedRight:AddImage("AdvancedImage", {
    Image = "https://tr.rbxcdn.com/180DAY-79e666901b2c722b06310d267bc6c152/768/432/Image/Webp/noFilter",
    Height = 105,
    ScaleType = Enum.ScaleType.Crop,
    Transparency = 0,
    BackgroundTransparency = 0,
})

AdvancedRight:AddVideo("DemoVideo", {
    Video = "",
    Looped = false,
    Playing = false,
    Volume = 1,
    Height = 110,
})
AdvancedRight:AddLabel("Video is ready for a valid Roblox video asset id.")

local DemoModel = Instance.new("Model")
DemoModel.Name = "ComponentDemoViewportModel"
local DemoCore = Instance.new("Part")
DemoCore.Name = "Core"
DemoCore.Anchored = true
DemoCore.Size = Vector3.new(4, 2, 4)
DemoCore.Color = Color3.fromRGB(125, 85, 255)
DemoCore.Parent = DemoModel
local DemoTop = Instance.new("Part")
DemoTop.Name = "Top"
DemoTop.Anchored = true
DemoTop.Size = Vector3.new(2, 1, 2)
DemoTop.Position = Vector3.new(0, 1.5, 0)
DemoTop.Color = Color3.fromRGB(80, 155, 255)
DemoTop.Parent = DemoModel

AdvancedRight:AddViewport("DemoViewport", {
    Object = DemoModel,
    Clone = true,
    AutoFocus = true,
    Interactive = true,
    Height = 180,
})

local PassthroughLabel = Instance.new("TextLabel")
PassthroughLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PassthroughLabel.BackgroundTransparency = 0
PassthroughLabel.BorderSizePixel = 0
PassthroughLabel.Size = UDim2.new(1, 0, 1, 0)
PassthroughLabel.Font = Enum.Font.Code
PassthroughLabel.Text = "UI Passthrough instance"
PassthroughLabel.TextColor3 = Color3.new(1, 1, 1)
PassthroughLabel.TextSize = 14
AdvancedRight:AddUIPassthrough("DemoPassthrough", {
    Instance = PassthroughLabel,
    Height = 34,
})

local SubTabA = AdvancedTab:AddSubTab({ Name = "Overview", Icon = "list" })
local SubTabB = AdvancedTab:AddSubTab({ Name = "Notes", Icon = "notebook-pen" })

local OverviewSubBox = SubTabA:AddLeftGroupbox("Overview Content")
OverviewSubBox:AddLabel("Overview subtab is active by default.")
OverviewSubBox:AddDivider("Subtab API")

local NotesSubBox = SubTabB:AddLeftGroupbox("Notes Content")
NotesSubBox:AddLabel("This is a second tab created with AddSubTab.")

local ThemeManagerTab = UISettingsTab
ThemeManager:ApplyToTab(ThemeManagerTab, "paintbrush")
SaveManager:BuildConfigSection(ThemeManagerTab, "folder-cog")
ThemeManager:LoadDefault()
local AppearanceBox = UISettingsTab:AddLeftGroupbox("Appearance Demo", "sliders-horizontal", true, false, false)
local AccentToggle = AppearanceBox:AddToggle("AccentPreviewToggle", {
    Text = "Accent preview control",
    Default = true,
})
AccentToggle:AddColorPicker("AccentColorPicker", {
    Default = Library.Scheme.AccentColor,
    Title = "Accent color",
    Transparency = 0,
    Callback = function(Color)
        Library.Scheme.AccentColor = Color
        Library:UpdateColorsUsingRegistry()
    end,
})

local CornerRadiusSlider = AppearanceBox:AddSlider("CornerRadius", {
    Text = "Corner radius",
    Default = 8,
    Min = 0,
    Max = 16,
    Rounding = 0,
    Callback = function(Value)
        Window:SetCornerRadius(Value)
    end,
})

local WindowGlowToggle = AppearanceBox:AddToggle("WindowGlow", {
    Text = "Window glow",
    Default = true,
    Callback = function(Value)
        Window:SetGlow(Value)
    end,
})

local BackgroundImageInput = AppearanceBox:AddInput("BackgroundImageInput", {
    Default = "",
    Text = "Background image URL",
    Placeholder = "Optional HTTPS or Roblox CDN URL",
    Callback = function(Value)
        Window:SetBackgroundImage(Value)
    end,
})

AppearanceBox:AddButton({
    Text = "Clear background image",
    Func = function()
        BackgroundImageInput:SetValue("")
        Window:SetBackgroundImage("")
    end,
})

local ManagerNotes = UISettingsTab:AddRightGroupbox("Manager Usage", "book-open", true, false, false)
ManagerNotes:AddLabel("ThemeManager creates the theme controls in this tab.")
ManagerNotes:AddLabel("SaveManager creates the configuration controls in this tab.")
ManagerNotes:AddLabel("Autoload uses the configured component folder.")
ManagerNotes:AddLabel("The accent color picker remains a normal toggle addon.")


local AnimationBox = LifecycleTab:AddLeftGroupbox("Animations", "sparkles", true, false, false)
local AnimationToggle = AnimationBox:AddToggle("AnimationsEnabled", {
    Text = "Window and component animations",
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

AnimationBox:AddButton({
    Text = "Toggle minimized card",
    Func = function()
        Window:ToggleMinimized()
    end,
})
AnimationBox:AddButton({
    Text = "Minimize window",
    Func = function()
        Window:SetMinimized(true)
    end,
})
AnimationBox:AddButton({
    Text = "Restore window",
    Func = function()
        Window:SetMinimized(false)
    end,
})

local PasswordBox = LifecycleTab:AddLeftGroupbox("Password Dialog", "lock-keyhole", true, false, false)
PasswordBox:AddLabel("This uses the password dialog built into the modded library.")
PasswordBox:AddButton({
    Text = "Open password dialog",
    Func = function()
        Window:AddPasswordDialog("DemoPasswordDialog", {
            Title = "Demo Password",
            Description = "Enter the password to view the normal dialog flow.",
            Password = "DemoPass",
            InputLabel = "Password",
            Placeholder = "Try DemoPass",
            Remember = true,
            RememberText = "Remember this demo password",
            ErrorText = "The demo password is DemoPass.",
            Callback = function(_, Remember)
                Library:Notify({
                    Title = "Password Accepted",
                    Description = Remember and "The remember option was enabled." or "The password was accepted.",
                    Duration = 3,
                })
            end,
        })
    end,
})

local NotificationBox = LifecycleTab:AddRightGroupbox("Notifications", "bell", true, false, false)
NotificationBox:AddButton({
    Text = "Send test notification",
    Func = function()
        Library:Notify({
            Title = "Component Notification",
            Description = "Notification History records this message.",
            Duration = 4,
        })
    end,
})
NotificationBox:AddButton({
    Text = "Clear notification history",
    Func = function()
        Library:ClearNotificationHistory()
        Library:Notify({
            Title = "Notification History",
            Description = "History cleared.",
            Duration = 2,
        })
    end,
})
NotificationBox:AddLabel("Use the bell icon in the header for notification history.")
NotificationBox:AddLabel("Use the features icon in the header for enabled toggles.")

local FooterBox = LifecycleTab:AddRightGroupbox("Footer Copy", "clipboard", true, false, false)
FooterBox:AddLabel("Footer segments can be copied individually.")
FooterBox:AddButton({
    Text = "Set copyable footer",
    Func = function()
        Window:SetFooter({
            { Text = "Component Demo", Copyable = true, CopyText = "UI Component Gallery" },
            { Text = "RightControl", Copyable = true, CopyText = "RightControl" },
        })
        Library:Notify({
            Title = "Footer Updated",
            Description = "Click the footer segments to copy their values.",
            Duration = 3,
        })
    end,
})

local UnloadBox = LifecycleTab:AddLeftGroupbox("Unload and Cleanup", "trash-2", true, false, false)
UnloadBox:AddLabel("The trash button in the header also calls Library:Unload().")
UnloadBox:AddButton({
    Text = "Unload Library",
    Func = function()
        Library:Unload()
    end,
})

Library:OnUnload(function()
    if DemoModel then
        DemoModel:Destroy()
        DemoModel = nil
    end
end)

SaveManager:LoadAutoloadConfig()
Window:SelectTab("Info")

Library:Notify({
    Title = "Component Gallery Loaded",
    Description = "Explore the full normal component example, including color picker, themes, config, and multi dropdown.",
    Duration = 4,
})
