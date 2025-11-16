local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarfallEvents = Instance.new("Folder")
StarfallEvents.Name = "StarfallEvents"
StarfallEvents.Parent = ReplicatedStorage

local UpdateStats = Instance.new("RemoteEvent")
UpdateStats.Name = "UpdateStats"
UpdateStats.Parent = StarfallEvents

local UseSkill = Instance.new("RemoteEvent")
UseSkill.Name = "UseSkill"
UseSkill.Parent = StarfallEvents

require(script.StarfallCore.PlayerData)
require(script.StarfallCore.LevelSystem)
require(script.StarfallCore.Inventory)
