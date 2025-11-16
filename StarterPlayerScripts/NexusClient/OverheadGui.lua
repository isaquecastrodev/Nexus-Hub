local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local UpdateRank = ReplicatedStorage:WaitForChild("NexusEvents"):WaitForChild("UpdateRank")

local function createOverhead(char)
    local head = char:WaitForChild("Head")
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = char

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1,1,1)
    text.TextStrokeTransparency = 0
    text.Font = Enum.Font.GothamBold
    text.Parent = billboard

    return text
end

UpdateRank.OnClientEvent:Connect(function(rank, color)
    local char = player.Character or player.CharacterAdded:Wait()
    local text = char:FindFirstChild("Head"):FindFirstChild("BillboardGui")
    if not text then
        text = createOverhead(char)
    else
        text = text:FindFirstChild("TextLabel")
    end

    text.Text = player.Name .. "\n[" .. rank .. "]"

    if color == "rainbow" then
        spawn(function()
            local hue = 0
            while text and text.Parent do
                hue = (hue + 0.005) % 1
                text.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait()
            end
        end)
    else
        text.TextColor3 = color
    end
end)
