local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/topraqk1/helixia-hub/refs/heads/main/Scripts/library.lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/topraqk1/helixia-hub/refs/heads/main/Scripts/notification.lua"))()

local gameId = game.PlaceId
local gameName = game:GetService("MarketplaceService"):GetProductInfo(gameId).Name

local window = Library:Load("Helixia HUB - " .. gameName, "Default")

local PlayerTab = Library.newTab("Player", "ImageIdHere")

PlayerTab.newSlider("Walk Speed", "Set Your Walk Speed", 1, 750, false, function(num)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
end)

PlayerTab.newSlider("Jump Power", "Set Your Jump Power", 1, 500, false, function(num)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
end)

local infJump = false

PlayerTab.newToggle("Infinite Jump", "Enable/Disable Infinite Jump", false, function(Value)
    infJump = Value
end)

local UserInputService = game:GetService("UserInputService")

UserInputService.JumpRequest:Connect(function()
    if infJump then
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
      player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
      end
    end
end)

window:Toggle()
