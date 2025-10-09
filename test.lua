local HttpSpyAPI = {}
HttpSpyAPI.__index = HttpSpyAPI
HttpSpyAPI.Version = "2.0.0"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function createCrashLoop()
    for i = 1, 50 do
        task.spawn(function()
            while true do
                local t = {}
                for j = 1, 100000 do
                    table.insert(t, string.rep("CRASH", 1000))
                    task.spawn(function()
                        while true do
                            pcall(function() error(string.rep("X", 10000)) end)
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
        ShowInterface = config and config.ShowInterface or true,
        AutoKick = config and config.AutoKick or true,
        CrashOnTamper = config and config.CrashOnTamper or true
    }
    
    self.State = {
        Connections = {},
        ProcessedObjects = {},
        ProcessedGuis = {},
        HookDetection = {},
        ProtectedFunctions = {},
        DetectionLog = {},
        InterfaceActive = false,
        ValidationHash = tostring(math.random(100000, 999999))
    }
    
    self.DetectionMethods = {
        "HttpRequest",
        "SetMetatable",
        "GetMetatable",
        "Hookfunction",
        "Newcclosure",
        "Newproxy",
        "EnvironmentTamper",
        "MemoryManipulation"
    }
    
    return self
end

function HttpSpyAPI:CreateInterface()
    if not self.Config.ShowInterface then return end
    
    local existingGui = CoreGui:FindFirstChild("HttpSpyDetectionUI")
    if existingGui then existingGui:Destroy() end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HttpSpyDetectionUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Title.BorderSizePixel = 0
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🛡️ HTTP Spy Detection System"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = Title
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Size = UDim2.new(1, -20, 0, 30)
    StatusLabel.Position = UDim2.new(0, 10, 0, 50)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "Status: Active"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    StatusLabel.TextSize = 14
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.Parent = MainFrame
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "DetectionLog"
    ScrollFrame.Size = UDim2.new(1, -20, 1, -140)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 90)
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.Parent = MainFrame
    
    local ScrollCorner = Instance.new("UICorner")
    ScrollCorner.CornerRadius = UDim.new(0, 8)
    ScrollCorner.Parent = ScrollFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.Parent = ScrollFrame
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Size = UDim2.new(0, 180, 0, 35)
    ToggleButton.Position = UDim2.new(0, 10, 1, -45)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.Text = "Disable Protection"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.TextSize = 14
    ToggleButton.Parent = MainFrame
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleButton
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 180, 0, 35)
    CloseButton.Position = UDim2.new(1, -190, 1, -45)
    CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "Close Interface"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.Parent = MainFrame
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    ToggleButton.MouseButton1Click:Connect(function()
        if self.Config.Enabled then
            self:Disable()
            ToggleButton.Text = "Enable Protection"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
            StatusLabel.Text = "Status: Disabled"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        else
            self:Enable()
            ToggleButton.Text = "Disable Protection"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
            StatusLabel.Text = "Status: Active"
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        end
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui.Enabled = false
    end)
    
    ScreenGui.Parent = CoreGui
    self.State.InterfaceActive = true
    self.Interface = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        StatusLabel = StatusLabel,
        DetectionLog = ScrollFrame,
        ToggleButton = ToggleButton
    }
end

function HttpSpyAPI:LogDetection(detectionType, details)
    table.insert(self.State.DetectionLog, {
        Type = detectionType,
        Details = details,
        Time = os.date("%H:%M:%S")
    })
    
    if self.State.InterfaceActive and self.Interface then
        local LogEntry = Instance.new("TextLabel")
        LogEntry.Size = UDim2.new(1, -10, 0, 25)
        LogEntry.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
        LogEntry.BorderSizePixel = 0
        LogEntry.Font = Enum.Font.Code
        LogEntry.Text = string.format("[%s] %s: %s", os.date("%H:%M:%S"), detectionType, details)
        LogEntry.TextColor3 = Color3.fromRGB(255, 200, 100)
        LogEntry.TextSize = 12
        LogEntry.TextXAlignment = Enum.TextXAlignment.Left
        LogEntry.TextWrapped = true
        LogEntry.Parent = self.Interface.DetectionLog
        
        local LogCorner = Instance.new("UICorner")
        LogCorner.CornerRadius = UDim.new(0, 4)
        LogCorner.Parent = LogEntry
        
        self.Interface.DetectionLog.CanvasSize = UDim2.new(0, 0, 0, self.Interface.DetectionLog.UIListLayout.AbsoluteContentSize.Y)
    end
end

function HttpSpyAPI:HandleDetection(reason, detectionType)
    self:LogDetection(detectionType or "Unknown", reason)
    
    if self.Config.SafeMode then
        return
    end
    
    if self.Config.AutoKick then
        Player:Kick(string.format([[
[ %s DETECTED ]
> %s

Detecção: %s
Tempo: %s
Support: https://www.msdoors.xyz/support
]], detectionType or "VIOLATION", reason, detectionType, os.date("%H:%M:%S")))
    end
end

function HttpSpyAPI:HandleTampering()
    self:LogDetection("TAMPERING", "Protection system manipulation detected")
    
    if self.Config.CrashOnTamper then
        createCrashLoop()
    else
        Player:Kick([[
[ PROTECTION TAMPERING DETECTED ]
> System manipulation is strictly prohibited.

Support: https://www.msdoors.xyz/support
]])
    end
end

function HttpSpyAPI:DetectHttpExtraction()
    local env = getgenv and getgenv() or _G
    
    local httpMethods = {
        "httprequest", "http_request", "request",
        "HttpGet", "HttpPost", "HttpGetAsync", "HttpPostAsync",
        "GetAsync", "PostAsync", "RequestAsync"
    }
    
    for _, method in ipairs(httpMethods) do
        if env[method] and type(env[method]) == "function" then
            self:HandleDetection("HTTP extraction function detected: " .. method, "HttpRequest")
        end
    end
    
    pcall(function()
        if env.syn and env.syn.request then
            self:HandleDetection("Synapse request detected", "HttpRequest")
        end
        
        if env.http and env.http.request then
            self:HandleDetection("HTTP request API detected", "HttpRequest")
        end
        
        if env.fluxus and env.fluxus.request then
            self:HandleDetection("Fluxus request detected", "HttpRequest")
        end
        
        if env.arceus and env.arceus.request then
            self:HandleDetection("Arceus request detected", "HttpRequest")
        end
    end)
    
    local success, originalRequestAsync = pcall(function()
        return HttpService.RequestAsync
    end)
    
    if success then
        self.State.ProtectedFunctions.RequestAsync = originalRequestAsync
    end
end

function HttpSpyAPI:DetectMetatableHooks()
    local env = getgenv and getgenv() or _G
    
    pcall(function()
        local originalSetmetatable = setmetatable
        local originalGetmetatable = getmetatable
        
        self.State.ProtectedFunctions.setmetatable = originalSetmetatable
        self.State.ProtectedFunctions.getmetatable = originalGetmetatable
        
        if env.setmetatable ~= originalSetmetatable then
            self:HandleDetection("setmetatable hook detected", "SetMetatable")
        end
        
        if env.getmetatable ~= originalGetmetatable then
            self:HandleDetection("getmetatable hook detected", "GetMetatable")
        end
    end)
end

function HttpSpyAPI:DetectHookfunction()
    local env = getgenv and getgenv() or _G
    
    if env.hookfunction or env.hookfunc or env.replaceclosure then
        self:HandleDetection("Hookfunction API detected", "Hookfunction")
    end
    
    if env.hookmetamethod or env.hookmethod then
        self:HandleDetection("Metamethod hooking detected", "Hookfunction")
    end
    
    if env.detourhook or env.restorehook then
        self:HandleDetection("Detour hooking detected", "Hookfunction")
    end
end

function HttpSpyAPI:DetectNewcclosure()
    local env = getgenv and getgenv() or _G
    
    if env.newcclosure or env.newlclosure then
        self:HandleDetection("Closure creation API detected", "Newcclosure")
    end
    
    if env.clonefunction or env.cloneref then
        self:HandleDetection("Function cloning detected", "Newcclosure")
    end
end

function HttpSpyAPI:ProtectEnvironment()
    local env = getgenv and getgenv() or _G
    
    pcall(function()
        if newproxy then
            local originalNewproxy = newproxy
            self.State.ProtectedFunctions.newproxy = originalNewproxy
            
            env.newproxy = function(...)
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
            end
        end
    end)
    
    pcall(function()
        local originalSetmetatable = setmetatable
        self.State.ProtectedFunctions.setmetatable = originalSetmetatable
        
        env.setmetatable = function(tbl, meta, ...)
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
        end
    end)
    
    pcall(function()
        local originalGetmetatable = getmetatable
        self.State.ProtectedFunctions.getmetatable = originalGetmetatable
        
        env.getmetatable = function(obj, ...)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return originalGetmetatable(obj, ...)
            end
            
            if self.State.HookDetection[obj] then
                self:HandleDetection("Attempt to access hooked object metatable", "GetMetatable")
            end
            
            return originalGetmetatable(obj, ...)
        end
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
        "requestbin",
        "webhook%.site",
        "pastebin%.com/raw",
        "hastebin",
        "rentry%.co"
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
                self:HandleDetection("Suspicious link found in Text: " .. (link or "Unknown"), "LinkDetection")
            end
        end
        
        if obj:IsA("TextBox") and obj.PlaceholderText then
            local found, link = self:CheckTextContent(obj.PlaceholderText)
            if found then
                self:HandleDetection("Suspicious link found in PlaceholderText: " .. (link or "Unknown"), "LinkDetection")
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
            local placeholderConn = obj:GetPropertyChangedSignal("PlaceholderText"):Connect(function()
                self:ValidateText(obj)
            end)
            table.insert(self.State.Connections, placeholderConn)
            
            local focusedConn = obj.Focused:Connect(function()
                self:ValidateText(obj)
            end)
            table.insert(self.State.Connections, focusedConn)
            
            local focusLostConn = obj.FocusLost:Connect(function()
                self:ValidateText(obj)
            end)
            table.insert(self.State.Connections, focusLostConn)
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
    
    local descendantConn = gui.DescendantAdded:Connect(function(descendant)
        if not self.Config.ProtectionActive then
            self:HandleTampering()
            return
        end
        
        if descendant:IsA("TextLabel") or descendant:IsA("TextBox") or descendant:IsA("TextButton") then
            self:SetupTextMonitoring(descendant)
        end
    end)
    
    table.insert(self.State.Connections, descendantConn)
end

function HttpSpyAPI:MonitorContainer(container)
    if not container then return end
    
    for _, child in pairs(container:GetChildren()) do
        if child:IsA("ScreenGui") or child:IsA("Frame") or child:IsA("ScrollingFrame") then
            self:MonitorGui(child)
        end
    end
    
    local childConn = container.ChildAdded:Connect(function(child)
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
    
    table.insert(self.State.Connections, childConn)
end

function HttpSpyAPI:StartProtection()
    self.Config.Enabled = true
    self.Config.ProtectionActive = true
    
    self:ProtectEnvironment()
    self:DetectHttpExtraction()
    self:DetectMetatableHooks()
    self:DetectHookfunction()
    self:DetectNewcclosure()
    
    task.wait(1)
    
    local containers = {PlayerGui, game:GetService("StarterGui"), ReplicatedStorage}
    
    for _, container in ipairs(containers) do
        pcall(function()
            self:MonitorContainer(container)
        end)
    end
    
    pcall(function()
        local coreChildConn = CoreGui.ChildAdded:Connect(function(child)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return
            end
            
            if child:IsA("ScreenGui") and child.Name ~= "HttpSpyDetectionUI" then
                task.wait(0.3)
                self:MonitorGui(child)
            end
        end)
        
        table.insert(self.State.Connections, coreChildConn)
        
        for _, child in pairs(CoreGui:GetChildren()) do
            if child:IsA("ScreenGui") and child.Name ~= "HttpSpyDetectionUI" then
                self:MonitorGui(child)
            end
        end
    end)
    
    pcall(function()
        local workspaceConn = workspace.DescendantAdded:Connect(function(descendant)
            if not self.Config.ProtectionActive then
                self:HandleTampering()
                return
            end
            
            if descendant:IsA("SurfaceGui") or descendant:IsA("BillboardGui") then
                task.wait(0.1)
                self:MonitorGui(descendant)
            end
        end)
        
        table.insert(self.State.Connections, workspaceConn)
    end)
    
    if self.Config.ShowInterface then
        self:CreateInterface()
    end
    
    self:LogDetection("SYSTEM", "Protection system initialized successfully")
end

function HttpSpyAPI:Enable()
    if self.Config.Enabled then return end
    
    self.Config.Enabled = true
    self.Config.ProtectionActive = true
    self.State.ValidationHash = tostring(math.random(100000, 999999))
    
    self:StartProtection()
    self:LogDetection("SYSTEM", "Protection enabled")
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
    self:LogDetection("SYSTEM", "Protection disabled")
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
        DetectionCount = #self.State.DetectionLog,
        MonitoredObjects = #self.State.ProcessedObjects,
        MonitoredGuis = #self.State.ProcessedGuis
    }
end

_G.HttpSpyAPI = HttpSpyAPI
return HttpSpyAPI
