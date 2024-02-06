local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nitro Hub - Blox Fruits",
    SubTitle = "by SewBMango",
    TabWidth = 160,
    Size = UDim2.fromOffset(595, 375),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    TabShop = Window:AddTab({ Title = "Tab Shop", Icon = "" }),
    TabFarm = Window:AddTab({ Title = "Tab Farm", Icon = "" }),
    TabMisc = Window:AddTab({ Title = "Tab Misc", Icon = "" }),
    TabTeleport = Window:AddTab({ Title = "Tab Teleport", Icon = "" }),
}

local Options = Fluent.Options

local FightingStyle = Tabs.TabShop:AddDropdown("Fighting Style", {
    Title = "Fighting Style",
    Values = {"Dark Step", "Electric", "Water KungFu", "Dragon Breath", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman", "Sanguine Art"},
    Multi = false,
    Default = 1,
})

FightingStyle:SetValue("Dark Step")

FightingStyle:OnChanged(function(value)
    _G.BuyFightingStyleFunction = value
end)

Tabs.TabShop:AddButton({
    Title = "Buy Fighting Select",
    Callback = function()
    BuyFightingStyle()
    end
})

function BuyFightingStyle()
    if _G.BuyFightingStyleFunction == "Dark Step" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    elseif _G.BuyFightingStyleFunction == "Electric" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    elseif _G.BuyFightingStyleFunction == "Water KungFu" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    elseif _G.BuyFightingStyleFunction == "Dragon Breath" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    elseif _G.BuyFightingStyleFunction == "Superhuman" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    elseif _G.BuyFightingStyleFunction == "Death Step" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    elseif _G.BuyFightingStyleFunction == "Sharkman Karate" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    elseif _G.BuyFightingStyleFunction == "Electric Claw" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    elseif _G.BuyFightingStyleFunction == "Dragon Talon" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    elseif _G.BuyFightingStyleFunction == "Godhuman" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    elseif _G.BuyFightingStyleFunction == "Sanguine Art" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
end

local TradeBone = Tabs.TabMisc:AddToggle("TradeBone", {Title = "Trade Bone", Default = false})
   TradeBone:OnChanged(function(value)
        _G.RandomBoneFunction = value
    end)

   Options.TradeBone:SetValue(false)

   spawn(function()
    pcall(function()
        while wait(0.75) do
            if _G.RandomBoneFunction then    
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
    end)
end)

Tabs.TabTeleport:AddButton({
    Title = "Teleport to Old World",
    Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

Tabs.TabTeleport:AddButton({
    Title = "Teleport to New World",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

Tabs.TabTeleport:AddButton({
    Title = "Teleport to Third World",
    Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

Fluent:Notify({
    Title = "Nitro Hub",
    Content = "Loaded Script ! ",
    Duration = 10
})
