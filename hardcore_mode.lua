

--Admincommand
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolmusicseekfaceas/helsgsssgshs/refs/heads/main/admin"))()

caa = 0
tween = game:GetService("TweenService")
local TestMultplayer = true
if game:GetService("ReplicatedStorage"):FindFirstChild("Stamina") then
    warn("You have Already Loaded")

    return true
end
local Test = Instance.new("Part")
Test.Name = "Stamina"
Test.Parent = game:GetService("ReplicatedStorage")
Test = 1

-- I Thank you noname for frostbite


-- Original By Noonie and ping

--Stamina
loadstring(game:HttpGet("https://pastefy.app/EpqLU3vm/raw"))()

local blackListeds = {"Yarik9847"} 
if table.find(blackListeds, game.Players.LocalPlayer.Name) then
game.Players.LocalPlayer:Kick("You have been for banned from Hardcore Mode.")
end

local blakListeds = {"Gotaga116"} 
if table.find(blakListeds, game.Players.LocalPlayer.Name) then
game.Players.LocalPlayer:Kick("You have been for banned from Hardcore Mode.")
end


-------- goober
coroutine.wrap(function()
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(v)
   L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
L.Parent = game:GetService("Workspace").CurrentRooms[v]
L.Name = 'Nodes'

end)
end)()

print("Loade") 
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.SoundId = "rbxassetid://10472612727" 
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.Pitch = 0.55 
 
game.Lighting.FogColor = Color3.fromRGB(0, 0, 0) 
game.Lighting.FogStart = 5 
game.Lighting.FogEnd = 800 
 
game.ReplicatedStorage.Sounds.BulbZap.SoundId = "rbxassetid://4398878054"  
 

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function msg(message)
    
    local mainGame = require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
    
    
    mainGame.caption(message, true)
end

if game.ReplicatedStorage.GameData.LatestRoom.Value > 1 then 
	game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Error"
	firesignal(game.ReplicatedStorage.RemoteEvents.DeathHint.OnClientEvent, {"You need to execute the script at door 0!", "Remember this!"}, "Blue")
	game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)  
	return
end

--jumscarerebound
coroutine.wrap(function()
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
    Sound.Volume = 0
    Sound:Play()
end

CustomGitSound("https://github.com/huyhoanphuc/gf/blob/main/km_20241117_360p_12f_20241117_030155.mp3?raw=true", 1, "Thereboudjumscare")

local function GetGitSoundID(GithubSnd,SoundName)
		SoundName=tostring(SoundName)
		local url=GithubSnd
		SoundName=tostring(SoundName)
		local url=GithubSnd
		FileName = SoundName
		writefile("customObject_Sound_"..FileName..".mp3", game:HttpGet(url))
		return (getcustomasset or getsynasset)("customObject_Sound_"..FileName..".mp3")
	end
end)()

--MuscSeekaajs
coroutine.wrap(function()
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
    Sound.Volume = 0
    Sound:Play()
end

CustomGitSound("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Here%20i%20come%20but%20WHAT%20THE%20FUCK.mp3?raw=true", 1, "Hereicomeseekog")

local function GetGitSoundID(GithubSnd,SoundName)
		SoundName=tostring(SoundName)
		local url=GithubSnd
		SoundName=tostring(SoundName)
		local url=GithubSnd
		FileName = SoundName
		writefile("customObject_Sound_"..FileName..".mp3", game:HttpGet(url))
		return (getcustomasset or getsynasset)("customObject_Sound_"..FileName..".mp3")
	end
end)()

--Optional Seek Eyes it might lag your device
coroutine.wrap(function()
    while true do
        wait(0.0005)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.0005)
        local ohmygah = Instance.new("Folder")
        ohmygah.Parent = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
    end
end)()

--Optional Seek Eyes 2 it might lag your device
coroutine.wrap(function()
    while true do
        wait(0.005)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].ChildAdded:Connect(function(seekeye)
	if seekeye.Name == "Eye" then
		wait(0.0005)
		local getSeek:Model = game:GetObjects("rbxassetid://11717372116")[1]
		getSeek.Parent = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Folder
		getSeek:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Eye.Black.CFrame)
		workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Eye:Destroy()
	else

	end
end)
    end
end)()

--New Seek music and animation loader
coroutine.wrap(function()
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        wait(0.0005)
        if game.Workspace:FindFirstChild("SeekMovingNewClone") then

            function ReplaceAudGit(GithubSnd, SoundName)
                local url = GithubSnd
                if not isfile(SoundName .. ".mp3") then
                    writefile(SoundName .. ".mp3", game:HttpGet(url))
                end
                return (getcustomasset or getsynasset)(SoundName .. ".mp3")
            end

            local a = game.Workspace.SevingNewClone
            a.Seesic.SoundId = ReplaceAudGit("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Here%20i%20come%20but%20WHAT%20THE%20FUCK.mp3?raw=true", "NewSeek")
        end
    end)
end)()

--Seek Model
workspace.ChildAdded:Connect(function(seek)
	if seek.Name == "SeekMovingNewClone" then
		wait(0.5)
	    workspace.SeekMovingNewClone.SeekRig.Head.Eye.Decal.Texture = "rbxassetid://0"
		for i,v in pairs(workspace.SeekMovingNewClone.SeekRig:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local getSeek = game:GetObjects("rbxassetid://11664451634")[1]
		getSeek.Parent = workspace.SeekMovingNewClone.Figure
		getSeek:PivotTo(workspace.SeekMovingNewClone.Figure.CFrame)
		local Weld = Instance.new("WeldConstraint",getSeek)
		Weld.Part0 = getSeek.PrimaryPart
		Weld.Part1 = workspace.SeekMovingNewClone.Figure
        workspace.SeekMovingNewClone.SeekMusic.SoundId = "rbxasset://custom_gloop/Hereicomeseekog.mp3"
        workspace.SeekMovingNewClone.SeekRig:Destroy()
		local SeekRig = workspace.SeekMovingNewClone.Figure.SeekMoving:FindFirstChild("SeekRig")
    	SeekRig:FindFirstChild("Root").Anchored = true
    
       local seksound = workspace.SeekMovingNewClone.SeekMusic
	seksound.Played:Connect(function()
		spawn(function()
			wait(7)
			workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.FootseptsFar:Play()
			 workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.Footsteps:Play()
			 workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.Splashing:Play()
			 workspace.SeekMovingNewClone.Figure.SeekMoving.Figure["Splashing Far"]:Play()
		end)
		local raiser = SeekRig.AnimationController:LoadAnimation(SeekRig.AnimRaise) raiser:Play()
		raiser.Stopped:Wait()
		SeekRig.AnimationController:LoadAnimation(SeekRig.AnimRun):Play()
end)
 
--SeekFooststop
coroutine.wrap(function()
workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.FootseptsFar:Stop()
	workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.Footsteps:Stop()
	workspace.SeekMovingNewClone.Figure.SeekMoving.Figure.Splashing:Stop()
  workspace.SeekMovingNewClone.Figure.SeekMoving.Figure["Splashing Far"]:Stop()
end)()    
       
--SeekPivo
  coroutine.wrap(function()
       while true do wait()
        getSeek:PivotTo(workspace.SeekMovingNewClone.Figure.CFrame)
       end
  end)()
       
--Seek
coroutine.wrap(function()
  loadstring(game:HttpGet("https://pastefy.app/6yFiipMI/raw"))()
end)() 

	else

	end
end)

--Seek Model 2
workspace.ChildAdded:Connect(function(seek)
	if seek.Name == "SeekMovingNewClone" then
		wait(0.5)
	    workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovinNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
wait(0.1)
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMovingNewClone.SeekRig.StringCheese:Destroy()
workspace.SeekMoving.SeekRigNewClone.StringCheese:Destroy()
	else
	end
end)
     
--NEW SEEK 
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function() 
    wait(3.5) 
    if not workspace:FindFirstChild("SeekMovingNewClone") then 
        return  
    end 
    
    local RealSeek = workspace:FindFirstChild("SeekMovingNewClone") 
    local RealSeekRig = RealSeek:FindFirstChild("SeekRig") 

    for _, v in pairs(seekNew.Figure:GetChildren()) do 
        if v:IsA("Sound") then 
            v:Stop() 
        end 
    end 

    RealSeekRig.Head.Eye:Destroy() 
    RealSeekRig.Head.Black:Destroy() 
    seekNew.Parent = workspace 
    local SeekRig = seekNew:FindFirstChild("SeekRig") 
    SeekRig:FindFirstChild("Root").Anchored = true 

    spawn(function() 
        while game:GetService("RunService").Heartbeat:Wait() and RealSeek do 
            if RealSeekRig:FindFirstChild("Root") then 
                SeekRig:FindFirstChild("Root").CFrame = RealSeekRig:FindFirstChild("Root").CFrame 
            end 
            for _, v in pairs(RealSeek.Figure:GetChildren()) do 
                RealSeek.Figure.Footsteps:Stop() 
                RealSeek.Figure.FootstepsFar:Stop() 
            end 
            for _, v in pairs(RealSeekRig:GetChildren()) do 
                if v:IsA("BasePart") then 
                    v.Transparency = 1 
                    
                    local sound = a.Ambience

            if sound:IsA("Sound") then
                sound.Played:Connect(function()
                    print("YEEEEE WORKING!!!!") 
                    local model = workspace:WaitForChild("seek2")
                    local seekRig = model:WaitForChild("SeekRig")
                    local animationController = seekRig:FindFirstChildOfClass("AnimationController")

                    if animationController then
                        local anim = seekRig:FindFirstChild("AnimRaise")
                        
                        if anim and anim:IsA("Animation") then
                            local animationTrack = animationController:LoadAnimation(anim)
                            animationTrack:Play()
                        else
                            warn("AnimRaise not found or is not an animation.")
                        end
                    else
                        warn("AnimationController not found in SeekRig.")
                    end
                    
                    wait(8.2)

                    local model = workspace:WaitForChild("seek2")
                    local seekRig = model:WaitForChild("SeekRig")
                    local animationController = seekRig:FindFirstChildOfClass("AnimationController")

                    if animationController then
                        local anim = seekRig:FindFirstChild("AnimRun")
                        
                        if anim and anim:IsA("Animation") then
                            local animationTrack = animationController:LoadAnimation(anim)
                            animationTrack:Play()
                        else
                            warn("AnimRun not found or is not an animation.")
                        end
                    else
                        warn("AnimationController not found in SeekRig.")
                    end
                end)
            else
                warn("Sound not found or is not an instance of Sound.")
            end
                end 
            end 
        end 
    end)
end)

local LightReplaceModel = game:GetObjects("rbxassetid://12543866876")[1] or nil

--Change Light Model
coroutine.wrap(function()
    while true do   
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
for i,v in pairs(workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Assets.Light_Fixtures:GetDescendants()) do
	if v.Name == "LightStand" then
		if game.ReplicatedStorage.GameData.LatestRoom.Value < 53 then
			local torch = LightReplaceModel:Clone()
			torch.Parent = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Assets.Light_Fixtures
			torch.LightFixture.Changed:Connect(function()
				torch.LightFixture.Neon.atachm["Ok you cannot tell me this isnt good"].Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture.Neon["Bright sh idfk"].ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture:WaitForChild('Dust').ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled 
			end)
			torch:PivotTo(v:GetPivot())
			v:Destroy()

		else
			v:Destroy()
		end
	  end
   end
  end
end)()

for i,v in pairs(workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Assets.Light_Fixtures:GetDescendants()) do
	if v.Name == "LightStand" then
		if game.ReplicatedStorage.GameData.LatestRoom.Value < 53 then
			local torch = LightReplaceModel:Clone()
			torch.Parent = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Assets.Light_Fixtures
			torch.LightFixture.Changed:Connect(function()
				torch.LightFixture.Neon.atachm["Ok you cannot tell me this isnt good"].Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture.Neon["Bright sh idfk"].ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture:WaitForChild('Dust').ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled 
			end)
			torch:PivotTo(v:GetPivot())
			v:Destroy()

		else
			v:Destroy()
		end
	  end
   end

--Ambiencea
coroutine.wrap(function()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
wait(0.0005)
game.Workspace.CurrentRooms["50"].FigureSetup.Ambience.SoundId = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/raw/main/Figure%20Ambience.mp3?raw=true","NewFigure")
game.Workspace.CurrentRooms["50"].FigureSetup.AmbienceEnd.SoundId = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Figure%20Start.mp3?raw=true","NewFigureStart")
game.Workspace.CurrentRooms["50"].FigureSetup.AmbienceStart.SoundId = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Figure%20End.mp3?raw=true","NewFigureEnd")
end)
end)()

--BlueDies
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.SoundId = "rbxassetid://10472612727" 
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.Pitch = 0.55 
 
--Lighting
local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.new(0, 0, 0)
Lighting.Brightness = 0.2
Lighting.FogEnd = 200
Lighting.FogStart = 5
Lighting.FogColor = Color3.new(0, 0, 0)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

msg("Hardcore initiated")
wait(3)
msg("Made by noonie#0001(Scripter) and Ping#1848 (Music composer and Modeler)")
wait(3)
local SillyBillies1 = {"Good Luck!", "Holy ####... Lois", "Fuck L_0 all my homies hate L_0", "who tf is joe???", "Do Not.", "Five Nights at Freddy's, Is this where you want to be? I just don't get it!!! Why you want to stay?"}
msg(SillyBillies1[math.random(1,#SillyBillies1)])

--Ripper
coroutine.wrap(function()
while true do wait(108)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RhyanXG7/SC/refs/heads/BetterStar/Ripper.lua"))()
end
end)()

--Frostbite
coroutine.wrap(function()
wait(160)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://pastefy.app/Zb1au2BU/raw"))()
end)()

--Shocker
coroutine.wrap(function()
while true do wait(32)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function spawnShocker()
    local shockerModel = game:GetObjects("rbxassetid://11547803978")[1]
    shockerModel.PrimaryPart = shockerModel:FindFirstChild("HumanoidRootPart") or shockerModel:FindFirstChildWhichIsA("Part")
    
    local camera = Workspace.CurrentCamera
    shockerModel:SetPrimaryPartCFrame(camera.CFrame * CFrame.new(0, 0, -8))
    shockerModel.Parent = Workspace

    local oogaBoogaaPart = shockerModel:WaitForChild("OOGA BOOGAAAA")
    local horrorScream = shockerModel:WaitForChild("OOGA BOOGAAAA"):WaitForChild("HORROR SCREAM 15")

    local lookDuration = 4
    local startTime = tick()
    local playerLookingAtShocker = true

    while playerLookingAtShocker do
        wait(0.1)

        local angle = (oogaBoogaaPart.Position - character.PrimaryPart.Position).unit
        local direction = camera.CFrame.LookVector

        if (angle:Dot(direction) > 0.9) then
            if tick() - startTime >= lookDuration then
                horrorScream:Play()
                humanoid:TakeDamage(30)
                local function GetGitSound(GithubSnd,SoundName)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=Instance.new("Sound")
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
			end
			game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
	game.Lighting.MainColorCorrection.Contrast = 1
	local tween = game:GetService("TweenService")
	tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
	local TweenService = game:GetService("TweenService")
	local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(80),{TintColor = Color3.fromRGB(255, 255, 255)})
	TW:Play()
        local ShokerJC = GetGitSound("https://github.com/huyhoanphuc/thh/blob/main/km_20240823_720p_12f_20240823_021809.mp3?raw=true","ShokerJC")
				ShokerJC.Parent = workspace
				ShokerJC.Volume = 1.3
				ShokerJC:Play()
                playerLookingAtShocker = false

                local speed = 10
                local targetPosition = character.PrimaryPart.Position

                while oogaBoogaaPart.Position.Y > targetPosition.Y do
                    local directionToPlayer = (targetPosition - oogaBoogaaPart.Position).unit
                    oogaBoogaaPart.Position = oogaBoogaaPart.Position + directionToPlayer * speed * 0.1
                    wait(0.1)
                end

                oogaBoogaaPart.CanCollide = false
                oogaBoogaaPart.Anchored = false
                wait(3)
                shockerModel:Destroy()
game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Shocker"
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
    "You died to who you call Shocker...",
    "Dont look at it or it stuns you!"
}, "Blue") -- "Blue" or "Yellow"
                break
            end
        else
            
            oogaBoogaaPart.CanCollide = false
            oogaBoogaaPart.Anchored = false
            break
        end
    end
oogaBoogaaPart.CanCollide = false
oogaBoogaaPart.Anchored = false
wait(0.98)
getgenv().Title = "Shocking Experience" --Title Here
					getgenv().Description = "Look at me." --Description Here
					getgenv().Reason = "Encounter Shocker." --Reason Here
					getgenv().BadgeId = 2129271052  --Replace Number with Your Badge ID
					getgenv().Category = 10 --You can replace the Category or dont

					local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)
					local Achievements = debug.getupvalue(Unlock, 1)
					for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
						v.Title = getgenv().Title
						v.Desc = getgenv().Description
						v.Reason = getgenv().Reason
						v.BadgeId = getgenv().BadgeId
						v.Category = getgenv().Category
					end
					Unlock(nil,"Join")
wait(1)
    shockerModel:Destroy()
end

spawnShocker()
end
end)()

--DeerGod
coroutine.wrap(function()
while true do wait(332)
loadstring(game:HttpGet("https://pastefy.app/17nNEGQe/raw"))()
end
end)()

--Silence
coroutine.wrap(function()
while true do wait(861)
loadstring(game:HttpGet("https://pastefy.app/87ReQWOF/raw"))()
end
end)()

--Cease
coroutine.wrap(function()
while true do 
wait(math.random(23, 370))
loadstring(game:HttpGet("https://github.com/huyhoanphuc/testhshs/raw/refs/heads/main/hdisgvshceaseeee"))()
end
end)()

--A90
coroutine.wrap(function()
while true do wait(143)
local TweenService = game:GetService("TweenService")
	local LocalPlayer = game.Players.LocalPlayer
	local UI = game.Players.LocalPlayer.PlayerGui.MainUI
	local Jumpscare_A90 = UI.Jumpscare.Jumpscare_A90
	local A90Module = UI.Initiator.Main_Game.RemoteListener.Modules.A90
	local MainGame = require(UI.Initiator.Main_Game)
	 Jumpscare_A90.Face.Image = "http://www.roblox.com/asset/?id=12635832722"
	Jumpscare_A90.FaceAngry.Image = "http://www.roblox.com/asset/?id=12635955412"

spawn(function()
require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90)(require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game))
end)

spawn(function()
wait(0.1) -- dont know any other way
Survived = true
end)

repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Visible == true
if Survived then

wait(1)
game.Players.LocalPlayer.Character.Humanoid:TakeDamage(72)
local ReSt = game:GetService("ReplicatedStorage") 
ReSt.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "A-90"
end
end
end)()

--Asitty
coroutine.wrap(function()
loadstring(game:HttpGet("https://github.com/huyhoanphuc/testhshs/raw/refs/heads/main/A660hsgakahbsjhshsvhshsbachubbyhardmode"))()
end)()

--Frostbitea
coroutine.wrap(function()
wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://pastefy.app/Zb1au2BU/raw"))()
end)()

--Frostbiteb
coroutine.wrap(function()
wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://pastefy.app/Zb1au2BU/raw"))()
end)()

--Rebound
coroutine.wrap(function()
wait(176)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
    Reboundcolor.Name = "Warn"
    Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
    game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 5
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
wait(2.8)
 
function GetGitSound(GithubSnd,SoundName)
 local url=GithubSnd
 if not isfile(SoundName..".mp3") then
  writefile(SoundName..".mp3", game:HttpGet(url))
 end
 local sound=Instance.new("Sound")
 sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
 return sound
end

local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://5567523008"
scare.PlaybackSpeed = 3
scare.Volume = 5

loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thha"))()
end)()

--Reboundb
coroutine.wrap(function()
wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
    Reboundcolor.Name = "Warn"
    Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
    game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 5
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
wait(2.8)
 
function GetGitSound(GithubSnd,SoundName)
 local url=GithubSnd
 if not isfile(SoundName..".mp3") then
  writefile(SoundName..".mp3", game:HttpGet(url))
 end
 local sound=Instance.new("Sound")
 sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
 return sound
end

local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://5567523008"
scare.PlaybackSpeed = 3
scare.Volume = 5

loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thh"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/huyhoanphuc/th/refs/heads/main/thha"))()
end)()

--Hardcore Remake by dumbass skidder

--Mode Made Original By Noonie And ping
