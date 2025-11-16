local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UpdateInventory = ReplicatedStorage.StarfallEvents.UpdateInventory
local PlayerData = require(script.Parent.PlayerData)

local Items = {
    Sword = {name = "Espada", power = 20, icon = "rbxassetid://0"},
    Potion = {name = "Poção", heal = 50, icon = "rbxassetid://0"}
}

local function addItem(player, itemName)
    local data = PlayerData[player]
    table.insert(data.inventory, Items[itemName])
    UpdateInventory:FireClient(player, data.inventory)
end

-- Comando para testar: /give sword
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        if msg:lower() == "/give sword" then
            addItem(player, "Sword")
        elseif msg:lower() == "/give potion" then
            addItem(player, "Potion")
        end
    end)
end)
