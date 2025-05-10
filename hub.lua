local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/topraqk1/helixia-hub/refs/heads/main/Scripts/library.lua"))()
local HttpService = game:GetService("HttpService")

local apiUrl = "https://raw.githubusercontent.com/topraqk1/helixia-hub/refs/heads/main/supported_games.json"

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown Game"

local Window = Rayfield:CreateWindow({
   Name = "Helixia Hub | " .. gameName,
   Icon = "gamepad",
   LoadingTitle = "Helixia Hub",
   LoadingSubtitle = "discord.gg/JRzMYAWvUZ",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HelixiaHub",
      FileName = "Config"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Helixia Hub",
      Subtitle = "Key System",
      Note = "Anahtar almak için özel bilgi verilmemiş",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local MainTab = Window:CreateTab("Home", "home")
MainTab:CreateSection("Supported Games")

local success, response = pcall(function()
   return HttpService:JSONDecode(game:HttpGet(apiUrl))
end)

if success and response and response.games then
   for _, game in ipairs(response.games) do
      MainTab:CreateLabel(game.name)
   end
else
   MainTab:CreateLabel("Failed to fetch game list")
end
