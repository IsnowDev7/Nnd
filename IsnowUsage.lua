-- Isnow Key System usage example
-- Source: https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau

local Isnow = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau"
))()

Isnow.Appearance.Title = "Isnow"
Isnow.Appearance.Subtitle = "Enter your key to continue"
Isnow.Appearance.Icon = "rbxassetid://134697043118282"
Isnow.Links.Discord = "Discord.gg/isnow"
Isnow.Storage.FileName = "Isnow_Key"
-- Isnow.Options.KeylessUI = true

Isnow.Theme.Accent = Color3.fromRGB(110, 60, 255)
Isnow.Theme.AccentHover = Color3.fromRGB(130, 90, 255)
Isnow.Theme.Background = Color3.fromRGB(10, 10, 20)
Isnow.Theme.Header = Color3.fromRGB(15, 15, 30)
Isnow.Theme.Input = Color3.fromRGB(20, 20, 40)
Isnow.Theme.Text = Color3.fromRGB(255, 255, 255)
Isnow.Theme.TextDim = Color3.fromRGB(160, 160, 200)
Isnow.Theme.Success = Color3.fromRGB(0, 220, 180)
Isnow.Theme.Error = Color3.fromRGB(255, 70, 90)
Isnow.Theme.StatusIdle = Color3.fromRGB(120, 100, 200)

Isnow.Shop = {
    Enabled = true,
    Icon = "",
    Title = "Get Premium",
    Subtitle = "Instant delivery • 24/7 support",
    ButtonText = "Buy",
    Link = "https://isnow.example/premium"
}

Isnow:SetChangelog({
    Enabled = true,
    Entries = {
        {
            Version = "2.3.0",
            Date = "Aug 13, 2026",
            Badge = "NEW",
            Image = "rbxassetid://1234567890",
            Description = {
                "Introduced the new Isnow Control Center",
                "Added the Obsidian-style window frame and glow",
                "Improved key-system layout and animations"
            },
            JoinLink = "https://www.roblox.com/games/1234567890/Example-Game",
            JoinButton = true
        },
        {
            Version = "2.2.0",
            Date = "Aug 1, 2026",
            Image = "rbxassetid://9876543210",
            Description = {
                "Improved validation performance",
                "Added new theme customization options"
            },
            JoinButton = false
        }
    }
})

Isnow:LaunchJunkie({
    Service = "YOUR_SERVICE",
    Identifier = "YOUR_IDENTIFIER",
    Provider = "YOUR_PROVIDER"
})

return Isnow

-- Supported changelog image formats:
-- Image = 1234567890
-- Image = "rbxassetid://1234567890"
-- Image = "rbxasset://textures/your-image"

-- You can also use a single changelog entry directly:
-- Isnow:SetChangelog({
--     Enabled = true,
--     Version = "2.4.0",
--     Date = "Aug 20, 2026",
--     Image = "rbxassetid://1234567890",
--     Description = "A single update description",
--     JoinLink = "https://www.roblox.com/games/1234567890/Example-Game",
--     JoinButton = true
-- })

-- The source exposes these main settings:
-- Isnow.Appearance, Isnow.Links, Isnow.Storage, Isnow.Options,
-- Isnow.Theme, Isnow.Shop, Isnow:SetChangelog(), Isnow:Launch(),
-- and Isnow:LaunchJunkie().

-- Replace the placeholder service, identifier, provider, image IDs,
-- purchase URL, Discord link, and game link with your real values.

-- End of Isnow usage example

-- Raw source URL:
-- https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau

-- The source file is intentionally kept separate from this usage file
-- so updates can be pulled independently.

-- Isnow branding replaces the former Arqel public API.

-- Changelog entries may use Description = { ... } or Changes = { ... }.

-- Join buttons appear in the lower-right corner of an image card.

-- Numeric Roblox asset IDs are normalized automatically.

-- Roblox game links are converted to place IDs before teleporting.

-- The UI keeps the existing draggable and blur settings.

-- This file demonstrates the complete public configuration surface.

-- End.

-- Isnow.

--

-- Additional note: keep this example synchronized with the source release.

--

-- https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau

-- End of file.

-- Isnow Key System.

--

-- Configuration complete.

-- End.

--

-- Isnow.

-- EOF.

--

-- Raw link is defined at the top of this file.

-- End.

--

-- Isnow.

--

-- Done.

--

-- End.
