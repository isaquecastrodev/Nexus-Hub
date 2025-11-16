local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local PlayerDataStore = DataStoreService:GetDataStore("StarfallPlayerData")

local PlayerData = {}

local function loadData(player)
    local success, data = pcall(function()
        return PlayerDataStore:GetAsync(player.UserId)
    end)
    
    if success and data then
        PlayerData[player] = data
    else
        PlayerData[player] = {
            level = 1,
            xp = 0,
            xpMax = 100,
            stats = {forca = 10, agilidade = 10, inteligencia = 10},
            inventory = {},
            questProgress = {}
        }
    end
end

local function saveData(player)
    if PlayerData[player] then
        pcall(function()
            PlayerDataStore:SetAsync(player.UserId, PlayerData[player])
        end)
    end
end

Players.PlayerAdded:Connect(loadData)
Players.PlayerRemoving:Connect(saveData)
