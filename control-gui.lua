-- Control Europe GUI المطور | By Ahmed 🎯
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Anti-AFK
pcall(function()
	local vu = game:GetService("VirtualUser")
	LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end)
end)

-- GUI Setup
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "ControlEuropeGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 320)
frame.Position = UDim2.new(0.5, -160, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Text = "⚔️ Control Europe Hub ⚔️"
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local function createButton(txt, posY, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Text = txt
	btn.Size = UDim2.new(0.9, 0, 0, 30)
	btn.Position = UDim2.new(0.05, 0, posY, 0)
	btn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.Font = Enum.Font.SourceSansBold
	btn.MouseButton1Click:Connect(callback)
end

-- Tabs
createButton("📜 فتح Diplomacy", 0.15, function()
	print("Diplomacy Tab Opened (محاكاة)")
end)

createButton("🎁 فتح Support", 0.28, function()
	print("Support Tab Opened (محاكاة)")
end)

createButton("🔬 فتح Technology", 0.41, function()
	print("Technology Tab Opened (محاكاة)")
end)

-- Auto Recruit
createButton("⚔️ تجنيد تلقائي", 0.54, function()
	print("بدأ التجنيد التلقائي...")
	-- اكتب الكود الحقيقي لو اللعبة بتدعم التجنيد بـ Remote
end)

-- WalkSpeed
local speedBox = Instance.new("TextBox", frame)
speedBox.PlaceholderText = "🏃‍♂️ سرعة اللاعب (مثلاً 20)"
speedBox.Size = UDim2.new(0.9, 0, 0, 30)
speedBox.Position = UDim2.new(0.05, 0, 0.67, 0)
speedBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.Font = Enum.Font.SourceSans
speedBox.TextScaled = true

speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if val then
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = val
			print("تم تغيير السرعة إلى:", val)
		end
	end
end)

-- Exit
createButton("❌ إغلاق", 0.83, function()
	gui:Destroy()
end)
