local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
local gui = player:WaitForChild("PlayerGui")

local splashGui = Instance.new("ScreenGui")
splashGui.Name = "CelestialSplash"
splashGui.IgnoreGuiInset = true
splashGui.ResetOnSpawn = false
splashGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
splashGui.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 120)
frame.Position = UDim2.new(0.5, -130, 0.45, -60)
frame.BackgroundColor3 = Color3.fromRGB(10, 14, 30)
frame.BackgroundTransparency = 1
frame.ZIndex = 999
frame.Parent = splashGui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(120, 200, 255)
stroke.Thickness = 2
stroke.Transparency = 1

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "CELESTIAL"
text.Font = Enum.Font.GothamBlack
text.TextSize = 36
text.TextColor3 = Color3.fromRGB(140, 200, 255)
text.TextTransparency = 1
text.ZIndex = 1000
text.Parent = frame

-- Fade in
TweenService:Create(frame, TweenInfo.new(0.3), {
	BackgroundTransparency = 0
}):Play()

TweenService:Create(text, TweenInfo.new(0.3), {
	TextTransparency = 0
}):Play()

TweenService:Create(stroke, TweenInfo.new(0.3), {
	Transparency = 0.35
}):Play()

task.wait(1)

-- Fade out
TweenService:Create(frame, TweenInfo.new(0.3), {
	BackgroundTransparency = 1
}):Play()

TweenService:Create(text, TweenInfo.new(0.3), {
	TextTransparency = 1
}):Play()

TweenService:Create(stroke, TweenInfo.new(0.3), {
	Transparency = 1
}):Play()

task.wait(0.35)
splashGui:Destroy()
if getgenv().CelestialLoaded then return end
getgenv().CelestialLoaded = true
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
credit.Text = "Celestial V2  •  made by oscar"
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

-- =====================================
-- Scrollable Input Box
-- =====================================

-- Create scrolling frame for input box
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 460, 0, 140)
scrollFrame.Position = UDim2.new(0.5, -230, 0, 160)
scrollFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 32)
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 190, 255)
scrollFrame.Parent = mainFrame

-- Input box
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -10, 1, -10)
inputBox.Position = UDim2.new(0, 5, 0, 5)
inputBox.BackgroundTransparency = 1
inputBox.Text = ""
inputBox.ClearTextOnFocus = false
inputBox.MultiLine = true
inputBox.TextWrapped = true
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.TextYAlignment = Enum.TextYAlignment.Top
inputBox.TextSize = 15
inputBox.Font = Enum.Font.Code
inputBox.Parent = scrollFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputBox

-- Optional: clear on first focus
local firstFocus = true
inputBox.Focused:Connect(function()
	if firstFocus then
		inputBox.Text = ""
		firstFocus = false
	end
end)

-- Update canvas size dynamically
inputBox:GetPropertyChangedSignal("Text"):Connect(function()
	local textSize = inputBox.TextBounds.Y + 20
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(textSize, scrollFrame.AbsoluteSize.Y))
end)

-- =====================================
-- Drag Bar
-- =====================================
local dragBar = Instance.new("Frame")
dragBar.Name = "DragBar"
dragBar.Size = UDim2.new(1, 0, 0, 120)
dragBar.Position = UDim2.new(0, 0, 0, 0)
dragBar.BackgroundTransparency = 1
dragBar.BorderSizePixel = 0
dragBar.ZIndex = 50
dragBar.Parent = mainFrame

-- Dragging logic
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

-- =====================================
-- Bottom Control Bar
-- =====================================
local bottomBar = Instance.new("Frame")
bottomBar.Name = "BottomBar"
bottomBar.Size = UDim2.new(1, -24, 0, 50)
bottomBar.Position = UDim2.new(0, 12, 1, -56)
bottomBar.BackgroundColor3 = Color3.fromRGB(14, 18, 34)
bottomBar.BorderSizePixel = 0
bottomBar.ZIndex = 100
bottomBar.Parent = mainFrame

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
-- Settings button functionality
settings.MouseButton1Click:Connect(function()
    -- Prevent multiple panels
    if mainFrame:FindFirstChild("SettingsPanel") then return end

    -- Create Settings Panel
    local settingsPanel = Instance.new("Frame")
    settingsPanel.Name = "SettingsPanel"
    settingsPanel.Size = UDim2.new(0, 300, 0, 180)
    settingsPanel.Position = UDim2.new(0.5, -150, 0.5, -90)
    settingsPanel.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
    settingsPanel.BorderSizePixel = 0
    settingsPanel.ZIndex = 200
    settingsPanel.Parent = mainFrame

    local corner = Instance.new("UICorner", settingsPanel)
    corner.CornerRadius = UDim.new(0, 12)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Settings"
    title.TextColor3 = Color3.fromRGB(200, 230, 255)
    title.TextSize = 22
    title.Font = Enum.Font.GothamBold
    title.Parent = settingsPanel

    -- Terminate Button
    local terminateBtn = Instance.new("TextButton")
    terminateBtn.Size = UDim2.new(0, 200, 0, 60)
    terminateBtn.Position = UDim2.new(0.5, -100, 0.5, -30)
    terminateBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    terminateBtn.Text = "TERMINATE"
    terminateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    terminateBtn.TextSize = 24
    terminateBtn.Font = Enum.Font.GothamBlack
    terminateBtn.Parent = settingsPanel

    local btnCorner = Instance.new("UICorner", terminateBtn)
    btnCorner.CornerRadius = UDim.new(0, 12)

    terminateBtn.MouseEnter:Connect(function()
        terminateBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    end)

    terminateBtn.MouseLeave:Connect(function()
        terminateBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    end)

    terminateBtn.MouseButton1Click:Connect(function()
        -- Destroy the entire Celestial UI
        if screenGui then
            screenGui:Destroy()
        end
        getgenv().CelestialLoaded = false
        warn("Celestial terminated")
    end)
end)
print("Celestial UI loaded • made by oscar")
