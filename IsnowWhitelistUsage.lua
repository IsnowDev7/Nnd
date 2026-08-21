-- Isnow Key System
-- Raw library source:
-- https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau

local Isnow = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/IsnowKeySystem.luau"
))()

Isnow.Appearance.Title = "Isnow"
Isnow.Appearance.Subtitle = "Choose your access type"
Isnow.Appearance.Icon = "rbxassetid://134697043118282"

Isnow.Links.Discord = "Discord.gg/isnow"
Isnow.Storage.FileName = "Isnow_Key"

-- Existing Free/Premium key selector.
Isnow.Options.Keyless = false
Isnow.Options.KeylessUI = true

-- Premium whitelist access.
-- Both flags must be true for whitelist bypass to activate.
Isnow.Options.Premium = true
Isnow.Options.PremiumUI = true

-- Add any number of Roblox usernames, display names, or user IDs.
-- Matching is case-insensitive for names.
Isnow.Whitelist = {
    "IsnowScript7",
    "IsnowDev7",
    "Satoiri0",
    "Gabnibol09"
}

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

Isnow.Game = {
    GameID = "107778070777162",
    GameIcon = true,
    GameName = true
}

Isnow:SetChangelog({
    Enabled = true,
    Entries = {
        {
            Version = "2.5.0",
            Date = "Aug 21, 2026",
            Badge = "NEW",
            Image = "https://tr.rbxcdn.com/180DAY-79e666901b2c722b06310d267bc6c152/768/432/Image/Webp/noFilter",
            GameID = "107778070777162",
            GameName = true,
            GameIcon = true,
            Description = {
                "Added Premium whitelist access",
                "Added multiple whitelist username support",
                "Added Premium Granted bypass notification"
            },
            JoinLink = "https://www.roblox.com/games/107778070777162/Steal-An-Egg",
            JoinButton = true
        }
    }
})

Isnow.Callbacks.OnSuccess = function()
    local env = getgenv()
    local whitelisted = env.IsnowPremiumWhitelisted == true
    local isPremium = env.JD_IS_PREMIUM == true

    if whitelisted then
        print("[Isnow] Premium whitelist access granted.")
        -- Put your Premium script logic here.
        return
    end

    if isPremium then
        print("[Isnow] Premium key access granted.")
        -- Put your Premium script logic here.
    else
        print("[Isnow] Free/Standard key access granted.")
        -- Put your Free script logic here.
    end
end

Isnow.Callbacks.OnFail = function(reason)
    warn("[Isnow] Key validation failed: " .. tostring(reason))
end

Isnow.Callbacks.OnClose = function()
    print("[Isnow] Key window closed.")
end

Isnow:LaunchJunkie({
    Service = "Isnow Hub Key System V2-copy",
    Identifier = "1013791",
    Provider = "Isnow Key Workink"
})

return Isnow

-- Configuration summary:
-- Isnow.Options.Premium = true
-- Isnow.Options.PremiumUI = true
-- Isnow.Whitelist = {"IsnowScript7", "IsnowDev7"}
--
-- For non-whitelisted users, the normal Free/Premium Junkie flow remains active.
-- For a matching user, the UI grants Premium access immediately.
