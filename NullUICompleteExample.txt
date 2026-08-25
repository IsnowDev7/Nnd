--[[
	NullUI - Complete Example Usage

	This file demonstrates the UI library only. It contains no game-specific
	logic, remotes, modules, reach, automation, or private credentials.

	Replace LIBRARY_URL if you host the library somewhere else.
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local LIBRARY_URL = "https://raw.githubusercontent.com/IsnowDev7/Nnd/main/NullUI.lua"

-- Cleanly removes an older copy when the example is executed again.
if getgenv().__NullUI_Unload then
	pcall(getgenv().__NullUI_Unload)
end

local NullUI = loadstring(game:HttpGet(LIBRARY_URL))()

NullUI:PreloadIcons({ "Lucide", "Material", "Phosphor", "SF" })
NullUI:SetScaleRange(0.75, 1.35)

local Window = NullUI:CreateWindow({
	Title = "NullUI",
	Subtitle = "Complete Example Usage",
	Icon = "Lucide:panels-top-left",
	Size = UDim2.fromOffset(560, 390),
	MinSize = Vector2.new(460, 330),
	Draggable = true,
	Resizable = true,
	BlurBackground = true,
	Glow = {
		Enabled = true,
		Color = Color3.fromRGB(0, 0, 0),
		Thickness = 2,
		Transparency = 0.35,
	},
	SidebarPanel = true,
	HomeIcon = "Lucide:house",
	SidebarURL = "rbxassetid://6031075931",
	-- Icon also accepts a Roblox asset id or supported HTTPS image URL:
	-- Icon = "https://your-cdn.example/window-icon.png",
	-- Use one background alternative at a time. Image uses ScaleType.Fit:
	-- BackgroundImage = "https://your-cdn.example/window-background.jpg",
	-- BackgroundImageTransparency = 0.82,
	-- BackgroundVideo accepts raw GitHub HTTPS .webm only and requires getcustomasset support:
	-- BackgroundVideo = "https://raw.githubusercontent.com/your-user/your-repo/main/background.webm",
	-- BackgroundVideoTransparency = 0.82,
	-- BackgroundVideoLooped = true,
	-- BackgroundVideoAutoplay = true,
	-- BackgroundVideoMuted = true,
	-- BackgroundVideoPlaybackSpeed = 1,
	-- BackgroundVideoVolume = 0,
	-- BackgroundVideoTimePosition = 0,
	-- BackgroundVideoFallbackImage = "https://your-cdn.example/video-fallback.jpg",
	Description = "This is example only",
	DefaultTab = "Home",
	ToggleKeybind = Enum.KeyCode.RightShift,
})

local function notify(title, text, kind)
	NullUI:Notify({
		Title = title,
		Text = text,
		Type = kind or "info", -- info, success, warning, error
		Duration = 4,
	})
end

-- SidebarPanel is configured in CreateWindow. SidebarURL accepts an asset id or supported HTTPS image source.

-- ============================================================
-- Dock buttons and built-in panels
-- ============================================================

Window:AddDockButton({
	Name = "ExampleInfo",
	Icon = "Lucide:info",
	Callback = function()
		notify("Example Usage", "Right Shift toggles the window.", "info")
	end,
})

Window:AddDefaultCreditsPanel()

-- ============================================================
-- Main tabs
-- ============================================================

local Tabs = {
	Home = Window:AddTab({ Name = "Home", Icon = "Lucide:house" }),
	Components = Window:AddTab({ Name = "Components", Icon = "Lucide:blocks" }),
	Forms = Window:AddTab({ Name = "Forms", Icon = "Lucide:list-checks" }),
	Data = Window:AddTab({ Name = "Data", Icon = "Lucide:database" }),
	Configs = Window:AddTab({ Name = "Configs", Icon = "Lucide:save" }),
}

-- Adds a visual separator to the sidebar. It can also be placed between tabs.
Window:AddTabLine()

-- Private tabs are UI privacy only; never treat a client-side password as security.
local PrivateExample = Window:AddPrivateTab({
	Name = "Private Example",
	Icon = "Lucide:lock-keyhole",
	Password = "example",
	GlowColor = Color3.fromRGB(205, 215, 210),
})

PrivateExample:AddParagraph({
	Title = "Private Tab Unlocked",
	Icon = "Lucide:unlock",
	Text = "The example password is: example. The optional Remember Me setting is handled by the library.",
})

PrivateExample:AddButton({
	Text = "Private action",
	Icon = "Lucide:key-round",
	Callback = function()
		notify("Private tab", "The private example action was clicked.", "success")
	end,
})

-- A PanelTab is hidden from the sidebar and is normally opened by a dock button.
local ExamplePanelDock
local ExamplePanel = Window:AddPanelTab({
	Name = "Quick Panel",
	Icon = "Lucide:panel-right-open",
	OnToggle = function(open)
		if ExamplePanelDock then ExamplePanelDock:SetActive(open) end
	end,
})

ExamplePanel.Tab:AddParagraph({
	Title = "Hidden Panel Tab",
	Icon = "Lucide:panel-right",
	Text = "This page was created with AddPanelTab and opened from the dock.",
})

ExamplePanel.Tab:AddButton({
	Text = "Close this panel",
	Icon = "Lucide:x",
	Callback = function() ExamplePanel:Close() end,
})

ExamplePanelDock = Window:AddDockButton({
	Name = "QuickPanel",
	Icon = "Lucide:panel-right-open",
	Callback = function() ExamplePanel:Toggle() end,
})

-- ============================================================
-- HOME
-- ============================================================

local Overview = Tabs.Home:AddSubTab({
	Name = "Overview",
	Icon = "Lucide:layout-grid",
})

local Changelog = Tabs.Home:AddSubTab({
	Name = "Changelog",
	Icon = "Lucide:file-text",
})

Overview:AddCard({
	UserId = LocalPlayer.UserId,
	Title = "Hello, " .. LocalPlayer.DisplayName,
	Description = "This is a safe demonstration of the complete UI library.",
	ButtonText = "Show notification",
	ButtonCallback = function()
		notify("Welcome", "The example is working correctly.", "success")
	end,
	Rating = {
		Title = "Rate this interface",
		Placeholder = "Optional feedback...",
		Callback = function(stars, message)
			notify("Rating received", tostring(stars) .. " stars - " .. message, "success")
		end,
	},
})

	Overview:AddSystemInfoGrid({
		Description = "Live client information supplied by the library.",
	})

	Overview:AddParagraph({
		Title = "Sidebar image preview",
		Text = "Click the image in the left panel to open a centered 16:9 preview. Tap outside the preview or on the image to close it.",
		Icon = "Lucide:scan-search",
	})

local RuntimeInfo = Overview:AddInfoGrid({
	Title = "Example State",
	Description = "Values in an info grid can be changed at runtime.",
	Columns = 2,
	Items = {
		{ Label = "Status", Value = "Ready" },
		{ Label = "Theme", Value = "Acrylic" },
		{ Label = "Controls", Value = "Enabled" },
		{ Label = "Profile", Value = "Example" },
	},
})

Overview:AddButton({
	Text = "Update info grid",
	Description = "Demonstrates SetValue on an existing component.",
	Icon = "Lucide:refresh-cw",
	Callback = function()
		RuntimeInfo:SetValue("Status", "Updated at " .. os.date("%H:%M:%S"))
		notify("Grid updated", "The Status value was changed.", "success")
	end,
})

Changelog:AddChangelogEntry({
	Version = "Version 2.0",
	Date = os.date("%d/%m/%Y"),
	Changes = {
		{ Type = "Added", Text = "Complete example usage" },
		{ Type = "Changed", Text = "Improved acrylic toggle design" },
		{ Type = "Fixed", Text = "Card scrolling and action buttons" },
	},
})

Changelog:AddChangelogEntry({
	Version = "Version 1.0",
	Changes = {
		{ Type = "Added", Text = "Initial interface" },
	},
})

-- ============================================================
-- COMPONENTS
-- ============================================================

local Basic = Tabs.Components:AddSubTab({ Name = "Basic", Icon = "Lucide:component" })
local Dialogs = Tabs.Components:AddSubTab({ Name = "Dialogs", Icon = "Lucide:message-square" })
local Cards = Tabs.Components:AddSubTab({ Name = "Cards", Icon = "Lucide:panels-top-left" })

Basic:AddSection({ Text = "Text components", Icon = "Lucide:type" })

Basic:AddParagraph({
	Title = "Paragraph Example",
	Description = "Yooooo. Image is optional. Use Image with a Roblox asset id or supported HTTPS image source.",
	Image = "rbxassetid://6031075931",
	ImageHeight = 96,
})

Basic:AddHoldButton({
	Text = "Hold to confirm",
	Description = "Keep the button pressed until the progress bar completes.",
	Icon = "Lucide:hand",
	HoldTime = 1.8,
	Callback = function()
		notify("Hold button", "The countdown completed.", "success")
	end,
})

local CustomFrame = Instance.new("Frame")
CustomFrame.Name = "ExampleCustomFrame"
CustomFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
CustomFrame.BorderSizePixel = 0

local CustomText = Instance.new("TextLabel")
CustomText.Name = "ExampleCustomText"
CustomText.BackgroundTransparency = 1
CustomText.Size = UDim2.fromScale(1, 1)
CustomText.Font = Enum.Font.Gotham
CustomText.Text = "Custom Frame and TextLabel"
CustomText.TextColor3 = Color3.fromRGB(245, 245, 245)
CustomText.TextSize = 14
CustomText.Parent = CustomFrame

Basic:AddCustom(CustomFrame, {
	Name = "CustomInstance",
	Height = 46,
	Fill = true,
})

Basic:AddLabel("Create Roblox instances directly, then pass the finished Frame to AddCustom.")

local DynamicLabel = Basic:AddLabel("A simple label. Its text can be changed later.")

Basic:AddParagraph({
	Title = "Paragraph",
	Icon = "Lucide:align-left",
	Text = "Paragraphs support a title, icon, wrapped text, Set, Get and Destroy.",
})

Basic:AddDivider()
Basic:AddLineText("Actions")

Basic:AddButton({
	Text = "Standard button",
	Description = "Click to update the label above.",
	Icon = "Lucide:mouse-pointer-click",
	Callback = function()
		DynamicLabel:Set("The button was clicked at " .. os.date("%H:%M:%S"))
	end,
})

Basic:AddRating({
	Title = "Standalone rating",
	Default = 0,
	MaxStars = 5,
	Placeholder = "Write something...",
	ButtonIcon = "Lucide:send",
	Callback = function(stars, message)
		notify("Feedback", string.format("Stars: %d | Text: %s", stars, message), "success")
	end,
})

Dialogs:AddSection({ Text = "Notifications", Icon = "Lucide:bell" })

for _, data in ipairs({
	{ "Info notification", "info" },
	{ "Success notification", "success" },
	{ "Warning notification", "warning" },
	{ "Error notification", "error" },
}) do
	Dialogs:AddButton({
		Text = data[1],
		Icon = "Lucide:bell-ring",
		Callback = function()
			notify(data[1], "This is a " .. data[2] .. " notification.", data[2])
		end,
	})
end

Dialogs:AddButton({
	Text = "Custom notification",
	Description = "Uses a custom icon and color.",
	Icon = "Phosphor:sparkle",
	Callback = function()
		NullUI:Notify({
			Title = "Custom style",
			Text = "Notifications may override their icon and color.",
			Icon = "Phosphor:sparkle",
			Color = Color3.fromRGB(175, 205, 195),
			Duration = 5,
		})
	end,
})

Dialogs:AddLineText("Dialogs")

Dialogs:AddButton({
	Text = "Open confirmation",
	Description = "Returns true when Confirm is pressed.",
	Icon = "Lucide:circle-help",
	Callback = function()
		NullUI:Confirm({
			Window = Window,
			Title = "Confirm this action?",
			Text = "This example does not change anything important.",
			ConfirmText = "Confirm",
			CancelText = "Cancel",
			Callback = function(confirmed)
				notify("Confirmation", confirmed and "Confirmed." or "Cancelled.", confirmed and "success" or "warning")
			end,
		})
	end,
})

Dialogs:AddButton({
	Text = "Open form modal",
	Description = "Text, textarea and comma-separated tags.",
	Icon = "Lucide:clipboard-pen-line",
	Callback = function()
		NullUI:Modal({
			Window = Window,
			Title = "Create an example item",
			Text = "Fill in the fields below.",
			ConfirmText = "Create",
			CancelText = "Cancel",
			Fields = {
				{ Key = "name", Label = "Name", Placeholder = "Example name", MaxLength = 40 },
				{ Key = "description", Type = "textarea", Label = "Description", Placeholder = "Description...", MaxLength = 180 },
				{ Key = "tags", Type = "tags", Label = "Tags", Placeholder = "ui, example, acrylic" },
			},
			Callback = function(confirmed, values)
				if confirmed then
					notify("Item created", "Name: " .. tostring(values.name), "success")
				end
			end,
		})
	end,
})

Cards:AddSection({ Text = "Card styles", Icon = "Lucide:panel-top" })

Cards:AddCard({
	Image = "Lucide:sparkles",
	Title = "Standard card",
	Description = "Cards may have an image, description and click callback.",
	Callback = function()
		notify("Card", "The standard card was clicked.", "info")
	end,
})

Cards:AddGradientCard({
	Title = "Gradient card",
	Description = "A highlighted action card.",
	ColorA = Color3.fromRGB(75, 92, 88),
	ColorB = Color3.fromRGB(31, 45, 41),
	Callback = function()
		notify("Gradient card", "Gradient action executed.", "success")
	end,
})

Cards:AddLoadoutGroup({
	Title = "Example loadout",
	Color = Color3.fromRGB(205, 215, 210),
	Icons = { "Lucide:shield", "Lucide:sword", "Lucide:package" },
	ButtonText = "Select loadout",
	Callback = function()
		notify("Loadout", "Example loadout selected.", "success")
	end,
})

-- ============================================================
-- FORMS / FLAGGED CONTROLS
-- ============================================================

local Inputs = Tabs.Forms:AddSubTab({ Name = "Inputs", Icon = "Lucide:sliders-horizontal" })
local Selection = Tabs.Forms:AddSubTab({ Name = "Selection", Icon = "Lucide:list-filter" })

Inputs:AddLineText("Settings")

local EnabledToggle = Inputs:AddToggle({
	Text = "Enable example",
	Description = "The redesigned off state uses the acrylic theme.",
	Icon = "Lucide:power",
	Default = false,
	Flag = "ExampleEnabled",
	Callback = function(value)
		notify("Toggle", value and "Enabled" or "Disabled", value and "success" or "info")
	end,
})

local LockedToggle = Inputs:AddToggle({
	Text = "Locked toggle",
	Description = "SetLocked controls whether the user can change it.",
	Icon = "Lucide:lock",
	Default = true,
	Flag = "ExampleLockedToggle",
	Locked = true,
})

local AmountSlider = Inputs:AddSlider({
	Text = "Example amount",
	Description = "Supports range, increments and suffixes.",
	Icon = "Lucide:gauge",
	Min = 0,
	Max = 100,
	Increment = 5,
	Default = 50,
	Suffix = "%",
	Flag = "ExampleAmount",
	Callback = function(value)
		-- Use the value in your own code here.
	end,
})

local NameTextbox = Inputs:AddTextbox({
	Text = "Display name",
	Description = "Callback fires when focus is lost.",
	Icon = "Lucide:text-cursor-input",
	Placeholder = "Type a name...",
	Default = "Example",
	Flag = "ExampleName",
	Callback = function(text, enterPressed)
		if enterPressed then
			notify("Textbox", "Submitted: " .. text, "success")
		end
	end,
})

local AccentPicker = Inputs:AddColorPicker({
	Text = "Example color",
	Description = "HSV, RGB and HEX picker.",
	Icon = "Lucide:palette",
	Default = Color3.fromRGB(180, 205, 195),
	Flag = "ExampleColor",
	Callback = function(color)
		-- color is a Color3 value.
	end,
})

local ActionKey = Inputs:AddKeybind({
	Text = "Example keybind",
	Description = "Click the key field and press a key. Backspace clears it.",
	Icon = "Lucide:keyboard",
	Default = Enum.KeyCode.K,
	Flag = "ExampleKeybind",
	Callback = function(key, mode)
		if mode == "press" then
			notify("Keybind", (key and key.Name or "None") .. " was pressed.", "info")
		elseif mode == "bind" then
			notify("Keybind changed", key and key.Name or "None", "success")
		end
	end,
})

Inputs:AddButton({
	Text = "Change controls through their API",
	Icon = "Lucide:code-xml",
	Callback = function()
		EnabledToggle:Set(true)
		AmountSlider:Set(75)
		NameTextbox:Set("Changed by API")
		AccentPicker:Set(Color3.fromRGB(155, 190, 175))
		ActionKey:Set(Enum.KeyCode.L)
	end,
})

Inputs:AddButton({
	Text = "Unlock the locked toggle",
	Icon = "Lucide:unlock",
	Callback = function()
		LockedToggle:SetLocked(false)
		notify("Control unlocked", "The locked toggle can now be changed.", "success")
	end,
})

Selection:AddLineText("Dropdowns")

Selection:AddDropdown({
	Text = "Single selection",
	Description = "Select one option.",
	Icon = "Lucide:list",
	Options = { "First", "Second", "Third" },
	Default = "Second",
	Flag = "ExampleSingleDropdown",
	Callback = function(value)
		notify("Dropdown", "Selected: " .. tostring(value), "info")
	end,
})

Selection:AddDropdown({
	Text = "Multiple selection",
	Description = "Select any number of options.",
	Icon = "Lucide:list-checks",
	Options = { "Alpha", "Beta", "Gamma", "Delta" },
	Default = { "Alpha", "Gamma" },
	MultiSelect = true,
	Flag = "ExampleMultiDropdown",
	Callback = function(values)
		-- values is an array of selected option names.
	end,
})

-- ============================================================
-- DATA COMPONENTS
-- ============================================================

local Tables = Tabs.Data:AddSubTab({ Name = "Table", Icon = "Lucide:table-2" })
local Grid = Tabs.Data:AddSubTab({ Name = "Card Grid", Icon = "Lucide:grid-2x2" })
local ConsoleTab = Tabs.Data:AddSubTab({ Name = "Console", Icon = "Lucide:terminal" })

local ExampleTable = Tables:AddTable({
	Title = "Example table",
	Description = "Click column headers to sort.",
	Height = 190,
	RowHeight = 30,
	Sortable = true,
	Striped = true,
	Columns = {
		{ Key = "Name", Label = "Name", Weight = 2 },
		{ Key = "Status", Label = "Status", Weight = 1, Align = "Center" },
		{ Key = "Value", Label = "Value", Weight = 1, Align = "Right" },
	},
	Rows = {
		{ Name = "Alpha", Status = "Ready", Value = 42 },
		{ Name = "Beta", Status = "Waiting", Value = 18 },
		{ Name = "Gamma", Status = "Ready", Value = 73 },
	},
})

Tables:AddButton({
	Text = "Replace table rows",
	Icon = "Lucide:refresh-cw",
	Callback = function()
		ExampleTable:SetRows({
			{ Name = "New row A", Status = "Online", Value = 100 },
			{ Name = "New row B", Status = "Offline", Value = 25 },
		})
	end,
})

local GridItems = {
	{
		Title = "Acrylic Preset",
		Description = "A compact card with two lines of description.",
		Byline = "updated just now",
		Icon = "Lucide:sparkles",
		Rating = 5,
		Downloads = 120,
		Created = 3,
	},
	{
		Title = "Performance Preset",
		Description = "An example optimized profile.",
		Byline = "updated 5m ago",
		Icon = "Lucide:gauge",
		Rating = 4,
		Downloads = 80,
		Created = 2,
	},
	{
		Title = "Minimal Preset",
		Description = "A clean and minimal example.",
		Byline = "updated 10m ago",
		Icon = "Lucide:box",
		Rating = 3,
		Downloads = 45,
		Created = 1,
	},
}

local ExampleGrid = Grid:AddCardGrid({
	Title = "Example cards",
	Height = 320,
	FixedHeight = true,
	Columns = 2,
	CardHeight = 112,
	CardMinWidth = 190,
	DescriptionHeight = 28,
	Search = true,
	SearchPlaceholder = "Search example cards...",
	Sorts = { "Top rated", "Most downloaded", "Newest" },
	DefaultSort = "Top rated",
	EmptyText = "No matching example cards.",
	Fetch = function(state)
		local results = {}
		local query = string.lower(state.Query or "")

		for _, original in ipairs(GridItems) do
			if query == "" or string.find(string.lower(original.Title), query, 1, true) then
				local item = table.clone(original)
				item.ActionIcon = "download"
				item.Callback = function()
					notify("Card loaded", item.Title, "success")
				end
				item.SecondaryIcon = "trash-2"
				item.SecondaryDanger = true
				item.SecondaryCallback = function()
					NullUI:Confirm({
						Window = Window,
						Title = "Delete " .. item.Title .. "?",
						Text = "This is only an example; nothing will actually be deleted.",
						ConfirmText = "Delete",
						Danger = true,
						Callback = function(confirmed)
							if confirmed then notify("Deleted", item.Title, "success") end
						end,
					})
				end
				item.Menu = {
					{
						Text = "View details",
						Icon = "Lucide:info",
						Callback = function()
							notify("Card details", item.Description, "info")
						end,
					},
					{
						Text = "Remove example",
						Icon = "Lucide:trash-2",
						Danger = true,
						Callback = function()
							notify("Menu action", "Danger-style menu action clicked.", "warning")
						end,
					},
				}
				item.Stats = {
					{ Icon = "thumbs-up", Text = tostring(item.Rating) },
					{ Icon = "download", Text = tostring(item.Downloads) },
				}
				table.insert(results, item)
			end
		end

		table.sort(results, function(a, b)
			if state.Sort == "Most downloaded" then return a.Downloads > b.Downloads end
			if state.Sort == "Newest" then return a.Created > b.Created end
			return a.Rating > b.Rating
		end)

		return results
	end,
})

Grid:AddButton({
	Text = "Refresh card grid",
	Icon = "Lucide:refresh-cw",
	Callback = function()
		ExampleGrid:Refresh()
	end,
})

local ExampleConsole = ConsoleTab:AddConsole({
	Title = "Example Console",
	Height = 245,
	MaxLogs = 100,
	AutoCapture = false,
})

ExampleConsole:Log("NullUI example loaded.", Enum.MessageType.MessageInfo)
ExampleConsole:Log("This is a warning example.", Enum.MessageType.MessageWarning)
ExampleConsole:Log("This is an error example.", Enum.MessageType.MessageError)

ConsoleTab:AddButton({
	Text = "Add console message",
	Icon = "Lucide:plus",
	Callback = function()
		ExampleConsole:Log("Message created at " .. os.date("%H:%M:%S"), Enum.MessageType.MessageOutput)
	end,
})

-- ============================================================
-- FLAGS, LOCAL CONFIGS AND SNAPSHOTS
-- ============================================================

local configName = "example-config"
local snapshot

Tabs.Configs:AddParagraph({
	Title = "Configuration API",
	Icon = "Lucide:save",
	Text = "Controls with a Flag are automatically included in saved configurations.",
})

Tabs.Configs:AddTextbox({
	Text = "Config name",
	Icon = "Lucide:file-pen-line",
	Default = configName,
	Placeholder = "example-config",
	Callback = function(text)
		if text ~= "" then configName = text end
	end,
})

local ConfigList = Tabs.Configs:AddLabel("Saved configs: loading...")

local function refreshConfigList()
	local configs, err = NullUI:ListConfigs()
	if err then
		ConfigList:Set("Saved configs unavailable: " .. tostring(err))
		return
	end
	local names = {}
	for _, config in ipairs(configs) do table.insert(names, config.Name) end
	ConfigList:Set(#names > 0 and ("Saved configs: " .. table.concat(names, ", ")) or "Saved configs: none")
end

Tabs.Configs:AddLineText("File actions")

Tabs.Configs:AddButton({
	Text = "Save current config",
	Icon = "Lucide:save",
	Callback = function()
		local ok, err = NullUI:SaveConfig(configName, {
			Description = "Created by NullUI example usage",
			Tags = { "example", "local" },
		})
		notify("Save config", ok and "Saved successfully." or tostring(err), ok and "success" or "error")
		refreshConfigList()
	end,
})

Tabs.Configs:AddButton({
	Text = "Load config",
	Icon = "Lucide:download",
	Callback = function()
		local ok, err = NullUI:LoadConfig(configName)
		notify("Load config", ok and "Loaded successfully." or tostring(err), ok and "success" or "error")
	end,
})

Tabs.Configs:AddButton({
	Text = "Delete config",
	Icon = "Lucide:trash-2",
	Callback = function()
		NullUI:Confirm({
			Window = Window,
			Title = "Delete '" .. configName .. "'?",
			Text = "This cannot be undone.",
			ConfirmText = "Delete",
			CancelText = "Cancel",
			Danger = true,
			Callback = function(confirmed)
				if not confirmed then return end
				local ok, err = NullUI:DeleteConfig(configName)
				notify("Delete config", ok and "Deleted successfully." or tostring(err), ok and "success" or "error")
				refreshConfigList()
			end,
		})
	end,
})

Tabs.Configs:AddLineText("Memory snapshot")

Tabs.Configs:AddButton({
	Text = "Create snapshot",
	Description = "Stores all current flagged values in memory.",
	Icon = "Lucide:camera",
	Callback = function()
		snapshot = NullUI:CreateSnapshot()
		notify("Snapshot", "Snapshot created.", "success")
	end,
})

Tabs.Configs:AddButton({
	Text = "Restore snapshot",
	Icon = "Lucide:history",
	Callback = function()
		if not snapshot then
			notify("Snapshot", "Create a snapshot first.", "warning")
			return
		end
		NullUI:RestoreSnapshot(snapshot)
		notify("Snapshot", "Snapshot restored.", "success")
	end,
})

refreshConfigList()

-- Direct flag access:
-- NullUI.Flags.ExampleEnabled:Get()
-- NullUI.Flags.ExampleEnabled:Set(true)
-- NullUI:GetConfig()
-- NullUI:SetConfig(data)
-- NullUI:ListUIElements()
-- Window:JumpToElement("Example amount")
-- Window:SelectTab("Forms")

-- ============================================================
-- OPTIONAL CLOUD + AI INTEGRATIONS
-- Disabled by default because they require your own endpoints/credentials.
-- Never hardcode a private API key in a public script.
-- ============================================================

local ENABLE_OPTIONAL_INTEGRATIONS = false

if ENABLE_OPTIONAL_INTEGRATIONS then
	local Cloud = NullUI:CloudService({
		BaseUrl = "https://YOUR-CLOUD-WORKER.example",
		Script = "NullUI Example",
	})

	local Assistant = NullUI:CreateAIAssistant({
		Providers = {{
			Name = "OpenRouter",
			Endpoint = "https://openrouter.ai/api/v1/chat/completions",
			ApiKey = "YOUR_OPENROUTER_API_KEY",
			Model = "openrouter/free",
		}},
		Window = Window,
		Persist = "nullui-example-assistant",
	})

	local ChatDock
	local ChatPanel = Window:AddChatPanel({
		Title = "Assistant",
		Icon = "bot",
		Placeholder = "Ask something...",
		OnToggle = function(open) if ChatDock then ChatDock:SetActive(open) end end,
		OnClear = function() Assistant:Reset() end,
		OnSend = function(panel, text) Assistant:Ask(panel, text) end,
		OnStop = function() Assistant:Stop() end,
		OnRegenerate = function(panel, text) Assistant:Ask(panel, text) end,
	})
	ChatDock = Window:AddDockButton({
		Icon = "Lucide:bot",
		Callback = function() ChatPanel:Toggle() end,
	})

	local CloudDock
	local CloudPanel = Window:AddCloudPanel({
		Service = Cloud,
		OnToggle = function(open) if CloudDock then CloudDock:SetActive(open) end end,
	})
	CloudDock = Window:AddDockButton({
		Icon = "Lucide:cloud",
		Callback = function() CloudPanel:Toggle() end,
	})

	local GlobalChatDock
	local GlobalChatPanel = Window:AddGlobalChatPanel({
		Service = Cloud,
		Icon = "messages-square",
		OnToggle = function(open) if GlobalChatDock then GlobalChatDock:SetActive(open) end end,
	})
	GlobalChatDock = Window:AddDockButton({
		Icon = "Lucide:messages-square",
		Callback = function() GlobalChatPanel:Toggle() end,
	})

	-- Cloud-backed widgets. These call the configured service periodically.
	local CloudWidgets = Window:AddTab({
		Name = "Cloud Widgets",
		Icon = "Lucide:cloud-cog",
	})

	CloudWidgets:AddActiveUsersGrid({
		Service = Cloud,
		Title = "Active Users",
		Description = "Devices currently using this script.",
		Interval = 30,
	})

	CloudWidgets:AddLeaderboard({
		Service = Cloud,
		Title = "Time Leaderboard",
		Description = "Cloud-backed usage leaderboard.",
		Limit = 5,
		Interval = 30,
		RevealByDefault = false,
	})
end

notify("NullUI loaded", "Complete example usage is ready.", "success")

-- Useful window methods:
-- Window:SetTitle("New title", "New subtitle")
-- Window:Toggle()
-- Window:Open()
-- Window:Close()
-- Window:ToggleFullscreen()
-- Window:IsOpen()
-- Window:Destroy()
-- NullUI:SetBlurEnabled(false)
-- NullUI:Unload()
