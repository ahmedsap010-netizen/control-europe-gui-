-- Control Europe GUI Helper | تطوير: أحمد 🎯
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Anti-AFK حماية
pcall(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- GUI
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "ControlEuropeHelper"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 230)
frame.Position = UDim2.new(0.5, -150, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Text = "🎯 Control Europe GUI"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Text = text
    btn.Size = UDim2.new(0.9, 0, 0, 30)
    btn.Position = UDim2.new(0.05, 0, posY, 0)
    btn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSansBold
    btn.MouseButton1Click:Connect(callback)
end

createButton("📜 فتح Diplomacy", 0.25, function()
    print("Simulate opening Diplomacy Tab")
end)

createButton("🎁 فتح Support", 0.45, function()
    print("Simulate opening Support Tab")
end)

createButton("🔬 فتح Technology", 0.65, function()
    print("Simulate opening Technology Tab")
end)

createButton("❌ إغلاق", 0.85, function()
    gui:Destroy()
end)
