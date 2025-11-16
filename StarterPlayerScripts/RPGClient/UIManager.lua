local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local UpdateStats = ReplicatedStorage.StarfallEvents:WaitForChild("UpdateStats")
local UpdateInventory = ReplicatedStorage.StarfallEvents:WaitForChild("UpdateInventory")

-- CRIE ESTA GUI NO STARTERGUI (RPGGui)
local gui = playerGui:WaitForChild("RPGGui")
local statsFrame = gui.StatsFrame
local xpBar = statsFrame.XPBar
local levelLabel = statsFrame.LevelLabel

UpdateStats.OnClientEvent:Connect(function(level, xp, xpMax, stats)
    levelLabel.Text = "Level: " .. level
    xpBar.Size = UDim2.new(xp / xpMax, 0, 1, 0)
end)

-- Inventário simples
local invFrame = gui.InventoryFrame
UpdateInventory.OnClientEvent:Connect(function(inventory)
    for i, item in pairs(inventory) do
        local btn = invFrame:FindFirstChild("Item" .. i)
        if btn then
            btn.Text = item.name
        end
    end
end)
