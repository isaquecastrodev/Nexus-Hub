local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UpdateStats = ReplicatedStorage.StarfallEvents.UpdateStats
local PlayerData = require(script.Parent.PlayerData)

local function addXP(player, amount)
    local data = PlayerData[player]
    data.xp = data.xp + amount
    
    while data.xp >= data.xpMax do
        data.xp = data.xp - data.xpMax
        data.level = data.level + 1
        data.xpMax = math.floor(data.xpMax * 1.5)
        
        -- Aumenta stats no level up
        data.stats.forca = data.stats.forca + 2
        data.stats.agilidade = data.stats.agilidade + 2
        data.stats.inteligencia = data.stats.inteligencia + 2
        
        UpdateStats:FireClient(player, data.level, data.xp, data.xpMax, data.stats)
    end
    
    UpdateStats:FireClient(player, data.level, data.xp, data.xpMax, data.stats)
end

-- Ganhe XP ao tocar em partes (exemplo)
workspace.ChildAdded:Connect(function(child)
    if child:IsA("Part") and child.Name == "XPOrb" then
        child.Touched:Connect(function(hit)
            local humanoid = hit.Parent:FindFirstChild("Humanoid")
            if humanoid then
                local player = Players:GetPlayerFromCharacter(hit.Parent)
                if player then
                    addXP(player, 50)
                    child:Destroy()
                end
            end
        end)
    end
end)
