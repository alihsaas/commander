local module, Elements, Latte, Page = {}, nil, nil, nil

module.prepare = function()
	local Top = Instance.new("Frame")
	Top.BackgroundTransparency = 1
	Top.Name = "Top"
	Top.Size = UDim2.new(1, 0, 0, 125)
	Top.Parent = Page

	local Background = Instance.new("ImageLabel")
	Background.BackgroundTransparency = 1
	Background.Image = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png"
	Background.Name = "Background"
	Background.ScaleType = Enum.ScaleType.Crop
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Parent = Top

	local Container = Instance.new("Frame")
	Container.BackgroundTransparency = 1
	Container.Name = "Container"
	Container.Size = UDim2.new(1, 0, 1, 0)
	Container.ZIndex = 2
	Container.Parent = Top

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(1, 1)
	}
	UIGradient.Parent = Background

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Parent = Container

	local Avatar = Instance.new("Frame")
	Avatar.AnchorPoint = Vector2.new(0.5, 0.5)
	Avatar.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
	Avatar.BorderSizePixel = 0
	Avatar.Name = "Avatar"
	Avatar.Position = UDim2.new(0.5, 0, 0.5, 0)
	Avatar.Size = UDim2.new(0, 50, 0, 50)
	Avatar.ZIndex = 2
	Avatar.Parent = Container

	local Title = Instance.new("TextLabel")
	Title.BackgroundTransparency = 1
	Title.Font = Enum.Font.Gotham
	Title.LayoutOrder = 1
	Title.Name = "Title"
	Title.Size = UDim2.new(1, 0, 0, 22)
	Title.Text = Latte.Modules.Services.Players.LocalPlayer.Name
	Title.TextColor3 = Color3.fromRGB(0, 0, 0)
	Title.TextSize = 18
	Title.TextYAlignment = Enum.TextYAlignment.Bottom
	Title.Parent = Container

	local Subtitle = Instance.new("TextLabel")
	Subtitle.BackgroundTransparency = 1
	Subtitle.Font = Enum.Font.GothamSemibold
	Subtitle.LayoutOrder = 2
	Subtitle.Name = "Subtitle"
	Subtitle.Size = UDim2.new(1, 0, 0, 14)
	Subtitle.Text = "Administrator"
	Subtitle.TextColor3 = Color3.fromRGB(120, 120, 120)
	Subtitle.TextSize = 12
	Subtitle.TextWrapped = true
	Subtitle.Parent = Container

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Avatar

	local Backdrop = Instance.new("Frame")
	Backdrop.AnchorPoint = Vector2.new(0.5, 0.5)
	Backdrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Backdrop.BorderSizePixel = 0
	Backdrop.Name = "Backdrop"
	Backdrop.Position = UDim2.new(0.5, 0, 0.5, 0)
	Backdrop.Size = UDim2.new(1, -2, 1, -2)
	Backdrop.ZIndex = 2
	Backdrop.Parent = Avatar

	local Icon = Instance.new("ImageLabel")
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundTransparency = 1
	Icon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. Latte.Modules.Services.Players.LocalPlayer.UserId .. "&w=420&h=420"
	Icon.Name = "Icon"
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.ScaleType = Enum.ScaleType.Fit
	Icon.Size = UDim2.new(1, -2, 1, -2)
	Icon.ZIndex = 2
	Icon.Parent = Avatar

	local UICorner2 = Instance.new("UICorner")
	UICorner2.CornerRadius = UDim.new(1, 0)
	UICorner2.Parent = Backdrop

	local UICorner3 = Instance.new("UICorner")
	UICorner3.CornerRadius = UDim.new(1, 0)
	UICorner3.Parent = Icon
	
	local Server = Latte.Components.SeparatedList.new("Server", "SERVER STATS", Page)
	Server.Items["Players count"] = "1"
	Server.Items["Administrators ingame"] = "1"
	Server.Items["Server uptime"] = "00:00"
	
	local System = Latte.Components.SeparatedList.new("System", "SYSTEM STATS", Page)
	System.Items["Modules loaded"] = "0"
	System.Items["Versison"] = "Commander ft. Latte"
end

module.setup = function()
	Elements = module.Elements
	Latte = module.Latte
	Page = Latte.Components.Page.new("Home", Elements.Panel.Container.Body)
	Latte.Constructors.Menu.newButton("Home", 1)
	module.prepare()
end

return module