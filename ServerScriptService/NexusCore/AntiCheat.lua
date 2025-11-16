local Players = game:GetService("Players")
local Settings = require(script.Parent.Settings)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid")
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if hum.WalkSpeed > Settings.AntiCheat.MaxSpeed then
                hum.WalkSpeed = 16
                player:Kick("Speed Hack Detectado")
            end
        end)
    end)
end)
