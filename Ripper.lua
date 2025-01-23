local roomValue = game.ReplicatedStorage.GameData.LatestRoom.Value
if not ((roomValue >= 26 and roomValue <= 45) or (roomValue >= 49 and roomValue <= 55)  or (roomValue >= 72 and roomValue <= 80) or (roomValue >= 98 and roomValue <= 101)) then
wait()
 game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yuzixser-Script/Function/main/Vynixus_SpawnV2.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Rippers",
		Asset = "rbxassetid://13942047057",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {5.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 189,
		Delay = math.random(8, 8),
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush",
		Min = 1,
		Max = 1,
		Delay = 1
	},
	Damage = {
		Enabled = true,
		Range = 56,
		Amount = 1
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding",
		Hints = {"You die to ", "It appears at the next door and has a chance to stay there or run back to the latest door.", "He will come back many times after his initial spawn", "so hide every next door until it is safe.."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
if workspace.Frostbite then 
workspace.Rippers:Destroy()
end
    workspace.Ripper.RushNew.Ambush:Stop()
    
    function GitPNG(GithubImg, ImageName)
    local url = GithubImg
    if not isfile(ImageName .. ".png") then
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            writefile(ImageName .. ".png", response)
        else
            error(": " .. response)
        end
    end
    return (getcustomasset or getsynasset)(ImageName .. ".png")
end

workspace.Ripper.RushNew.Attachment.ParticleEmitter.Texture = GitPNG("https://github.com/huyhoanggphuc/Entity-obfuscate/blob/main/Ripper%20(1).png?raw=true", "RipperFace")

    function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local Soaund = Instance.new("Sound")
    Soaund.SoundId = GitAud(soundlink, filename)
    Soaund.Parent = workspace.Ripper
    Soaund.Volume = 5
end

CustomGitSound("https://github.com/lolmusicseekfaceas/helsgsssgshs/blob/main/km_20241107_360p_12f_20241107_015756.mp3?raw=true", 1, "Herefdfffddtftdfekog")

    loadstring(game:HttpGet("https://pastefy.app/Wg60XG3g/raw"))()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    wait()
    workspace.Ripper.RushNew.Ambush:Start()

function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local RipeMoving = Instance.new("Sound")
    RipeMoving.SoundId = GitAud(soundlink, filename)
    RipeMoving.Parent = workspace
    RipeMoving.Volume = 3
    RipeMoving:Play()
end

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/main/Y2meta.app%20-%20Ripper%20Has%20Moving%20Sound%20(320%20kbps).mp3", 1, "RipperHasMoving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    game.workspace.Ripper:Destroy()
    
    local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(15,25,0,2,1,6)

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Torn Apart",
    Desc = "Dont leave too early..",
    Reason = "Encounter Ripper.",
    Image = "rbxassetid://17702317077"
})
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = -1000
		print("Entity has killed the player")
	else
    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = -1000
		print("Entity has damaged the player")
         game.workspace.Ripper.RushNew.Anchored = false
         game.workspace.Ripper.RushNew.CanCollide = true
		game.Players.LocalPlayer.Character.Humanoid.Health = 100
		local Camera = workspace.CurrentCamera
local runService = game:GetService("RunService")

local lockOn = workspace.Ripper.RushNew

local event = runService.RenderStepped:Connect(function()
Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, lockOn.Position)
end)

coroutine.wrap(function()
workspace.Ripper.Sound:Play()

local ripeend = Instance.new("Sound")
    ripeend.Parent = workspace
    ripeend.Name = "RipperEnd"
    ripeend.SoundId = "rbxassetid://1837829565"
    ripeend.Volume = 3
    ripeend.Pitch = 1
    ripeend:Play()
  
local player = game.Players.LocalPlayer

player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
player.Character.HumanoidRootPart.Anchored = true

function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local Sound = Instance.new("Sound")
    Sound.SoundId = GitAud(soundlink, filename)
    Sound.Parent = workspace
    Sound.Volume = vol
    Sound:Play()
end

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/main/Y2meta.app%20-%20Doors%20HardCore%20Mode_%201%20ripper%20part%20sound%20(320%20kbps).mp3", 1, "Ripper5Sound")
wait(1.3)
function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local Sound1 = Instance.new("Sound")
    Sound1.SoundId = GitAud(soundlink, filename)
    Sound1.Parent = workspace
    Sound1.Volume = vol
    Sound1:Play()
end

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/main/Y2meta.app%20-%20Doors%20Hardcore%20Mode_%20Ripperscare%20part%202%20sound%20(320%20kbps).mp3", 1, "Ripper6Sound")
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Image = "rbxassetid://236542974"
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = true
wait(0.3)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = false
wait(0.1)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = true
wait(0.2)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = true
wait(0.2)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = false
wait(0.3)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = true
wait(0.2)
game.Players.LocalPlayer.PlayerGui.MainUI.Drip.Visible = false
wait(0.2)
game.Players.LocalPlayer.Character.Humanoid.Health -= 100
wait()
event:Disconnect()
game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Ripper"
wait()

player.Character.HumanoidRootPart.Anchored = false
wait()
game.workspace.Ripper:Destroy()

game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Ripper"
local func, setupval, getinfo, typeof, getgc, next = nil, debug.setupvalue or setupvalue, debug.getinfo or getinfo, typeof, getgc, next

for i,v in next, getgc(false) do
    if typeof(v) == "function" then
        local info = getinfo(v)
        if info.currentline == 54 and info.nups == 2 and info.is_vararg == 0 then
            func = v
            break
        end
    end
end

local function DeathHint(hints, type: string)
    setupval(func, 1, hints)
    if type ~= nil then
        setupval(func, 2, type)
    end
end

DeathHint({
    "You died to who you call Ripper...",
    "You can tell his presence by the lights and his scream.",
    "Hide when he does this!"
}, "Blue") -- "Blue" or "Yellow"
end)()
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
end
