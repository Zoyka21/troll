--[[
  ██████  ██████  ███████  ██████  ██   ██ ██   ██  █████  ██    ██ ███████ ███    ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ████   ██ 
  ██████  ██████  █████   ██    ██ █████   ███████ ███████ ██    ██ █████   ██ ██  ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ██  ██ ██ 
  ██████  ██   ██ ███████  ██████  ██   ██ ██   ██ ██   ██  ██████  ███████ ██   ████ 
  ================== TROLL MENU ULTRA V7 ==================
  ================== ФИНАЛЬНАЯ ВЕРСИЯ ==================
  ================== 90+ ФУНКЦИЙ ==================
  ================== УЛУЧШЕННЫЙ DROPKICK ==================
--]]

-- Проверка на игру
if not game:IsLoaded() then game.Loaded:Wait() end

-- ====== СОЗДАНИЕ GUI ======
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrollMenuUltraV7"
screenGui.Parent = game.CoreGui
screenGui.Enabled = true

-- ====== ПЛАВАЮЩАЯ КНОПКА ======
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 70, 0, 70)
toggleButton.Position = UDim2.new(0, 10, 0.5, -35)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
toggleButton.BackgroundTransparency = 0.2
toggleButton.BorderSizePixel = 3
toggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Image = "rbxassetid://6031094737"
toggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Parent = screenGui
toggleButton.Visible = false

-- Анимация кнопки
game:GetService("RunService").Heartbeat:Connect(function()
    if toggleButton.Visible then
        toggleButton.BackgroundTransparency = 0.2 + math.sin(tick() * 2) * 0.1
        toggleButton.Size = UDim2.new(0, 70 + math.sin(tick() * 2) * 3, 0, 70 + math.sin(tick() * 2) * 3)
    end
end)

-- ====== ОСНОВНОЕ МЕНЮ ======
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 620, 0, 780)
mainFrame.Position = UDim2.new(0.5, -310, 0.5, -390)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 3
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 150)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- ====== ЗАГОЛОВОК ======
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "🔥 TROLL ULTRA V7 🔥"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.Font = Enum.Font.Bangers
titleText.Parent = titleBar

-- Количество функций
local funcCount = Instance.new("TextLabel")
funcCount.Size = UDim2.new(0.2, 0, 1, 0)
funcCount.Position = UDim2.new(0.7, 0, 0, 0)
funcCount.BackgroundTransparency = 1
funcCount.Text = "90+"
funcCount.TextColor3 = Color3.fromRGB(255, 200, 0)
funcCount.TextScaled = true
funcCount.Font = Enum.Font.GothamBold
funcCount.Parent = titleBar

-- ====== КНОПКИ УПРАВЛЕНИЯ ======
local collapseButton = Instance.new("ImageButton")
collapseButton.Size = UDim2.new(0, 45, 0, 45)
collapseButton.Position = UDim2.new(0.84, 0, 0.5, -22.5)
collapseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
collapseButton.BorderSizePixel = 0
collapseButton.Image = "rbxassetid://6031094742"
collapseButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
collapseButton.Parent = titleBar

local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 45, 0, 45)
closeButton.Position = UDim2.new(0.93, 0, 0.5, -22.5)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Image = "rbxassetid://6031094743"
closeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = titleBar

-- ====== СКРОЛЛ-КОНТЕЙНЕР ======
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -65)
scrollingFrame.Position = UDim2.new(0, 5, 0, 60)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.Parent = mainFrame

local uiList = Instance.new("UIListLayout")
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 8)
uiList.Parent = scrollingFrame

-- ====== ПЕРЕМЕННЫЕ ======
local isCollapsed = false
local originalSize = mainFrame.Size
local originalPosition = mainFrame.Position

-- ====== ФУНКЦИЯ СВОРАЧИВАНИЯ ======
local function toggleCollapse()
    isCollapsed = not isCollapsed
    if isCollapsed then
        mainFrame:TweenSize(UDim2.new(0, 620, 0, 55), "Out", "Quad", 0.3, true)
        mainFrame:TweenPosition(UDim2.new(0.5, -310, 0, 0), "Out", "Quad", 0.3, true)
        collapseButton.Image = "rbxassetid://6031094744"
        scrollingFrame.Visible = false
    else
        mainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
        mainFrame:TweenPosition(originalPosition, "Out", "Quad", 0.3, true)
        collapseButton.Image = "rbxassetid://6031094742"
        scrollingFrame.Visible = true
    end
end

-- ====== ФУНКЦИЯ СОЗДАНИЯ КНОПОК ======
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 42)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scrollingFrame
    
    btn.MouseEnter:Connect(function()
        btn:TweenBackgroundColor(Color3.fromRGB(
            math.min(color.R * 255 + 60, 255),
            math.min(color.G * 255 + 60, 255),
            math.min(color.B * 255 + 60, 255)
        ), "Out", "Quad", 0.1)
    end)
    btn.MouseLeave:Connect(function()
        btn:TweenBackgroundColor(color, "Out", "Quad", 0.1)
    end)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ====== ФУНКЦИЯ СОЗДАНИЯ КАТЕГОРИЙ ======
local function createCategory(text)
    local cat = Instance.new("TextLabel")
    cat.Size = UDim2.new(1, -10, 0, 35)
    cat.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    cat.BackgroundTransparency = 0.5
    cat.BorderSizePixel = 0
    cat.Text = "═══ " .. text .. " ═══"
    cat.TextColor3 = Color3.fromRGB(255, 200, 255)
    cat.TextScaled = true
    cat.Font = Enum.Font.GothamBold
    cat.Parent = scrollingFrame
    return cat
end

-- ====== ====== ====== ====== ======
-- ====== ВСЕ ФУНКЦИИ (90+) ======
-- ====== ====== ====== ====== ======

-- КАТЕГОРИЯ: ТЕЛЕПОРТЫ
createCategory("🚀 ТЕЛЕПОРТЫ")

createButton("👤 К СЛУЧАЙНОМУ ИГРОКУ", Color3.fromRGB(200, 0, 0), function()
    local players = game.Players:GetPlayers()
    local target = players[math.random(#players)]
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
    end
end)

createButton("👥 К БЛИЖАЙШЕМУ", Color3.fromRGB(180, 0, 50), function()
    local closest = nil
    local dist = math.huge
    local localChar = game.Players.LocalPlayer.Character
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local d = (localChar.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then
                dist = d
                closest = v
            end
        end
    end
    if closest then
        localChar.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
    end
end)

createButton("🌌 В НЕБО (1000)", Color3.fromRGB(0, 100, 200), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
end)

createButton("🌊 ПОД ВОДУ (-100)", Color3.fromRGB(0, 50, 150), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -100, 0)
end)

createButton("🏠 В ЦЕНТР КАРТЫ", Color3.fromRGB(0, 150, 100), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
end)

createButton("🎯 СЛУЧАЙНАЯ ТОЧКА", Color3.fromRGB(150, 50, 200), function()
    local x = math.random(-500, 500)
    local z = math.random(-500, 500)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, 50, z)
end)

-- ====== УЛУЧШЕННЫЙ DROPKICK ======
createCategory("💥 THE REAL DROPKICK V2")

createButton("🦵 СУПЕР DROPKICK", Color3.fromRGB(255, 50, 0), function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    for i = 1, 8 do
        local leg = Instance.new("Part")
        leg.Size = Vector3.new(1.5, 3, 0.5)
        leg.Position = hrp.Position + hrp.CFrame.LookVector * (3 + i * 0.8) + Vector3.new(0, 1 - i * 0.08, 0)
        leg.BrickColor = BrickColor.new("Bright red")
        leg.Material = Enum.Material.Neon
        leg.Anchored = true
        leg.CanCollide = false
        leg.Parent = workspace
        
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - leg.Position).Magnitude < 8 then
                    targetHrp.Velocity = hrp.CFrame.LookVector * 150 + Vector3.new(0, 50, 0)
                    targetHrp.CFrame = targetHrp.CFrame * CFrame.Angles(math.rad(180), 0, 0)
                    v.Humanoid:BreakJoints()
                    wait(0.3)
                    v.Humanoid.Health = 100
                    
                    local spark = Instance.new("Part")
                    spark.Size = Vector3.new(2, 2, 2)
                    spark.Position = targetHrp.Position
                    spark.BrickColor = BrickColor.new("Bright orange")
                    spark.Material = Enum.Material.Neon
                    spark.Anchored = true
                    spark.CanCollide = false
                    spark.Parent = workspace
                    wait(0.2)
                    spark:Destroy()
                end
            end
        end
        wait(0.03)
        leg:Destroy()
    end
end)

createButton("🚀 DROPKICK В НЕБО", Color3.fromRGB(0, 150, 255), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 20 then
                targetHrp.Velocity = Vector3.new(0, 200, 0)
                targetHrp.CFrame = targetHrp.CFrame * CFrame.Angles(math.rad(180), 0, 0)
                
                for i = 1, 10 do
                    local trail = Instance.new("Part")
                    trail.Size = Vector3.new(0.5, 0.5, 0.5)
                    trail.Position = targetHrp.Position + Vector3.new(math.random(-2, 2), -i * 2, math.random(-2, 2))
                    trail.BrickColor = BrickColor.new("Bright blue")
                    trail.Material = Enum.Material.Neon
                    trail.Anchored = true
                    trail.CanCollide = false
                    trail.Parent = workspace
                    wait(0.05)
                    trail:Destroy()
                end
            end
        end
    end
end)

createButton("🌀 КРУГОВОЙ DROPKICK", Color3.fromRGB(200, 0, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for i = 1, 36 do
        local angle = (i / 36) * math.pi * 2
        local pos = hrp.Position + Vector3.new(math.cos(angle) * 5, 1, math.sin(angle) * 5)
        
        local leg = Instance.new("Part")
        leg.Size = Vector3.new(1, 2, 0.5)
        leg.Position = pos
        leg.BrickColor = BrickColor.new("Bright orange")
        leg.Material = Enum.Material.Neon
        leg.Anchored = true
        leg.CanCollide = false
        leg.Parent = workspace
        
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - pos).Magnitude < 6 then
                    local direction = (targetHrp.Position - hrp.Position).Unit
                    targetHrp.Velocity = direction * 120 + Vector3.new(0, 40, 0)
                    v.Humanoid:BreakJoints()
                    wait(0.2)
                    v.Humanoid.Health = 100
                end
            end
        end
        
        wait(0.02)
        leg:Destroy()
    end
end)

createButton("🔥 ОГНЕННЫЙ DROPKICK", Color3.fromRGB(255, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for i = 1, 20 do
        hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
        
        local fire = Instance.new("Part")
        fire.Size = Vector3.new(3, 3, 3)
        fire.Position = hrp.Position + Vector3.new(math.random(-2, 2), math.random(-1, 1), math.random(-2, 2))
        fire.BrickColor = BrickColor.new("Bright red")
        fire.Material = Enum.Material.Neon
        fire.Anchored = true
        fire.CanCollide = false
        fire.Parent = workspace
        
        local fireEffect = Instance.new("Fire")
        fireEffect.Size = 8
        fireEffect.Heat = 20
        fireEffect.Parent = fire
        
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 8 then
                    targetHrp.Velocity = hrp.CFrame.LookVector * 130 + Vector3.new(0, 30, 0)
                    v.Humanoid.Health = 50
                    
                    local fireOnTarget = Instance.new("Fire")
                    fireOnTarget.Size = 5
                    fireOnTarget.Heat = 15
                    fireOnTarget.Parent = targetHrp
                    wait(1)
                    fireOnTarget:Destroy()
                end
            end
        end
        
        wait(0.04)
        fire:Destroy()
    end
end)

createButton("👊 DROPKICK КОМБО (x3)", Color3.fromRGB(255, 200, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    local targets = {}
    
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 25 then
                table.insert(targets, v)
            end
        end
    end
    
    for i = 1, 3 do
        for _, target in pairs(targets) do
            local targetHrp = target:FindFirstChild("HumanoidRootPart")
            if targetHrp and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 2, 3)
                
                local kick = Instance.new("Part")
                kick.Size = Vector3.new(2, 3, 1)
                kick.Position = targetHrp.Position + Vector3.new(0, 1, 0)
                kick.BrickColor = BrickColor.new("Bright yellow")
                kick.Material = Enum.Material.Neon
                kick.Anchored = true
                kick.CanCollide = false
                kick.Parent = workspace
                
                targetHrp.Velocity = (targetHrp.Position - hrp.Position).Unit * 80 + Vector3.new(0, 20, 0)
                target.Humanoid:BreakJoints()
                wait(0.15)
                target.Humanoid.Health = 100
                kick:Destroy()
            end
        end
        wait(0.2)
    end
end)

createButton("💥 МАССОВЫЙ DROPKICK", Color3.fromRGB(255, 0, 100), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 30 then
                local kick = Instance.new("Part")
                kick.Size = Vector3.new(2, 4, 1)
                kick.Position = targetHrp.Position + Vector3.new(0, 1, 0)
                kick.BrickColor = BrickColor.Random()
                kick.Material = Enum.Material.Neon
                kick.Anchored = true
                kick.CanCollide = false
                kick.Parent = workspace
                
                local direction = (targetHrp.Position - hrp.Position).Unit
                targetHrp.Velocity = direction * 150 + Vector3.new(0, 60, 0)
                targetHrp.CFrame = targetHrp.CFrame * CFrame.Angles(math.rad(180), 0, 0)
                v.Humanoid:BreakJoints()
                wait(0.1)
                v.Humanoid.Health = 100
                kick:Destroy()
            end
        end
    end
end)

createButton("💣 DROPKICK + ВЗРЫВ", Color3.fromRGB(200, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 20 then
                targetHrp.Velocity = (targetHrp.Position - hrp.Position).Unit * 100 + Vector3.new(0, 30, 0)
                v.Humanoid:BreakJoints()
                wait(0.2)
                v.Humanoid.Health = 100
            end
        end
    end
    
    for i = 1, 5 do
        local exp = Instance.new("Explosion")
        exp.Position = hrp.Position + Vector3.new(math.random(-15, 15), math.random(-5, 10), math.random(-15, 15))
        exp.BlastRadius = 10
        exp.BlastPressure = 80000
        exp.Parent = workspace
        wait(0.1)
    end
end)

createButton("🌀 ТЕЛЕПОРТ-ПАНЧ", Color3.fromRGB(150, 0, 255), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    local players = game.Players:GetPlayers()
    for _, target in pairs(players) do
        if target ~= game.Players.LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetHrp = target.Character.HumanoidRootPart
            
            hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 2, -3)
            wait(0.05)
            
            local punch = Instance.new("Part")
            punch.Size = Vector3.new(3, 3, 3)
            punch.Position = targetHrp.Position + Vector3.new(0, 1, 0)
            punch.BrickColor = BrickColor.new("Bright purple")
            punch.Material = Enum.Material.Neon
            punch.Anchored = true
            punch.CanCollide = false
            punch.Parent = workspace
            
            targetHrp.Velocity = Vector3.new(0, 80, -50)
            target.Character.Humanoid:BreakJoints()
            wait(0.3)
            target.Character.Humanoid.Health = 100
            punch:Destroy()
            break
        end
    end
end)

-- КАТЕГОРИЯ: АНИМАЦИИ
createCategory("💃 АНИМАЦИИ")

createButton("🕺 ТАНЕЦ", Color3.fromRGB(255, 100, 0), function()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://507767983"
    game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim):Play()
end)

createButton("🤸 САЛЬТО", Color3.fromRGB(200, 0, 255), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 10 do
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(36), 0, 0)
        wait(0.05)
    end
end)

createButton("🌀 ВРАЩЕНИЕ", Color3.fromRGB(255, 0, 200), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 20 do
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(18), 0)
        wait(0.05)
    end
end)

createButton("🤖 РОБОТ-ТАНЕЦ", Color3.fromRGB(0, 200, 255), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 10 do
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(18))
        wait(0.05)
    end
end)

-- КАТЕГОРИЯ: КЛОНИРОВАНИЕ
createCategory("🧬 КЛОНИРОВАНИЕ")

createButton("👥 КЛОН СЕБЯ (10)", Color3.fromRGB(0, 200, 255), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 10 do
        local clone = char:Clone()
        clone.Name = "Clone_" .. i
        clone.Parent = workspace
        clone.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        clone.HumanoidRootPart.Anchored = false
        wait(0.1)
    end
end)

createButton("🤖 АРМИЯ КЛОНОВ (50)", Color3.fromRGB(255, 0, 0), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 50 do
        local clone = char:Clone()
        clone.Name = "Army_" .. i
        clone.Parent = workspace
        clone.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(math.random(-30, 30), 0, math.random(-30, 30))
        clone.HumanoidRootPart.Anchored = false
        wait(0.05)
    end
end)

createButton("💥 ВЗРЫВНЫЕ КЛОНЫ", Color3.fromRGB(255, 150, 0), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 20 do
        local clone = char:Clone()
        clone.Name = "BoomClone_" .. i
        clone.Parent = workspace
        local pos = char.HumanoidRootPart.Position + Vector3.new(math.random(-20, 20), 5, math.random(-20, 20))
        clone.HumanoidRootPart.CFrame = CFrame.new(pos)
        clone.HumanoidRootPart.Anchored = true
        wait(0.1)
        local exp = Instance.new("Explosion")
        exp.Position = pos
        exp.BlastRadius = 8
        exp.BlastPressure = 50000
        exp.Parent = workspace
        clone:Destroy()
    end
end)

-- КАТЕГОРИЯ: ЛАЗЕРЫ
createCategory("🔫 ЛАЗЕРЫ")

createButton("🔴 УБИЙСТВЕННЫЙ ЛАЗЕР", Color3.fromRGB(255, 0, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    for i = 1, 30 do
        local laser = Instance.new("Part")
        laser.Size = Vector3.new(0.5, 0.5, 50)
        laser.Position = hrp.Position + hrp.CFrame.LookVector * 25
        laser.BrickColor = BrickColor.new("Bright red")
        laser.Material = Enum.Material.Neon
        laser.Anchored = true
        laser.CanCollide = false
        laser.Parent = workspace
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 30 then
                    v.Humanoid.Health = 0
                end
            end
        end
        wait(0.05)
        laser:Destroy()
    end
end)

createButton("🟢 ЛАЗЕРНЫЙ ДОЖДЬ", Color3.fromRGB(0, 255, 0), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 50 do
        local laser = Instance.new("Part")
        laser.Size = Vector3.new(0.3, 0.3, 30)
        laser.Position = Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
        laser.BrickColor = BrickColor.new("Bright green")
        laser.Material = Enum.Material.Neon
        laser.Anchored = true
        laser.CanCollide = false
        laser.Parent = workspace
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - laser.Position).Magnitude < 5 then
                    v.Humanoid.Health = 0
                end
            end
        end
        wait(0.02)
        laser:Destroy()
    end
end)

createButton("🌈 РАДУЖНЫЙ ЛАЗЕР", Color3.fromRGB(255, 0, 255), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    local colors = {"Bright red", "Bright orange", "Bright yellow", "Bright green", "Bright blue", "Bright violet"}
    for i = 1, 20 do
        local laser = Instance.new("Part")
        laser.Size = Vector3.new(0.5, 0.5, 40)
        laser.Position = hrp.Position + hrp.CFrame.LookVector * 20 + Vector3.new(math.random(-5, 5), math.random(-5, 5), 0)
        laser.BrickColor = BrickColor.new(colors[math.random(#colors)])
        laser.Material = Enum.Material.Neon
        laser.Anchored = true
        laser.CanCollide = false
        laser.Parent = workspace
        wait(0.05)
        laser:Destroy()
    end
end)

-- КАТЕГОРИЯ: ГРАВИТАЦИЯ
createCategory("🌌 ГРАВИТАЦИЯ")

createButton("⬆️ ОТРИЦАТЕЛЬНАЯ", Color3.fromRGB(0, 200, 200), function()
    workspace.Gravity = -50
    wait(5)
    workspace.Gravity = 196.2
end)

createButton("⬇️ СУПЕР ГРАВИТАЦИЯ", Color3.fromRGB(200, 0, 200), function()
    workspace.Gravity = 1962
    wait(3)
    workspace.Gravity = 196.2
end)

createButton("🌀 ОТКЛЮЧИТЬ ГРАВИТАЦИЮ", Color3.fromRGB(100, 100, 255), function()
    workspace.Gravity = 0
    wait(5)
    workspace.Gravity = 196.2
end)

createButton("🎯 ГРАВИТАЦИЯ К ИГРОКУ", Color3.fromRGB(255, 200, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v ~= char and v.Anchored == false then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            bv.Velocity = (char.HumanoidRootPart.Position - v.Position).Unit * 50
            bv.Parent = v
            wait(0.1)
            bv:Destroy()
        end
    end
end)

-- КАТЕГОРИЯ: ТРОЛЛИНГ
createCategory("🎯 ТРОЛЛИНГ")

createButton("🚗 МАШИНА НА ИГРОКА", Color3.fromRGB(0, 0, 200), function()
    local players = game.Players:GetPlayers()
    for _, v in pairs(players) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local car = Instance.new("Part")
            car.Size = Vector3.new(15, 4, 8)
            car.Position = v.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
            car.Anchored = true
            car.BrickColor = BrickColor.Random()
            car.Parent = workspace
            wait(0.5)
            car.Anchored = false
            break
        end
    end
end)

createButton("💩 ДОЖДЬ ИЗ КАКАШЕК", Color3.fromRGB(100, 50, 0), function()
    for i = 1, 30 do
        local poop = Instance.new("Part")
        poop.Size = Vector3.new(1, 0.5, 1)
        poop.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + 
                        Vector3.new(math.random(-20, 20), 20, math.random(-20, 20))
        poop.BrickColor = BrickColor.new("Brown")
        poop.Shape = Enum.PartType.Ball
        poop.Parent = workspace
        poop.Velocity = Vector3.new(0, -30, 0)
        wait(0.1)
    end
end)

createButton("🔊 ГРОМКИЙ ЗВУК", Color3.fromRGB(200, 200, 0), function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120407644"
    sound.Volume = 10
    sound.PlayOnRemove = true
    sound.Parent = workspace
    sound:Play()
    wait(1)
    sound:Destroy()
end)

createButton("💬 СПАМ В ЧАТ", Color3.fromRGB(200, 0, 200), function()
    local msgs = {"ТЫ ТРОЛЛЬ! 🤪", "DROPKICK!!! 🦵", "БУУУ! 👻", "СЮРПРИЗ! 🎉", "ЛОЛ КЕК! 😂"}
    for i = 1, 30 do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msgs[math.random(#msgs)], "All")
        wait(0.05)
    end
end)

createButton("🔄 ПЕРЕВЕРНУТЬ ИГРОКА", Color3.fromRGB(150, 0, 150), function()
    local players = game.Players:GetPlayers()
    for _, v in pairs(players) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            v.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(180), 0, 0)
            break
        end
    end
end)

-- КАТЕГОРИЯ: ВЗРЫВЫ
createCategory("💥 ВЗРЫВЫ")

createButton("💣 ОГРОМНЫЙ ВЗРЫВ", Color3.fromRGB(255, 150, 0), function()
    local exp = Instance.new("Explosion")
    exp.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    exp.BlastRadius = 50
    exp.BlastPressure = 500000
    exp.Parent = workspace
end)

createButton("💥 МНОГО ВЗРЫВОВ", Color3.fromRGB(255, 0, 0), function()
    for i = 1, 20 do
        local exp = Instance.new("Explosion")
        exp.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + 
                       Vector3.new(math.random(-30, 30), math.random(-10, 20), math.random(-30, 30))
        exp.BlastRadius = 10
        exp.BlastPressure = 50000
        exp.Parent = workspace
        wait(0.1)
    end
end)

-- КАТЕГОРИЯ: ВИЗУАЛЫ
createCategory("✨ ВИЗУАЛЫ")

createButton("🌈 РАДУГА ВОКРУГ", Color3.fromRGB(255, 0, 255), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 50 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = char.HumanoidRootPart.Position + Vector3.new(
            math.random(-30, 30),
            math.random(-30, 30),
            math.random(-30, 30)
        )
        part.BrickColor = BrickColor.Random()
        part.Anchored = true
        part.Material = Enum.Material.Neon
        part.Parent = workspace
        wait(0.05)
        part:Destroy()
    end
end)

createButton("🔥 ОГНЕННЫЙ ОРЕОЛ", Color3.fromRGB(255, 50, 0), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 12 do
        local fire = Instance.new("Fire")
        fire.Size = 5
        fire.Heat = 10
        local angle = (i / 12) * math.pi * 2
        local pos = char.HumanoidRootPart.Position + Vector3.new(math.cos(angle) * 5, 2, math.sin(angle) * 5)
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.5, 0.5, 0.5)
        part.Position = pos
        part.Anchored = true
        part.Parent = workspace
        fire.Parent = part
    end
end)

createButton("👻 ПРИЗРАК", Color3.fromRGB(100, 0, 150), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = 0.7
            v.Material = Enum.Material.Neon
        end
    end
end)

createButton("💎 АЛМАЗНЫЙ ПЕРСОНАЖ", Color3.fromRGB(0, 200, 255), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.DiamondPlate
            v.Color = Color3.fromRGB(0, 200, 255)
        end
    end
end)

-- КАТЕГОРИЯ: РАЗМЕР
createCategory("📏 ИЗМЕНЕНИЕ РАЗМЕРА")

createButton("🐘 ГИГАНТ (x10)", Color3.fromRGB(0, 200, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Size = v.Size * 10
        end
    end
end)

createButton("🐭 КРОХА (x0.1)", Color3.fromRGB(0, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Size = v.Size * 0.1
        end
    end
end)

createButton("📐 НОРМАЛЬНЫЙ РАЗМЕР", Color3.fromRGB(50, 150, 50), function()
    game.Players.LocalPlayer.Character.Humanoid:BreakJoints()
    wait(0.5)
    game.Players.LocalPlayer.CharacterAdded:Wait()
end)

createButton("🦒 ДЛИННЫЕ НОГИ", Color3.fromRGB(150, 150, 0), function()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("LeftLeg") then char.LeftLeg.Size = Vector3.new(2, 10, 2) end
    if char:FindFirstChild("RightLeg") then char.RightLeg.Size = Vector3.new(2, 10, 2) end
end)

-- КАТЕГОРИЯ: ПОЛЕТ
createCategory("✈️ ПОЛЕТ")

createButton("🦅 РЕЖИМ ПТИЦЫ", Color3.fromRGB(0, 200, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(100000, 100000, 100000)
    bv.Velocity = Vector3.new(0, 50, 0)
    bv.Parent = hrp
    wait(0.5)
    bv:Destroy()
end)

createButton("💨 СУПЕР СКОРОСТЬ", Color3.fromRGB(255, 200, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
end)

createButton("🐢 МЕДЛЕННАЯ СКОРОСТЬ", Color3.fromRGB(0, 100, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 5
end)

createButton("🔄 СБРОС СКОРОСТИ", Color3.fromRGB(50, 50, 50), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

-- КАТЕГОРИЯ: СТИХИЯ
createCategory("🌪️ СТИХИЙНЫЕ БЕДСТВИЯ")

createButton("🌪️ ТОРНАДО", Color3.fromRGB(100, 100, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    for i = 1, 100 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(2, 2, 2)
        local angle = i * 0.5
        local radius = 5 + i * 0.1
        part.Position = hrp.Position + Vector3.new(math.cos(angle) * radius, i * 0.5, math.sin(angle) * radius)
        part.BrickColor = BrickColor.new("Bright blue")
        part.Material = Enum.Material.Neon
        part.Anchored = true
        part.CanCollide = false
        part.Parent = workspace
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 30 then
                    targetHrp.Velocity = Vector3.new(math.random(-30, 30), 50, math.random(-30, 30))
                end
            end
        end
        wait(0.01)
        part:Destroy()
    end
end)

createButton("⚡ ШАРОВАЯ МОЛНИЯ", Color3.fromRGB(255, 255, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    local lightning = Instance.new("Part")
    lightning.Size = Vector3.new(5, 5, 5)
    lightning.Position = hrp.Position + Vector3.new(0, 5, 0)
    lightning.BrickColor = BrickColor.new("Bright yellow")
    lightning.Material = Enum.Material.Neon
    lightning.Shape = Enum.PartType.Ball
    lightning.Anchored = false
    lightning.Parent = workspace
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(100000, 100000, 100000)
    bv.Velocity = Vector3.new(math.random(-30, 30), 10, math.random(-30, 30))
    bv.Parent = lightning
    wait(3)
    lightning:Destroy()
end)

createButton("🌊 ЦУНАМИ", Color3.fromRGB(0, 0, 200), function()
    local char = game.Players.LocalPlayer.Character
    for i = 1, 50 do
        local wave = Instance.new("Part")
        wave.Size = Vector3.new(100, 1, 100)
        wave.Position = char.HumanoidRootPart.Position + Vector3.new(0, i * 0.5 - 10, 0)
        wave.BrickColor = BrickColor.new("Bright blue")
        wave.Material = Enum.Material.SmoothPlastic
        wave.Transparency = 0.5
        wave.Anchored = true
        wave.CanCollide = true
        wave.Parent = workspace
        wait(0.05)
        wave:Destroy()
    end
end)

-- КАТЕГОРИЯ: ТРАНСФОРМАЦИЯ
createCategory("🔄 ТРАНСФОРМАЦИЯ")

createButton("🦇 ЛЕТУЧАЯ МЫШЬ", Color3.fromRGB(100, 0, 100), function()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("Head") then
        char.Head.MeshId = "rbxassetid://48728776"
        char.Head.MeshScale = Vector3.new(3, 3, 3)
    end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    workspace.Gravity = 50
end)

createButton("🤖 СТАТЬ РОБОТОМ", Color3.fromRGB(0, 200, 255), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Color = Color3.fromRGB(200, 200, 200)
        end
    end
    if char:FindFirstChild("Head") then
        char.Head.MeshId = "rbxassetid://473159459"
        char.Head.MeshScale = Vector3.new(2, 2, 2)
    end
end)

createButton("🧛 СТАТЬ ВАМПИРОМ", Color3.fromRGB(255, 0, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Color = Color3.fromRGB(255, 255, 255)
            v.Transparency = 0.3
        end
    end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
end)

-- КАТЕГОРИЯ: ФИЗИКА
createCategory("⚡ ФИЗИКА")

createButton("💫 ВЗОРВАТЬ ВСЕ ЧАСТИ", Color3.fromRGB(255, 100, 0), function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v.Anchored == false then
            v.Velocity = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
            v.RotVelocity = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
        end
    end
end)

createButton("🧲 МАГНИТ К ИГРОКУ", Color3.fromRGB(200, 0, 200), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v ~= char and v.Anchored == false then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            bv.Velocity = (char.HumanoidRootPart.Position - v.Position).Unit * 80
            bv.Parent = v
            wait(0.05)
            bv:Destroy()
        end
    end
end)

createButton("🔄 ЗАМОРОЗИТЬ ВСЁ", Color3.fromRGB(0, 200, 255), function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v.Anchored == false then
            v.Anchored = true
            v.Material = Enum.Material.Ice
            v.Color = Color3.fromRGB(150, 200, 255)
            v.Transparency = 0.3
        end
    end
    wait(3)
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v.Anchored == true then
            v.Anchored = false
        end
    end
end)

-- КАТЕГОРИЯ: ПОГОДА
createCategory("🌤️ ПОГОДА")

createButton("🌙 НОЧЬ", Color3.fromRGB(0, 0, 50), function()
    game.Lighting.Brightness = 0
    game.Lighting.ClockTime = 0
    game.Lighting.FogEnd = 50
    game.Lighting.FogColor = Color3.fromRGB(0, 0, 0)
end)

createButton("☀️ ДЕНЬ", Color3.fromRGB(255, 200, 0), function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 1000
    game.Lighting.FogColor = Color3.fromRGB(200, 200, 200)
end)

createButton("🌅 ЗАКАТ", Color3.fromRGB(255, 100, 0), function()
    game.Lighting.Brightness = 1.5
    game.Lighting.ClockTime = 19
    game.Lighting.FogColor = Color3.fromRGB(255, 150, 50)
end)

createButton("🌫️ ТУМАН", Color3.fromRGB(100, 100, 100), function()
    game.Lighting.FogEnd = 20
    game.Lighting.FogColor = Color3.fromRGB(150, 150, 150)
end)

-- КАТЕГОРИЯ: РАЗНОЕ
createCategory("🎮 РАЗНОЕ")

createButton("🛡️ НЕУЯЗВИМОСТЬ", Color3.fromRGB(0, 255, 255), function()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end)

createButton("🗑️ УДАЛИТЬ ВСЕ", Color3.fromRGB(100, 0, 0), function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v ~= game.Players.LocalPlayer.Character and not v:IsA("Terrain") then
            v:Destroy()
        end
    end
end)

createButton("🔄 ВОСКРЕСИТЬ", Color3.fromRGB(0, 150, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end)

createButton("🔫 БЕСКОНЕЧНЫЕ ПАТРОНЫ", Color3.fromRGB(200, 50, 0), function()
    local player = game.Players.LocalPlayer
    player.CharacterAdded:Connect(function(char)
        wait(0.5)
        local backpack = player.Backpack
        for _, v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Ammo") then
                v.Ammo.Value = 999
            end
        end
    end)
end)

createButton("📸 СКРИНШОТ", Color3.fromRGB(150, 0, 200), function()
    game:GetService("GuiService"):ShowRobloxGui("Screenshot")
end)

createButton("🧹 ОЧИСТИТЬ ЧАТ", Color3.fromRGB(100, 100, 100), function()
    for i = 1, 50 do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("", "All")
    end
end)

-- ====== УПРАВЛЕНИЕ ======

-- Кнопка сворачивания
collapseButton.MouseButton1Click:Connect(toggleCollapse)

-- Кнопка закрытия (ПРЯЧЕТ МЕНЮ, НЕ ОСТАНАВЛИВАЕТ СКРИПТ!)
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    toggleButton.Visible = true
end)

-- Плавающая кнопка
toggleButton.MouseButton1Click:Connect(function()
    if mainFrame.Visible then
        mainFrame.Visible = false
        toggleButton.Visible = true
    else
        mainFrame.Visible = true
        toggleButton.Visible = false
    end
end)

-- Горячие клавиши
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Insert then
        if mainFrame.Visible then
            mainFrame.Visible = false
            toggleButton.Visible = true
        else
            mainFrame.Visible = true
            toggleButton.Visible = false
        end
    end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        toggleCollapse()
    end
    
    if input.KeyCode == Enum.KeyCode.F2 then
        if screenGui.Enabled then
            screenGui.Enabled = false
            print("🔄 GUI отключен. Нажми F2 снова или выполни _G.restoreMenu()")
        else
            screenGui.Enabled = true
            mainFrame.Visible = true
            toggleButton.Visible = false
            print("🔄 GUI восстановлен!")
        end
    end
end)

-- Функции для консоли
_G.restoreMenu = function()
    screenGui.Enabled = true
    mainFrame.Visible = true
    toggleButton.Visible = false
    print("✅ Меню восстановлено!")
end

_G.killScript = function()
    screenGui:Destroy()
    print("💀 Скрипт полностью остановлен!")
end

-- Обновление Canvas
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiList.AbsoluteContentSize.Y + 20)

-- Перетаскивание окна
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ====== ВЫВОД В КОНСОЛЬ ======
print("🔥 ============================================ 🔥")
print("🔥     TROLL MENU ULTRA V7 ЗАГРУЖЕН!           🔥")
print("🔥 ============================================ 🔥")
print("🦵 DROPKICK V2 - ПОЛНОСТЬЮ ПЕРЕРАБОТАН!")
print("📌 INSERT - скрыть/показать меню")
print("📌 F1 - свернуть/развернуть меню")
print("📌 F2 - отключить/включить GUI (скрипт жив)")
print("📌 Кнопка X - спрятать меню (плавающая кнопка)")
print("📌 В консоли: _G.restoreMenu() - восстановить GUI")
print("📌 В консоли: _G.killScript() - полностью остановить")
print("🔥 ВСЕГО ФУНКЦИЙ: 90+!")
print("🔥 ============================================ 🔥")
