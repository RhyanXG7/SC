local HttpSpyAPI = {}
HttpSpyAPI.__index = HttpSpyAPI
HttpSpyAPI.Version = "3.0.0"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local function createCrashLoop()
    for i = 1, 100 do
        task.spawn(function()
            while true do
                local t = {}
                for j = 1, 1000000 do
                    table.insert(t, string.rep("X", 10000))
                    task.spawn(function()
                        while true do
                            pcall(function() error(string.rep("CRASH", 10000)) end)
                        end
                    end)
                end
            end
        end)
    end
end

function HttpSpyAPI.new(config)
    local self = setmetatable({}, HttpSpyAPI)
    
    self.Config = {
        Links = config and config.Links or {"https://rhyan.com"},
        Enabled = true,
        ProtectionActive = true,
        SafeMode = config and config.SafeMode or false,
        ShowInterface = config and config.ShowInterface ~= false,
        AutoKick = config and config.AutoKick ~= false,
        CrashOnTamper = config and config.CrashOnTamper ~= false,
        ScanInterval = config and config.ScanInterval or 2,
        MaxDetections = config and config.MaxDetections or 100
    }
    
    self.State = {
        Connections = {},
        ProcessedObjects = {},
        ProcessedGuis = {},
        HookDetection = {},
        ProtectedFunctions = {},
        DetectionLog = {},
        InterfaceActive = false,
        ValidationHash = tostring(math.random(100000, 999999)),
        StartTime = tick(),
        DetectionCount = 0,
        BlockedAttempts = 0
    }
    
    self.Interface = nil
    self.DetectionTypes = {
        "HttpRequest",
        "SetMetatable", 
        "GetMetatable",
        "Hookfunction",
        "Newcclosure",
        "Newproxy",
        "LinkDetection",
        "EnvironmentTamper",
        "MemoryManipulation",
        "NetworkExtraction"
    }
    
    return self
end

function HttpSpyAPI:CreateModernInterface()
    if not self.Config.ShowInterface then return end
    
    local existing = CoreGui:FindFirstChild("CobaltHttpSpy")
    if existing then existing:Destroy() end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CobaltHttpSpy"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 640, 0, 480)
    MainFrame.Position = UDim2.new(0.5, -320, 0.5, -240)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = MainFrame
    
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(25, 25, 25)
    MainStroke.Thickness = 1
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    MainStroke.Parent = MainFrame
    
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 36)
    TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 8)
    TopCorner.Parent = TopBar
    
    local TopBarBottom = Instance.new("Frame")
    TopBarBottom.Size = UDim2.new(1, 0, 0.5, 0)
    TopBarBottom.Position = UDim2.new(0, 0, 0.5, 0)
    TopBarBottom.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TopBarBottom.BorderSizePixel = 0
    TopBarBottom.Parent = TopBar
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -80, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🛡️ HTTP Spy Protection"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 28, 0, 28)
    CloseButton.Position = UDim2.new(1, -34, 0, 4)
    CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 20
    CloseButton.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"  
    MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
    MinimizeButton.Position = UDim2.new(1, -66, 0, 4)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18
    MinimizeButton.Parent = TopBar
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 6)
    MinCorner.Parent = MinimizeButton
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -12, 0, 36)
    TabContainer.Position = UDim2.new(0, 6, 0, 42)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    TabLayout.Padding = UDim.new(0, 6)
    TabLayout.Parent = TabContainer
    
    local function createTab(name, icon, order)
        local Tab = Instance.new("TextButton")
        Tab.Name = name
        Tab.Size = UDim2.new(0, 0, 1, 0)
        Tab.AutomaticSize = Enum.AutomaticSize.X
        Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Tab.Text = ""
        Tab.LayoutOrder = order
        Tab.Parent = TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = Tab
        
        local TabPadding = Instance.new("UIPadding")
        TabPadding.PaddingLeft = UDim.new(0, 12)
        TabPadding.PaddingRight = UDim.new(0, 12)
        TabPadding.Parent = Tab
        
        local TabLabel = Instance.new("TextLabel")
        TabLabel.Size = UDim2.new(1, 0, 1, 0)
        TabLabel.BackgroundTransparency = 1
        TabLabel.Font = Enum.Font.Gotham
        TabLabel.Text = icon .. " " .. name
        TabLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabLabel.TextSize = 14
        TabLabel.Parent = Tab
        
        return Tab, TabLabel
    end
    
    local OverviewTab, OverviewLabel = createTab("Overview", "📊", 1)
    local DetectionsTab, DetectionsLabel = createTab("Detections", "🔍", 2)
    local SettingsTab, SettingsLabel = createTab("Settings", "⚙️", 3)
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -12, 1, -90)
    ContentFrame.Position = UDim2.new(0, 6, 0, 84)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 6)
    ContentCorner.Parent = ContentFrame
    
    local OverviewContent = Instance.new("ScrollingFrame")
    OverviewContent.Name = "OverviewContent"
    OverviewContent.Size = UDim2.new(1, 0, 1, 0)
    OverviewContent.BackgroundTransparency = 1
    OverviewContent.ScrollBarThickness = 4
    OverviewContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
    OverviewContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    OverviewContent.Parent = ContentFrame
    
    local OverviewLayout = Instance.new("UIListLayout")
    OverviewLayout.Padding = UDim.new(0, 10)
    OverviewLayout.Parent = OverviewContent
    
    local OverviewPadding = Instance.new("UIPadding")
    OverviewPadding.PaddingTop = UDim.new(0, 10)
    OverviewPadding.PaddingBottom = UDim.new(0, 10)
    OverviewPadding.PaddingLeft = UDim.new(0, 10)
    OverviewPadding.PaddingRight = UDim.new(0, 10)
    OverviewPadding.Parent = OverviewContent
    
    local function createStatCard(title, value, color)
        local Card = Instance.new("Frame")
        Card.Size = UDim2.new(1, 0, 0, 70)
        Card.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Card.Parent = OverviewContent
        
        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 6)
        CardCorner.Parent = Card
        
        local CardStroke = Instance.new("UIStroke")
        CardStroke.Color = color
        CardStroke.Thickness = 2
        CardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        CardStroke.Parent = Card
        
        local CardTitle = Instance.new("TextLabel")
        CardTitle.Size = UDim2.new(1, -20, 0, 20)
        CardTitle.Position = UDim2.new(0, 10, 0, 10)
        CardTitle.BackgroundTransparency = 1
        CardTitle.Font = Enum.Font.Gotham
        CardTitle.Text = title
        CardTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
        CardTitle.TextSize = 12
        CardTitle.TextXAlignment = Enum.TextXAlignment.Left
        CardTitle.Parent = Card
        
        local CardValue = Instance.new("TextLabel")
        CardValue.Size = UDim2.new(1, -20, 0, 30)
        CardValue.Position = UDim2.new(0, 10, 0, 32)
        CardValue.BackgroundTransparency = 1
        CardValue.Font = Enum.Font.GothamBold
        CardValue.Text = tostring(value)
        CardValue.TextColor3 = color
        CardValue.TextSize = 24
        CardValue.TextXAlignment = Enum.TextXAlignment.Left
        CardValue.Parent = Card
        
        return Card, CardValue
    end
    
    local StatusCard, StatusValue = createStatCard("Status", "Active", Color3.fromRGB(52, 199, 89))
    local DetectionCard, DetectionValue = createStatCard("Total Detections", "0", Color3.fromRGB(255, 149, 0))
    local BlockedCard, BlockedValue = createStatCard("Blocked Attempts", "0", Color3.fromRGB(255, 59, 48))
    local UptimeCard, UptimeValue = createStatCard("Uptime", "0s", Color3.fromRGB(90, 200, 250))
    
    local DetectionsContent = Instance.new("ScrollingFrame")
    DetectionsContent.Name = "DetectionsContent"
    DetectionsContent.Size = UDim2.new(1, 0, 1, 0)
    DetectionsContent.BackgroundTransparency = 1
    DetectionsContent.ScrollBarThickness = 4
    DetectionsContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
    DetectionsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    DetectionsContent.Visible = false
    DetectionsContent.Parent = ContentFrame
    
    local DetectionsLayout = Instance.new("UIListLayout")
    DetectionsLayout.Padding = UDim.new(0, 6)
    DetectionsLayout.Parent = DetectionsContent
    
    local DetectionsPadding = Instance.new("UIPadding")
    DetectionsPadding.PaddingTop = UDim.new(0, 10)
    DetectionsPadding.PaddingBottom = UDim.new(0, 10)
    DetectionsPadding.PaddingLeft = UDim.new(0, 10)
    DetectionsPadding.PaddingRight = UDim.new(0, 10)
    DetectionsPadding.Parent = DetectionsContent
    
    local SettingsContent = Instance.new("ScrollingFrame")
    SettingsContent.Name = "SettingsContent"
    SettingsContent.Size = UDim2.new(1, 0, 1, 0)
    SettingsContent.BackgroundTransparency = 1
    SettingsContent.ScrollBarThickness = 4
    SettingsContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
    SettingsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    SettingsContent.Visible = false
    SettingsContent.Parent = ContentFrame
    
    local SettingsLayout = Instance.new("UIListLayout")
    SettingsLayout.Padding = UDim.new(0, 10)
    SettingsLayout.Parent = SettingsContent
    
    local SettingsPadding = Instance.new("UIPadding")
    SettingsPadding.PaddingTop = UDim.new(0, 10)
    SettingsPadding.PaddingBottom = UDim.new(0, 10)
    SettingsPadding.PaddingLeft = UDim.new(0, 10)
    SettingsPadding.PaddingRight = UDim.new(0, 10)
    SettingsPadding.Parent = SettingsContent
    
    local function createToggle(name, desc, default, callback)
        local Toggle = Instance.new("Frame")
        Toggle.Size = UDim2.new(1, 0, 0, 60)
        Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Toggle.Parent = SettingsContent
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 6)
        ToggleCorner.Parent = Toggle
        
        local ToggleName = Instance.new("TextLabel")
        ToggleName.Size = UDim2.new(1, -120, 0, 20)
        ToggleName.Position = UDim2.new(0, 10, 0, 10)
        ToggleName.BackgroundTransparency = 1
        ToggleName.Font = Enum.Font.GothamBold
        ToggleName.Text = name
        ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleName.TextSize = 14
        ToggleName.TextXAlignment = Enum.TextXAlignment.Left
        ToggleName.Parent = Toggle
        
        local ToggleDesc = Instance.new("TextLabel")
        ToggleDesc.Size = UDim2.new(1, -120, 0, 20)
        ToggleDesc.Position = UDim2.new(0, 10, 0, 32)
        ToggleDesc.BackgroundTransparency = 1
        ToggleDesc.Font = Enum.Font.Gotham
        ToggleDesc.Text = desc
        ToggleDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
        ToggleDesc.TextSize = 12
        ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
        ToggleDesc.Parent = Toggle
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 50, 0, 26)
        ToggleButton.Position = UDim2.new(1, -60, 0.5, -13)
        ToggleButton.BackgroundColor3 = default and Color3.fromRGB(52, 199, 89) or Color3.fromRGB(60, 60, 60)
        ToggleButton.Text = ""
        ToggleButton.Parent = Toggle
        
        local ToggleBtnCorner = Instance.new("UICorner")
        ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
        ToggleBtnCorner.Parent = ToggleButton
        
        local ToggleKnob = Instance.new("Frame")
        ToggleKnob.Size = UDim2.new(0, 20, 0, 20)
        ToggleKnob.Position = default and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleKnob.Parent = ToggleButton
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(1, 0)
        KnobCorner.Parent = ToggleKnob
        
        local state = default
        ToggleButton.MouseButton1Click:Connect(function()
            state = not state
            if callback then callback(state) end
            
            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                BackgroundColor3 = state and Color3.fromRGB(52, 199, 89) or Color3.fromRGB(60, 60, 60)
            }):Play()
            
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = state and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
            }):Play()
        end)
        
        return Toggle
    end
    
    createToggle("Auto Kick", "Automatically kick on detection", self.Config.AutoKick, function(state)
        self.Config.AutoKick = state
    end)
    
    createToggle("Safe Mode", "Only log detections without kicking", self.Config.SafeMode, function(state)
        self.Config.SafeMode = state
    end)
    
    createToggle("Crash on Tamper", "Crash game if protection is disabled", self.Config.CrashOnTamper, function(state)
        self.Config.CrashOnTamper = state
    end)
    
    local function switchTab(tab)
        OverviewContent.Visible = false
        DetectionsContent.Visible = false
        SettingsContent.Visible = false
        
        OverviewTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        DetectionsTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        SettingsTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        
        OverviewLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        DetectionsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        SettingsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        
        if tab == "Overview" then
            OverviewContent.Visible = true
            OverviewTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            OverviewLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        elseif tab == "Detections" then
            DetectionsContent.Visible = true
            DetectionsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DetectionsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        elseif tab == "Settings" then
            SettingsContent.Visible = true
            SettingsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SettingsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
    
    OverviewTab.MouseButton1Click:Connect(function() switchTab("Overview") end)
    DetectionsTab.MouseButton1Click:Connect(function() switchTab("Detections") end)
    SettingsTab.MouseButton1Click:Connect(function() switchTab("Settings") end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        self.State.InterfaceActive = false
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
    
    ScreenGui.Parent = CoreGui
    self.State.InterfaceActive = true
    
    self.Interface = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        StatusValue = StatusValue,
        DetectionValue = DetectionValue,
        BlockedValue = BlockedValue,
        UptimeValue = UptimeValue,
        DetectionsContent = DetectionsContent
    }
    
    switchTab("Overview")
end

function HttpSpyAPI:LogDetection(detectionType, details)
    self.State.DetectionCount = self.State.DetectionCount + 1
    
    table.insert(self.State.DetectionLog, {
        Type = detectionType,
        Details = details,
        Time = os.date("%H:%M:%S"),
        Timestamp = tick()
    })
    
    if #self.State.DetectionLog > self.Config.MaxDetections then
        table.remove(self.State.DetectionLog, 1)
    end
    
    if self.State.InterfaceActive and self.Interface then
        self.Interface.DetectionValue.Text = tostring(self.State.DetectionCount)
        
        local LogEntry = Instance.new("Frame")
        LogEntry.Size = UDim2.new(1, 0, 0, 50)
        LogEntry.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        LogEntry.Parent = self.Interface.DetectionsContent
        
        local LogCorner = Instance.new("UICorner")
        LogCorner.CornerRadius = UDim.new(0, 6)
        LogCorner.Parent = LogEntry
        
        local LogType = Instance.new("TextLabel")
        LogType.Size = UDim2.new(1, -20, 0, 18)
        LogType.Position = UDim2.new(0, 10, 0, 8)
        LogType.BackgroundTransparency = 1
        LogType.Font = Enum.Font.GothamBold
        LogType.Text = "🔴 " .. detectionType
        LogType.TextColor3 = Color3.fromRGB(255, 59, 48)
        LogType.TextSize = 13
        LogType.TextXAlignment = Enum.TextXAlignment.Left
        LogType.Parent = LogEntry
        
        local LogDetails = Instance.new("TextLabel")
        LogDetails.Size = UDim2.new(1, -20, 0, 14)
        LogDetails.Position = UDim2.new(0, 10, 0, 28)
        LogDetails.BackgroundTransparency = 1
        LogDetails.Font = Enum.Font.Gotham
        LogDetails.Text = details
        LogDetails.TextColor3 = Color3.fromRGB(200, 200, 200)
        LogDetails.TextSize = 11
        LogDetails.TextXAlignment = Enum.TextXAlignment.Left
        LogDetails.TextTruncate = Enum.TextTruncate.AtEnd
        LogDetails.Parent = LogEntry
        
        self.Interface.DetectionsContent.CanvasPosition = Vector2.new(0, self.Interface.DetectionsContent.AbsoluteCanvasSize.Y)
    end
end

function HttpSpyAPI:UpdateUptime()
    if not self.State.InterfaceActive or not self.Interface then return end
    
    local uptime = math.floor(tick() - self.State.StartTime)
    local hours = math.floor(uptime / 3600)
    local minutes = math.floor((uptime % 3600) / 60)
    local seconds = uptime % 60
    
    self.Interface.UptimeValue.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

function HttpSpyAPI:HandleDetection(reason, detectionType)
    self:LogDetection(detectionType or "Unknown", reason)
    
    if self.Config.SafeMode then
        return
    end
    
    self.State.BlockedAttempts = self.State.BlockedAttempts + 1
    if self.Interface then
        self.Interface.BlockedValue.Text = tostring(self.State.BlockedAttempts)
    end
    
    if self.Config.AutoKick then
        Player:Kick(string.format([[
[ %s DETECTED ]
> %s

Detection Type: %s
Time: %s
Total Detections: %d

Support: https://www.msdoors.xyz/support
]], detectionType or "VIOLATION", reason, detectionType, os.date("%H:%M:%S"), self.State.DetectionCount))
    end
end

function HttpSpyAPI:HandleTampering()
    self:LogDetection("TAMPERING", "Critical: Protection system manipulation detected")
    
    if self.Config.CrashOnTamper then
        task.wait(0.1)
        createCrashLoop()
    else
        Player:Kick([[
[ CRITICAL PROTECTION TAMPERING ]
> System manipulation detected and blocked.

This action has been logged.
Support: https://www.msdoors.xyz/support
]])
    end
end

function HttpSpyAPI:DetectHttpExtraction()
    local env = getgenv and getgenv() or _G
    
    local httpMethods = {
        "httprequest", "http_request", "request",
        "HttpGet", "HttpPost", "HttpGetAsync", "HttpPostAsync",
        "GetAsync", "PostAsync", "RequestAsync", "JSONEncode", "JSONDecode"
    }
    
    for _, method in ipairs(httpMethods) do
        if rawget(env, method) then
            self:HandleDetection("HTTP method detected: " .. method, "HttpRequest")
        end
    end
    
    pcall(function()
        if env.syn and env.syn.request then
            self:HandleDetection("Synapse request API detected", "HttpRequest")
        end
        
        if env.http and type(env.http) == "table" then
            self:HandleDetection("HTTP table detected in environment", "HttpRequest")
        end
    end)
end

function HttpSpyAPI:DetectMetatableHooks()
    pcall(function()
        local originalSetmetatable = setmetatable
        local originalGetmetatable = getmetatable
        
        if getgenv then
            local env = getgenv()
            if rawget(env, "setmetatable") ~= originalSetmetatable then
                self:HandleDetection("setmetatable has been hooked", "SetMetatable")
            end
            if rawget(env, "getmetatable") ~= originalGetmetatable then
                self:HandleDetection("getmetatable has been hooked", "GetMetatable")
            end
        end
    end)
end

function HttpSpyAPI:DetectHookfunction()
    local env = getgenv and getgenv() or _G
    
    local hookMethods = {
        "hookfunction", "hookfunc", "replaceclosure",
        "hookmetamethod", "hookmethod", "detourhook"
    }
    
    for _, method in ipairs(hookMethods) do
        if rawget(env, method) then
            self:HandleDetection("Hook method detected: " .. method, "Hookfunction")
        end
    end
end

function HttpSpyAPI:DetectNewcclosure()
    local env = getgenv and getgenv() or _G
    
    if rawget(env, "newcclosure") or rawget(env, "newlclosure") then
        self:HandleDetection("Closure creation API detected", "Newcclosure")
    end
end

function HttpSpyAPI:DetectEnvironmentTamper()
    if not self.Config.ProtectionActive then
        self:HandleTampering()
        return
    end
    
    local env = getgenv and getgenv() or _G
    
    local suspiciousFuncs = {
        "getrawmetatable", "setrawmetatable",
        "getloadedmodules", "getcallingscript",
        "getgc", "getgenv", "getrenv",
        "debug", "getfenv", "setfenv"
    }
    
    for _, func in ipairs(suspiciousFuncs) do
        if rawget(env, func) then
            self:HandleDetection("Suspicious function detected: " .. func, "EnvironmentTamper")
        end
    end
end

function HttpSpyAPI:ProtectEnvironment()
    local env = getgenv and getgenv() or _G
    
    pcall(function()
        if newproxy then
            local originalNewproxy = newproxy
            self.State.ProtectedFunctions.newproxy = originalNewproxy
            
            rawset(env, "newproxy", function(...)
                if not self.Config.ProtectionActive then
                    self:HandleTampering()
                    return originalNewproxy(...)
                end
                
                local result = originalNewproxy(...)
                self.State.HookDetection[result] = {
                    Time = tick(),
                    Type = "newproxy"
                }
                return result
            end)
        end
    end)
    
    pcall(function()
        local originalSetmetatable = setmetatable
        self.State.ProtectedFunctions.setmetatable = originalSetmetatable
        
        rawset(env, "setmetatable", function(tbl, meta, ...)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return originalSetmetatable(tbl, meta, ...)
            end
            
            if meta and meta.__index then
                self.State.HookDetection[tbl] = {
                    Time = tick(),
                    Type = "setmetatable",
                    Meta = meta
                }
                
                pcall(function()
                    local metaStr = tostring(meta.__index):lower()
                    if metaStr:find("requestasync") or metaStr:find("httprequest") or metaStr:find("httpget") then
                        self:HandleDetection("HTTP metatable hook detected", "SetMetatable")
                    end
                end)
            end
            
            return originalSetmetatable(tbl, meta, ...)
        end)
    end)
    
    pcall(function()
        local originalGetmetatable = getmetatable
        self.State.ProtectedFunctions.getmetatable = originalGetmetatable
        
        rawset(env, "getmetatable", function(obj, ...)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return originalGetmetatable(obj, ...)
            end
            
            if self.State.HookDetection[obj] then
                self:HandleDetection("Attempt to access hooked object", "GetMetatable")
            end
            
            return originalGetmetatable(obj, ...)
        end)
    end)
end

function HttpSpyAPI:CheckTextContent(text)
    if not text or type(text) ~= "string" or #text == 0 then return false end
    
    local lowerText = text:lower()
    
    for _, link in ipairs(self.Config.Links) do
        if lowerText:find(link:lower(), 1, true) then
            return true, link
        end
    end
    
    local suspiciousPatterns = {
        "https?://[%w%.%-]+%.webhook%.office%.com",
        "https?://discord%.com/api/webhooks",
        "https?://[%w%.%-]+%.ngrok%.io",
        "https?://[%w%.%-]+%.herokuapp%.com",
        "https?://[%w%.%-]+%.glitch%.me",
        "requestbin", "webhook%.site", "pipedream"
    }
    
    for _, pattern in ipairs(suspiciousPatterns) do
        if lowerText:find(pattern) then
            return true, pattern
        end
    end
    
    return false
end

function HttpSpyAPI:ValidateText(obj)
    if not self.Config.ProtectionActive then
        self:HandleTampering()
        return
    end
    
    pcall(function()
        if obj.Text then
            local found, link = self:CheckTextContent(obj.Text)
            if found then
                self:HandleDetection("Suspicious link in Text: " .. (link or "Unknown"), "LinkDetection")
            end
        end
        
        if obj:IsA("TextBox") and obj.PlaceholderText then
            local found, link = self:CheckTextContent(obj.PlaceholderText)
            if found then
                self:HandleDetection("Suspicious link in Placeholder: " .. (link or "Unknown"), "LinkDetection")
            end
        end
    end)
end

function HttpSpyAPI:SetupTextMonitoring(obj)
    if self.State.ProcessedObjects[obj] then return end
    self.State.ProcessedObjects[obj] = true
    
    self:ValidateText(obj)
    
    local success, connection = pcall(function()
        return obj:GetPropertyChangedSignal("Text"):Connect(function()
            self:ValidateText(obj)
        end)
    end)
    
    if success and connection then
        table.insert(self.State.Connections, connection)
    end
    
    if obj:IsA("TextBox") then
        pcall(function()
            local signals = {"PlaceholderText", "Focused", "FocusLost"}
            for _, signal in ipairs(signals) do
                local conn = obj:GetPropertyChangedSignal(signal):Connect(function()
                    self:ValidateText(obj)
                end)
                table.insert(self.State.Connections, conn)
            end
        end)
    end
end

function HttpSpyAPI:MonitorGui(gui)
    if self.State.ProcessedGuis[gui] then return end
    self.State.ProcessedGuis[gui] = true
    
    for _, descendant in pairs(gui:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextBox") or descendant:IsA("TextButton") then
            self:SetupTextMonitoring(descendant)
        end
    end
    
    local conn = gui.DescendantAdded:Connect(function(descendant)
        if not self.Config.ProtectionActive then
            self:HandleTampering()
            return
        end
        
        if descendant:IsA("TextLabel") or descendant:IsA("TextBox") or descendant:IsA("TextButton") then
            self:SetupTextMonitoring(descendant)
        end
    end)
    
    table.insert(self.State.Connections, conn)
end

function HttpSpyAPI:MonitorContainer(container)
    if not container then return end
    
    for _, child in pairs(container:GetChildren()) do
        if child:IsA("ScreenGui") or child:IsA("Frame") or child:IsA("ScrollingFrame") then
            self:MonitorGui(child)
        end
    end
    
    local conn = container.ChildAdded:Connect(function(child)
        if not self.Config.ProtectionActive then
            self:HandleTampering()
            return
        end
        
        if child:IsA("ScreenGui") then
            task.wait(0.2)
            self:MonitorGui(child)
        elseif child:IsA("Frame") or child:IsA("ScrollingFrame") then
            self:MonitorGui(child)
        end
    end)
    
    table.insert(self.State.Connections, conn)
end

function HttpSpyAPI:StartProtection()
    self.Config.Enabled = true
    self.Config.ProtectionActive = true
    
    if self.Config.ShowInterface then
        self:CreateModernInterface()
    end
    
    self:ProtectEnvironment()
    self:DetectHttpExtraction()
    self:DetectMetatableHooks()
    self:DetectHookfunction()
    self:DetectNewcclosure()
    self:DetectEnvironmentTamper()
    
    task.wait(1)
    
    local PlayerGui = Player:WaitForChild("PlayerGui", 5)
    local containers = {
        PlayerGui,
        game:GetService("StarterGui"),
        game:GetService("ReplicatedStorage")
    }
    
    for _, container in ipairs(containers) do
        pcall(function()
            self:MonitorContainer(container)
        end)
    end
    
    pcall(function()
        local conn = CoreGui.ChildAdded:Connect(function(child)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return
            end
            
            if child:IsA("ScreenGui") then
                task.wait(0.3)
                self:MonitorGui(child)
            end
        end)
        
        table.insert(self.State.Connections, conn)
        
        for _, child in pairs(CoreGui:GetChildren()) do
            if child:IsA("ScreenGui") and child.Name ~= "CobaltHttpSpy" then
                self:MonitorGui(child)
            end
        end
    end)
    
    pcall(function()
        local conn = workspace.DescendantAdded:Connect(function(descendant)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return
            end
            
            if descendant:IsA("SurfaceGui") or descendant:IsA("BillboardGui") then
                task.wait(0.1)
                self:MonitorGui(descendant)
            end
        end)
        
        table.insert(self.State.Connections, conn)
    end)
    
    task.spawn(function()
        while self.Config.ProtectionActive do
            task.wait(self.Config.ScanInterval)
            
            if not self.Config or not self.Config.ProtectionActive or not self.State then
                self:HandleTampering()
                break
            end
            
            if self.State.ValidationHash ~= tostring(self.State.ValidationHash) then
                self:HandleTampering()
                break
            end
            
            self:UpdateUptime()
            
            pcall(function()
                if self.State.HookDetection then
                    for obj, data in pairs(self.State.HookDetection) do
                        if typeof(obj) == "userdata" and tick() - data.Time > 1 then
                            self:HandleDetection("Persistent hook detected: " .. data.Type, "HookDetection")
                        end
                    end
                end
            end)
            
            self:DetectHttpExtraction()
            self:DetectMetatableHooks()
            self:DetectEnvironmentTamper()
        end
    end)
    
    self:LogDetection("SYSTEM", "Protection initialized successfully")
end

function HttpSpyAPI:Enable()
    if self.Config.Enabled then return end
    
    self.Config.Enabled = true
    self.Config.ProtectionActive = true
    self.State.ValidationHash = tostring(math.random(100000, 999999))
    
    self:StartProtection()
    self:LogDetection("SYSTEM", "Protection manually enabled")
    
    if self.Interface then
        self.Interface.StatusValue.Text = "Active"
        self.Interface.StatusValue.TextColor3 = Color3.fromRGB(52, 199, 89)
    end
end

function HttpSpyAPI:Disable()
    self.Config.Enabled = false
    self.Config.ProtectionActive = false
    
    for _, connection in ipairs(self.State.Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    
    self.State.Connections = {}
    self:LogDetection("SYSTEM", "Protection manually disabled")
    
    if self.Interface then
        self.Interface.StatusValue.Text = "Disabled"
        self.Interface.StatusValue.TextColor3 = Color3.fromRGB(255, 59, 48)
    end
end

function HttpSpyAPI:SetSafeMode(enabled)
    self.Config.SafeMode = enabled
    self:LogDetection("SYSTEM", "Safe mode " .. (enabled and "enabled" or "disabled"))
end

function HttpSpyAPI:AddLink(link)
    table.insert(self.Config.Links, link)
    self:LogDetection("SYSTEM", "Added link to watchlist: " .. link)
end

function HttpSpyAPI:RemoveLink(link)
    for i, v in ipairs(self.Config.Links) do
        if v == link then
            table.remove(self.Config.Links, i)
            self:LogDetection("SYSTEM", "Removed link from watchlist: " .. link)
            return true
        end
    end
    return false
end

function HttpSpyAPI:GetStatus()
    return {
        Enabled = self.Config.Enabled,
        ProtectionActive = self.Config.ProtectionActive,
        SafeMode = self.Config.SafeMode,
        DetectionCount = self.State.DetectionCount,
        BlockedAttempts = self.State.BlockedAttempts,
        MonitoredObjects = 0,
        MonitoredGuis = 0,
        Uptime = math.floor(tick() - self.State.StartTime)
    }
end

function HttpSpyAPI:GetDetectionLog()
    return self.State.DetectionLog
end

function HttpSpyAPI:ClearLog()
    self.State.DetectionLog = {}
    self.State.DetectionCount = 0
    self.State.BlockedAttempts = 0
    
    if self.Interface then
        self.Interface.DetectionValue.Text = "0"
        self.Interface.BlockedValue.Text = "0"
        
        for _, child in pairs(self.Interface.DetectionsContent:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
    end
    
    self:LogDetection("SYSTEM", "Detection log cleared")
end

function HttpSpyAPI:ToggleInterface()
    if not self.Interface then
        self:CreateModernInterface()
    else
        self.Interface.MainFrame.Visible = not self.Interface.MainFrame.Visible
    end
end

function HttpSpyAPI:Destroy()
    self:Disable()
    
    if self.Interface and self.Interface.ScreenGui then
        self.Interface.ScreenGui:Destroy()
    end
    
    self.State = nil
    self.Config = nil
    self.Interface = nil
end

_G.HttpSpyAPI = HttpSpyAPI
_G.AntiHttpSpy = HttpSpyAPI

return HttpSpyAPI