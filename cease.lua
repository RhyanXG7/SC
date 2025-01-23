local roomValue = game.ReplicatedStorage.GameData.LatestRoom.Value
if not ((roomValue >= 30 and roomValue <= 45) or (roomValue >= 49 and roomValue <= 55) or (roomValue >= 72 and roomValue <= 80) or (roomValue >= 98 and roomValue <= 101)) then
    wait()
    local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()

    -- Create entity
    local entity = Spawner.createEntity({
        CustomName = "Cease", -- Custom name of your entity
        Model = "rbxassetid://12262854624", -- Can be GitHub file or rbxassetid
        Speed = 89, -- Percentage, 100 = default Rush speed
        DelayTime = 5, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        NoDieOnCrouching = false,
        NoHiding = false,
        AntiCrucifix = false,
        KillRange = 30,
        OneRoom = false,
        DieOnLook = false,
        BreakLights = false,
        BackwardsMovement = false,
        MovementDeath = {
            true, -- Turned On?
            '2',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
        },
        FlickerLights = {
            false, -- Enabled/Disabled
            80 -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 0,
        },
        CamShake = {
            true, -- Enabled/Disabled
            {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            false, -- Enabled/Disabled
            {
                Type = "1", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
                Image1 = "rbxassetid://11394027278", -- Image1 url
                Image2 = "rbxassetid://11394027278", -- Image2 url
                Shake = true,
                Sound1 = {
                    "0", -- SoundId Link or Roblox ID
                    { Volume = 0 }, -- Sound properties
                },
                Sound2 = {
                    "10483837590", -- SoundId Link or Roblox ID
                    { Volume = 3 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled/Disabled
                    Color3.fromRGB(48, 25, 52), -- Color
                },
                Tease = {
                    false, -- Enabled/Disabled
                    Min = 1,
                    Max = 1,
                },
            },
        },
        Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
        DiffrentMessages = false,
        CustomDialog = {
            {"Claim has seen you.", "It will consume anyone on sight.", "It takes a bit to fully spawn in", "so you can use that to your advantage."}, -- Death Messages
            {"Stop Dieing"},
            {"Bruh", "Use what you have learned from Rush!"},
            {"It seems like Template is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},
            {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}
        }
    })

    -- Monitor Player Movement While Entity Exists
    local function monitorPlayerMovement()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChild("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")

        if humanoid and rootPart then
            local lastPosition = rootPart.Position

            while entity and entity.IsActive do
                wait(0.1) -- Verifica a cada 0.1 segundos
                if (rootPart.Position - lastPosition).magnitude > 0.1 then
                    humanoid.Health = -1000
                    warn("Player morreu por se mover enquanto a entidade estava ativa!")
                    break
                end
                lastPosition = rootPart.Position
            end
        end
    end

    -- Debug and Events
    entity.Debug.OnEntitySpawned = function()
        print("Entity has spawned:")
        monitorPlayerMovement() -- Inicia o monitoramento de movimento
    end

    entity.Debug.OnEntityDespawned = function()
        print("Entity has despawned:")
    end

    entity.Debug.OnEntityStartMoving = function()
        print("Entity has started moving:")
    end

    entity.Debug.OnEntityFinishedRebound = function()
        print("Entity has finished rebound:")
    end

    entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
        print("Entity:", "has entered room:", room)
    end

    entity.Debug.OnLookAtEntity = function()
        print("Player has looked at entity:")
    end

    entity.Debug.OnDeath = function()
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = -1000
        warn("Player has died.")
    end

    -- Run the created entity
    Spawner.runEntity(entity)
end
