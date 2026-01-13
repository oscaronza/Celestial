if getgenv().CelestialLoaded then return end
getgenv().CelestialLoaded = true

warn("Celestial loaded")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- Main UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CelestialUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = gui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 520, 0, 340)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 22)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = mainFrame

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 22, 38)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(12, 16, 32)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 24))
}
uiGradient.Rotation = 45
uiGradient.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(80, 180, 255)
uiStroke.Transparency = 0.4
uiStroke.Thickness = 2
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = mainFrame

-- Logo
local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(0, 180, 0, 80)
logoFrame.Position = UDim2.new(0.5, -90, 0, 25)
logoFrame.BackgroundTransparency = 1
logoFrame.Parent = mainFrame

local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "CELESTIAL"
logoText.TextColor3 = Color3.fromRGB(140, 200, 255)
logoText.TextSize = 48
logoText.Font = Enum.Font.GothamBlack
logoText.TextXAlignment = Enum.TextXAlignment.Center
logoText.TextYAlignment = Enum.TextYAlignment.Center
logoText.Parent = logoFrame

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = Color3.fromRGB(100, 220, 255)
logoStroke.Thickness = 2.5
logoStroke.Transparency = 0.3
logoStroke.Parent = logoText

local logoShadow = logoText:Clone()
logoShadow.TextColor3 = Color3.fromRGB(60, 140, 255)
logoShadow.Position = UDim2.new(0, 2, 0, 2)
logoShadow.TextTransparency = 0.4
logoShadow.ZIndex = logoText.ZIndex - 1
logoShadow.Parent = logoFrame

-- Credit
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(0, 200, 0, 30)
credit.Position = UDim2.new(0.5, -100, 0, 110)
credit.BackgroundTransparency = 1
credit.Text = "Celestial V.1  •  made by oscar"
credit.TextColor3 = Color3.fromRGB(140, 200, 255)
credit.TextSize = 16
credit.Font = Enum.Font.GothamSemibold
credit.TextXAlignment = Enum.TextXAlignment.Center
credit.Parent = mainFrame

local underline = Instance.new("Frame")
underline.Size = UDim2.new(0, 140, 0, 2)
underline.Position = UDim2.new(0.5, -70, 0, 138)
underline.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
underline.BorderSizePixel = 0
underline.Parent = mainFrame

local underlineGradient = Instance.new("UIGradient")
underlineGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 140, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 220, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 140, 255))
}
underlineGradient.Parent = underline

-- Input box
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 460, 0, 140)
inputBox.Position = UDim2.new(0.5, -230, 0, 160)
inputBox.BackgroundColor3 = Color3.fromRGB(15, 18, 32)
inputBox.BorderSizePixel = 0
inputBox.TextColor3 = Color3.fromRGB(220, 230, 255)
inputBox.PlaceholderColor3 = Color3.fromRGB(100, 120, 180)
inputBox.PlaceholderText = "-- paste your script here..."
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.TextYAlignment = Enum.TextYAlignment.Top
inputBox.ClearTextOnFocus = false
inputBox.MultiLine = true
inputBox.TextSize = 15
inputBox.Font = Enum.Font.Code
inputBox.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputBox

-- Execute button
local execButton = Instance.new("TextButton")
execButton.Size = UDim2.new(0, 140, 0, 46)
execButton.Position = UDim2.new(0.5, -70, 1, -70)
execButton.BackgroundColor3 = Color3.fromRGB(40, 90, 220)
execButton.BorderSizePixel = 0
execButton.Text = "EXECUTE"
execButton.TextColor3 = Color3.fromRGB(235, 245, 255)
execButton.TextSize = 18
execButton.Font = Enum.Font.GothamBold
execButton.Parent = mainFrame

local execCorner = Instance.new("UICorner")
execCorner.CornerRadius = UDim.new(0, 10)
execCorner.Parent = execButton

local execStroke = Instance.new("UIStroke")
execStroke.Color = Color3.fromRGB(120, 200, 255)
execStroke.Thickness = 1.5
execStroke.Transparency = 0.5
execStroke.Parent = execButton

-- ────────────────────────────────────────────────
-- Drag bar
local dragBar = Instance.new("Frame")
dragBar.Name = "DragBar"
dragBar.Size = UDim2.new(1, 0, 0, 120)
dragBar.Position = UDim2.new(0, 0, 0, 0)
dragBar.BackgroundTransparency = 1
dragBar.BorderSizePixel = 0
dragBar.ZIndex = 50
dragBar.Parent = mainFrame

-- wait for AbsoluteSize to be ready
if mainFrame.AbsoluteSize.X == 0 then
	mainFrame:GetPropertyChangedSignal("AbsoluteSize"):Wait()
end

local dragging = false
local dragStart = nil
local startPos = nil

local function updateDrag(input)
	local delta = input.Position - dragStart
	local newX = startPos.X.Offset + delta.X
	local newY = startPos.Y.Offset + delta.Y

	local screen = workspace.CurrentCamera.ViewportSize
	newX = math.clamp(newX, 0, screen.X - mainFrame.AbsoluteSize.X)
	newY = math.clamp(newY, 0, screen.Y - mainFrame.AbsoluteSize.Y)

	mainFrame.Position = UDim2.new(0, newX, 0, newY)
end

dragBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

-- ────────────────────────────────────────────────
-- Stars
local starFolder = Instance.new("Folder")
starFolder.Name = "Stars"
starFolder.Parent = mainFrame

local stars = {}
for i = 1, 50 do
	local size = math.random(4, 10)
	local star = Instance.new("Frame")
	star.Size = UDim2.new(0, size, 0, size)
	star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	star.BackgroundTransparency = 0.3 + math.random() * 0.4
	star.BorderSizePixel = 0
	star.ZIndex = 0
	star.Parent = starFolder

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = star

	local x = math.random() * 0.9 + 0.05
	local y = math.random() * 0.7 + 0.05
	star.Position = UDim2.new(x, 0, y, 0)

	local fadeTween = TweenService:Create(star, TweenInfo.new(5 + math.random()*5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		BackgroundTransparency = 0.5 + math.random()*0.3
	})
	fadeTween:Play()

	stars[#stars+1] = {frame = star, dx = math.random(-5,5)/5000, dy = math.random(-4,4)/5000}
end

-- Drift stars safely
RunService.Heartbeat:Connect(function()
	for _, s in pairs(stars) do
		local f = s.frame
		local nx = math.clamp(f.Position.X.Scale + s.dx, 0, 1)
		local ny = math.clamp(f.Position.Y.Scale + s.dy, 0, 1)
		f.Position = UDim2.new(nx, 0, ny, 0)
	end
end)
-- ────────────────────────────────────────────────
-- Bottom Control Bar (Merged & Fixed)

-- Adjust input box so bar is visible
inputBox.Size = UDim2.new(0, 460, 0, 120)
inputBox.Position = UDim2.new(0.5, -230, 0, 160)

-- Hide old execute button
execButton.Visible = false

-- Allow UI to render above
mainFrame.ClipsDescendants = false

-- Bottom bar
local bottomBar = Instance.new("Frame")
bottomBar.Name = "BottomBar"
bottomBar.Size = UDim2.new(1, -24, 0, 50)
bottomBar.Position = UDim2.new(0, 12, 1, -56)
bottomBar.BackgroundColor3 = Color3.fromRGB(14, 18, 34)
bottomBar.BorderSizePixel = 0
bottomBar.ZIndex = 100
bottomBar.Parent = mainFrame

-- Styling
local corner = Instance.new("UICorner", bottomBar)
corner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", bottomBar)
stroke.Color = Color3.fromRGB(100, 190, 255)
stroke.Transparency = 0.5
stroke.Thickness = 1

local gradient = Instance.new("UIGradient", bottomBar)
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 24, 46)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 14, 28))
}
gradient.Rotation = 90

-- Button layout
local layout = Instance.new("UIListLayout", bottomBar)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Padding = UDim.new(0, 12)

-- Button factory
local function btn(icon)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 42, 0, 42)
	b.Text = icon
	b.Font = Enum.Font.GothamBold
	b.TextSize = 18
	b.TextColor3 = Color3.fromRGB(200, 230, 255)
	b.BackgroundColor3 = Color3.fromRGB(22, 28, 55)
	b.BorderSizePixel = 0
	b.ZIndex = 101
	b.AutoButtonColor = false

	local c = Instance.new("UICorner", b)
	c.CornerRadius = UDim.new(0, 10)

	local s = Instance.new("UIStroke", b)
	s.Color = Color3.fromRGB(120, 200, 255)
	s.Transparency = 0.65
	s.Thickness = 1

	b.MouseEnter:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.12), {
			BackgroundColor3 = Color3.fromRGB(36, 48, 90)
		}):Play()
	end)

	b.MouseLeave:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.12), {
			BackgroundColor3 = Color3.fromRGB(22, 28, 55)
		}):Play()
	end)

	return b
end

-- Create buttons
local run = btn("▶")
local clear = btn("🧹")
local open = btn("📂")
local save = btn("💾")
local settings = btn("⚙")

-- Parent buttons
for _, b in ipairs({run, clear, open, save, settings}) do
	b.Parent = bottomBar
end

-- Button functionality
run.MouseButton1Click:Connect(function()
	if inputBox.Text ~= "" then
		local ok, err = pcall(function()
			loadstring(inputBox.Text)()
		end)
		if not ok then warn("Celestial Error:", err) end
	end
end)

clear.MouseButton1Click:Connect(function()
	inputBox.Text = ""
end)

open.MouseButton1Click:Connect(function()
	print("Open pressed (executor FS hook)")
end)

save.MouseButton1Click:Connect(function()
	print("Save pressed (executor FS hook)")
end)

settings.MouseButton1Click:Connect(function()
	print("Settings pressed")
end)
print("Celestial UI loaded • made by oscar ")
