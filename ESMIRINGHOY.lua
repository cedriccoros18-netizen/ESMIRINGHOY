
-- 🥵 ESMIRINGHOY
-- Key: Bembang
-- For your own Roblox Studio game
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local KEY = "Bembang"

local gui = Instance.new("ScreenGui")
gui.Name = "ESMIRINGHOY"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local function create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local frame = create("Frame", {
    Size = UDim2.fromOffset(260, 170),
    Position = UDim2.new(0.5, -130, 0.5, -85),
    BackgroundColor3 = Color3.fromRGB(25, 25, 32)
}, gui)

create("UICorner", {
    CornerRadius = UDim.new(0, 12)
}, frame)

create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 40),
    BackgroundTransparency = 1,
    Text = "🥵 ESMIRINGHOY",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 18,
    Font = Enum.Font.GothamBold
}, frame)

local keyBox = create("TextBox", {
    Size = UDim2.new(1, -24, 0, 35),
    Position = UDim2.fromOffset(12, 48),
    PlaceholderText = "Enter key",
    Text = "",
    ClearTextOnFocus = false,
    TextSize = 16,
    BackgroundColor3 = Color3.fromRGB(50, 50, 62),
    TextColor3 = Color3.new(1, 1, 1)
}, frame)

local unlock = create("TextButton", {
    Size = UDim2.new(1, -24, 0, 35),
    Position = UDim2.fromOffset(12, 92),
    Text = "UNLOCK",
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    BackgroundColor3 = Color3.fromRGB(75, 90, 145),
    TextColor3 = Color3.new(1, 1, 1)
}, frame)

local message = create("TextLabel", {
    Size = UDim2.new(1, -20, 0, 25),
    Position = UDim2.fromOffset(10, 135),
    BackgroundTransparency = 1,
    Text = "",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 13
}, frame)

unlock.Activated:Connect(function()
    if keyBox.Text == KEY then
        message.Text = "Key accepted!"
        frame:Destroy()

        local panel = create("Frame", {
            Size = UDim2.fromOffset(220, 140),
            Position = UDim2.new(0.5, -110, 0.5, -70),
            BackgroundColor3 = Color3.fromRGB(25, 25, 32)
        }, gui)

        create("UICorner", {
            CornerRadius = UDim.new(0, 12)
        }, panel)

        create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundTransparency = 1,
            Text = "🥵 ESMIRINGHOY",
            TextColor3 = Color3.new(1, 1, 1),
            TextSize = 16,
            Font = Enum.Font.GothamBold
        }, panel)

        local speed = create("TextButton", {
            Size = UDim2.new(1, -20, 0, 32),
            Position = UDim2.fromOffset(10, 45),
            Text = "SPEED: OFF",
            BackgroundColor3 = Color3.fromRGB(60, 60, 80),
            TextColor3 = Color3.new(1, 1, 1)
        }, panel)

        local jump = create("TextButton", {
            Size = UDim2.new(1, -20, 0, 32),
            Position = UDim2.fromOffset(10, 85),
            Text = "JUMP: OFF",
            BackgroundColor3 = Color3.fromRGB(60, 60, 80),
            TextColor3 = Color3.new(1, 1, 1)
        }, panel)

        local speedOn = false
        local jumpOn = false

        local function update()
            local character = player.Character
            local hum = character and character:FindFirstChildOfClass("Humanoid")
            if not hum then return end

            hum.WalkSpeed = speedOn and 32 or 16
            hum.UseJumpPower = true
            hum.JumpPower = jumpOn and 70 or 50
        end

        speed.Activated:Connect(function()
            speedOn = not speedOn
            speed.Text = speedOn and "SPEED: ON" or "SPEED: OFF"
            update()
        end)

        jump.Activated:Connect(function()
            jumpOn = not jumpOn
            jump.Text = jumpOn and "JUMP: ON" or "JUMP: OFF"
            update()
        end)
    else
        message.Text = "Wrong key! Try again."
    end
end)
