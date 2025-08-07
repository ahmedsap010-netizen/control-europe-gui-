-- Remote GUI Logger by RoboLOx
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI
local screen = Instance.new("ScreenGui", PlayerGui)
screen.Name = "RemoteLogger"

local frame = Instance.new("Frame", screen)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0, 20, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
title.Text = "🔍 Remote Logger"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold

local scrolling = Instance.new("ScrollingFrame", frame)
scrolling.Size = UDim2.new(1, 0, 1, -30)
scrolling.Position = UDim2.new(0, 0, 0, 30)
scrolling.CanvasSize = UDim2.new(0, 0, 10, 0)
scrolling.ScrollBarThickness = 6
scrolling.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- وظيفة تسجيل
local function log(name, method, args)
    local txt = "[ " .. method .. " ] " .. name .. "\n"
    for i, v in ipairs(args) do
        txt = txt .. "  Arg " .. i .. ": " .. tostring(v) .. "\n"
    end

    local label = Instance.new("TextLabel", scrolling)
    label.Size = UDim2.new(1, 0, 0, 60)
    label.Text = txt
    label.TextColor3 = Color3.new(1,1,1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Code
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.TextScaled = false
    label.TextWrapped = true
end

-- اكتشاف الريموتات
for _, remote in pairs(RS:GetDescendants()) do
    if remote:IsA("RemoteEvent") then
        remote.OnClientEvent:Connect(function(...)
            log(remote.Name, "RemoteEvent", {...})
        end)
    elseif remote:IsA("RemoteFunction") then
        local old = remote.OnClientInvoke
        remote.OnClientInvoke = function(...)
            log(remote.Name, "RemoteFunction", {...})
            if old then return old(...) end
        end
    end
end

RS.DescendantAdded:Connect(function(remote)
    if remote:IsA("RemoteEvent") then
        remote.OnClientEvent:Connect(function(...)
            log(remote.Name, "RemoteEvent", {...})
        end)
    elseif remote:IsA("RemoteFunction") then
        local old = remote.OnClientInvoke
        remote.OnClientInvoke = function(...)
            log(remote.Name, "RemoteFunction", {...})
            if old then return old(...) end
        end
    end
end)

print("✅ GUI Remote Logger Started")
