local repo = "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/NullUI.lua"
local NullUI = loadstring(game:HttpGet(repo))()

local Window = NullUI:CreateWindow({
    Title = "Hello",
    Subtitle = "NullUI component demo",
    Size = UDim2.fromOffset(520, 390),
    Position = UDim2.fromScale(0.5, 0.52),
    BlurBackground = true,
    Glow = {
        Enabled = true,
        Color = Color3.fromRGB(255, 255, 255),
        Thickness = 2,
        Transparency = 0.45,
    },
    SidebarPanel = true,
    HomeIcon = "Lucide:house",
    SidebarURL = "rbxassetid://6031075931",
    -- Icon also accepts a Roblox asset id or supported HTTPS image URL.
    -- Icon = "https://your-cdn.example/window-icon.png",
    -- Choose one background alternative; images use ScaleType.Fit and do not stretch.
    -- BackgroundImage = "https://your-cdn.example/window-background.jpg",
    -- BackgroundImageTransparency = 0.82,
    -- BackgroundVideo accepts raw GitHub HTTPS .webm only and needs getcustomasset support.
    -- BackgroundVideo = "https://raw.githubusercontent.com/your-user/your-repo/main/background.webm",
    -- BackgroundVideoTransparency = 0.82,
    -- BackgroundVideoLooped = true,
    -- BackgroundVideoAutoplay = true,
    -- BackgroundVideoMuted = true,
    -- BackgroundVideoPlaybackSpeed = 1,
    -- BackgroundVideoVolume = 0,
    -- BackgroundVideoTimePosition = 0,
    -- BackgroundVideoFallbackImage = "https://your-cdn.example/video-fallback.jpg",
    Description = "this is example only",
    Icon = "home",
    ToggleKeybind = Enum.KeyCode.RightShift,
    DefaultTab = "Home",
    Draggable = true,
    Resizable = true,
})

local HomeTab = Window:AddTab({
    Name = "Home",
    Icon = "home",
})

local ComponentsTab = Window:AddTab({
    Name = "Components",
    Icon = "layout-grid",
})

local ParagraphTab = Window:AddTab({
    Name = "Paragraph",
    Icon = "file-text",
})

local CustomTab = Window:AddTab({
    Name = "Custom",
    Icon = "code-2",
})

HomeTab:AddParagraph({
    Title = "Hello",
    Description = "This is example only. The window uses a real background blur and a white border glow.",
    Icon = "sparkles",
})

HomeTab:AddParagraph({
    Title = "Image display",
    Description = "SidebarPanel accepts SidebarURL, Roblox asset ids, and supported HTTPS image links. Paragraph accepts the same Image format when an image is provided.",
})

ComponentsTab:AddLabel("This tab demonstrates the normal component placement API.")
ComponentsTab:AddDivider()

ComponentsTab:AddButton({
    Text = "Normal Button",
    Description = "Runs its callback once when pressed.",
    Icon = "mouse-pointer-click",
    Callback = function()
        NullUI:Notify({
            Title = "Button",
            Text = "The normal button callback ran.",
            Type = "success",
            Duration = 3,
        })
    end,
})

local HoldButton = ComponentsTab:AddHoldButton({
    Text = "Hold to confirm",
    Description = "Keep the pointer or finger down until the progress bar completes.",
    Icon = "hand",
    HoldTime = 1.8,
    Callback = function()
        NullUI:Notify({
            Title = "Hold complete",
            Text = "The hold countdown reached the end.",
            Type = "success",
            Duration = 3,
        })
    end,
})

ComponentsTab:AddToggle({
    Text = "Example toggle",
    Default = true,
    Callback = function(value)
        NullUI:Notify({
            Title = "Toggle",
            Text = value and "Enabled" or "Disabled",
            Type = "info",
            Duration = 2,
        })
    end,
})

ComponentsTab:AddSlider({
    Text = "Example slider",
    Default = 45,
    Min = 0,
    Max = 100,
    Increment = 5,
})

ComponentsTab:AddTextbox({
    Text = "Example textbox",
    Placeholder = "Type here",
    Default = "",
})

ComponentsTab:AddDropdown({
    Text = "Single dropdown",
    Options = { "One", "Two", "Three" },
    Default = "One",
})

ComponentsTab:AddDropdown({
    Text = "Multi dropdown",
    Options = { "Alpha", "Beta", "Gamma", "Delta" },
    Default = { "Alpha", "Gamma" },
    MultiSelect = true,
})

ComponentsTab:AddKeybind({
    Text = "Example keybind",
    Default = Enum.KeyCode.H,
})

ParagraphTab:AddParagraph({
    Title = "Paragraph Example",
    Description = "Yooooo. Image is optional. Use Image = rbxassetid, a Roblox CDN link, a raw HTTPS link, PNG, JPEG, WebP, or GIF source.",
    Image = "rbxassetid://6031075931",
    ImageHeight = 96,
})

ParagraphTab:AddParagraph({
    Title = "Text-only paragraph",
    Description = "Leave Image out when the paragraph should contain only a title and description.",
})

local CustomFrame = Instance.new("Frame")
CustomFrame.Name = "DemoCustomFrame"
CustomFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
CustomFrame.BorderSizePixel = 0

local CustomText = Instance.new("TextLabel")
CustomText.Name = "DemoTextLabel"
CustomText.BackgroundTransparency = 1
CustomText.Size = UDim2.fromScale(1, 1)
CustomText.Font = Enum.Font.Gotham
CustomText.Text = "Custom Frame and TextLabel"
CustomText.TextColor3 = Color3.fromRGB(245, 245, 245)
CustomText.TextSize = 14
CustomText.Parent = CustomFrame

CustomTab:AddCustom(CustomFrame, {
    Name = "CustomInstance",
    Height = 46,
    Fill = true,
})

CustomTab:AddLabel("Create the Frame and TextLabel directly, then add the finished instance with AddCustom.")

local SidebarTab = Window:AddTab({
    Name = "Sidebar",
    Icon = "panel-left",
})

SidebarTab:AddLabel("The rounded SidebarPanel is enabled with SidebarPanel = true.")
SidebarTab:AddLabel("SidebarURL accepts a Roblox asset or a supported HTTPS image source.")
SidebarTab:AddButton({
    Text = "Toggle with Home",
    Icon = "home",
    Callback = function()
        Window:Toggle()
    end,
})

NullUI:Notify({
    Title = "Demo loaded",
    Text = "Blur, white glow, sidebar, paragraph, hold button, and custom UI are ready.",
    Type = "info",
    Duration = 4,
})

Window:SelectTab("Home")

NullUI.__DemoWindow = Window
NullUI.__DemoHoldButton = HoldButton
NullUI.__DemoRepo = repo
