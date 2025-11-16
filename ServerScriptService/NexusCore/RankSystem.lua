local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Settings = require(script.Parent.Settings)

local UpdateRank = Instance.new("RemoteEvent")
UpdateRank.Name = "UpdateRank"
UpdateRank.Parent = ReplicatedStorage:WaitForChild("NexusEvents")

local function getRank(player)
    for rankName, data in pairs(Settings.Ranks) do
        if player:IsInGroup(12345) and player:GetRankInGroup(12345) >= data.ID then
            return rankName, data.Color
        end
    end
    return "Player", Color3.fromRGB(255, 255, 255)
end

Players.PlayerAdded:Connect(function(player)
    local rank, color = getRank(player)
    UpdateRank:FireClient(player, rank, color)
    
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        UpdateRank:FireClient(player, rank, color)
    end)
end)
