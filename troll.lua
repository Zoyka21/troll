--[[
  ██████  ██████  ███████  ██████  ██   ██ ██   ██  █████  ██    ██ ███████ ███    ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ████   ██ 
  ██████  ██████  █████   ██    ██ █████   ███████ ███████ ██    ██ █████   ██ ██  ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ██  ██ ██ 
  ██████  ██   ██ ███████  ██████  ██   ██ ██   ██ ██   ██  ██████  ███████ ██   ████ 
  ============== TROLL MENU ULTRA V5 ==============
  ========== С ДОБАВЛЕННЫМИ DROPKICK ФУНКЦИЯМИ ==========
--]]

-- Проверка на игру
if not game:IsLoaded() then game.Loaded:Wait() end

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrollMenuUltraV5"
screenGui.Parent = game.CoreGui
screenGui.Enabled = true

-- ====== ПЛАВАЮЩАЯ КНОПКА ======
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 65, 0, 65)
toggleButton.Position = UDim2.new(0, 10, 0.5, -32)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
toggleButton.BackgroundTransparency = 0.2
toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Image = "rbxassetid://6031094737"
toggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Parent = screenGui

-- Анимация кнопки
game:GetService("RunService").Heartbeat:Connect(function()
    toggleButton.BackgroundTransparency = 0.2 + math.sin(tick() * 2) * 0.1
    toggleButton.Size = UDim2.new(0, 65 + math.sin(tick() * 2) * 3, 0, 65 + math.sin(tick() * 2) * 3)
end)

-- ====== ОСНОВНОЕ МЕНЮ ======
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 580, 0, 750)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -375)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 3
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 150)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Заголовок
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.8, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "🔥 TROLL MENU ULTRA V5 🔥"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.Font = Enum.Font.Bangers
titleText.Parent = titleBar

-- Кнопки управления
local collapseButton = Instance.new("ImageButton")
collapseButton.Size = UDim2.new(0, 40, 0, 40)
collapseButton.Position = UDim2.new(0.88, 0, 0.5, -20)
collapseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
collapseButton.BorderSizePixel = 0
collapseButton.Image = "rbxassetid://6031094742"
collapseButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
collapseButton.Parent = titleBar

local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(0.95, 0, 0.5, -20)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Image = "rbxassetid://6031094743"
closeButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = titleBar

-- Скролл
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -60)
scrollingFrame.Position = UDim2.new(0, 5, 0, 55)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.Parent = mainFrame

local uiList = Instance.new("UIListLayout")
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 8)
uiList.Parent = scrollingFrame

-- ====== ПЕРЕМЕННАЯ ДЛЯ СВОРАЧИВАНИЯ ======
local isCollapsed = false
local originalSize = mainFrame.Size
local originalPosition = mainFrame.Position

local function toggleCollapse()
    isCollapsed = not isCollapsed
    if isCollapsed then
        mainFrame:TweenSize(UDim2.new(0, 580, 0, 50), "Out", "Quad", 0.3, true)
        mainFrame:TweenPosition(UDim2.new(0.5, -290, 0, 0), "Out", "Quad", 0.3, true)
        collapseButton.Image = "rbxassetid://6031094744"
        scrollingFrame.Visible = false
    else
        mainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
        mainFrame:TweenPosition(originalPosition, "Out", "Quad", 0.3, true)
        collapseButton.Image = "rbxassetid://6031094742"
        scrollingFrame.Visible = true
    end
end

-- ====== ФУНКЦИИ СОЗДАНИЯ ======
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
-- ====== ВСЕ ФУНКЦИИ ======
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

createButton("🌌 В НЕБО (ВЫСОТА 1000)", Color3.fromRGB(0, 100, 200), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
end)

createButton("🏠 В ЦЕНТР КАРТЫ", Color3.fromRGB(0, 150, 100), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
end)

-- ====== НОВЫЕ ФУНКЦИИ ИЗ "THE REAL DROPKICK" ======
createCategory("💥 THE REAL DROPKICK")

-- 1. DROPKICK - НОГА В ЛИЦО!
createButton("🦵 DROPKICK (НОГА В ЛИЦО)", Color3.fromRGB(255, 50, 0), function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Создаём эффект ноги
    local leg = Instance.new("Part")
    leg.Size = Vector3.new(1, 3, 0.5)
    leg.Position = hrp.Position + hrp.CFrame.LookVector * 3 + Vector3.new(0, 1, 0)
    leg.BrickColor = BrickColor.new("Bright red")
    leg.Material = Enum.Material.Neon
    leg.Anchored = true
    leg.CanCollide = false
    leg.Parent = workspace
    
    -- Анимация удара
    for i = 1, 10 do
        leg.Position = hrp.Position + hrp.CFrame.LookVector * (3 + i * 0.5) + Vector3.new(0, 1 - i * 0.05, 0)
        leg.Size = Vector3.new(1 + i * 0.1, 3, 0.5 + i * 0.05)
        wait(0.05)
    end
    
    -- Проверяем, кого ударили
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 15 then
                -- Отбрасываем игрока
                targetHrp.Velocity = hrp.CFrame.LookVector * 100 + Vector3.new(0, 30, 0)
                targetHrp.CFrame = targetHrp.CFrame * CFrame.Angles(math.rad(180), 0, 0)
                v.Humanoid:BreakJoints()
                wait(0.5)
                v.Humanoid.Health = 100
            end
        end
    end
    
    leg:Destroy()
end)

-- 2. DROPKICK - ВРАЩАТЕЛЬНЫЙ
createButton("🌀 DROPKICK СПИРАЛЬ", Color3.fromRGB(200, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for i = 1, 20 do
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(18), 0) * CFrame.new(0, 0, 1)
        -- Удар по игрокам рядом
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - hrp.Position).Magnitude < 8 then
                    targetHrp.Velocity = hrp.CFrame.LookVector * 50 + Vector3.new(0, 20, 0)
                end
            end
        end
        wait(0.05)
    end
end)

-- 3. DROPKICK - МАССОВЫЙ
createButton("👊 МАССОВЫЙ DROPKICK", Color3.fromRGB(255, 0, 100), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
            local targetHrp = v:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                -- Создаём удар для каждого
                local kick = Instance.new("Part")
                kick.Size = Vector3.new(2, 4, 1)
                kick.Position = targetHrp.Position + Vector3.new(0, 1, 0)
                kick.BrickColor = BrickColor.new("Bright orange")
                kick.Material = Enum.Material.Neon
                kick.Anchored = true
                kick.CanCollide = false
                kick.Parent = workspace
                
                targetHrp.Velocity = (targetHrp.Position - hrp.Position).Unit * 80 + Vector3.new(0, 30, 0)
                wait(0.05)
                kick:Destroy()
            end
        end
    end
end)

-- 4. DROPKICK - ОГНЕННЫЙ
createButton("🔥 ОГНЕННЫЙ DROPKICK", Color3.fromRGB(255, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for i = 1, 15 do
        hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
        
        -- Огненный след
        local fire = Instance.new("Part")
        fire.Size = Vector3.new(2, 2, 2)
        fire.Position = hrp.Position + Vector3.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2))
        fire.BrickColor = BrickColor.new("Bright red")
        fire.Material = Enum.Material.Neon
        fire.Anchored = true
        fire.CanCollide = false
        fire.Parent = workspace
        
        local fireEffect = Instance.new("Fire")
        fireEffect.Size = 5
        fireEffect.Heat = 15
        fireEffect.Parent = fire
        
        wait(0.05)
        fire:Destroy()
    end
end)

-- 5. DROPKICK - ТЕЛЕПОРТАЦИОННЫЙ
createButton("🌀 DROPKICK ТЕЛЕПОРТ", Color3.fromRGB(150, 0, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    local players = game.Players:GetPlayers()
    for _, target in pairs(players) do
        if target ~= game.Players.LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetHrp = target.Character.HumanoidRootPart
            -- Телепортируемся к игроку и бьём
            hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 2, 3)
            wait(0.1)
            targetHrp.Velocity = Vector3.new(0, 50, 0)
            targetHrp.CFrame = targetHrp.CFrame * CFrame.Angles(math.rad(180), 0, 0)
            break
        end
    end
end)

-- 6. DROPKICK - СТЕНА УДАРОВ
createButton("🧱 СТЕНА DROPKICK'ОВ", Color3.fromRGB(0, 100, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    
    for i = 1, 30 do
        local kick = Instance.new("Part")
        kick.Size = Vector3.new(1, 3, 0.5)
        kick.Position = hrp.Position + Vector3.new(math.random(-10, 10), math.random(-5, 5), math.random(-10, 10))
        kick.BrickColor = BrickColor.Random()
        kick.Material = Enum.Material.Neon
        kick.Anchored = true
        kick.CanCollide = false
        kick.Parent = workspace
        
        -- Проверяем попадание
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= char then
                local targetHrp = v:FindFirstChild("HumanoidRootPart")
                if targetHrp and (targetHrp.Position - kick.Position).Magnitude < 5 then
                    targetHrp.Velocity = Vector3.new(math.random(-50, 50), 40, math.random(-50, 50))
                end
            end
        end
        
        wait(0.03)
        kick:Destroy()
    end
end)

-- ====== ОСТАЛЬНЫЕ КАТЕГОРИИ (СОХРАНЕНЫ И РАСШИРЕНЫ) ======

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

createButton("❌ ЗАКРЫТЬ МЕНЮ", Color3.fromRGB(80, 0, 0), function()
    screenGui.Enabled = false
end)

-- ====== УПРАВЛЕНИЕ ======

collapseButton.MouseButton1Click:Connect(toggleCollapse)

closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

toggleButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = not screenGui.Enabled
end)

-- Горячие клавиши
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        screenGui.Enabled = not screenGui.Enabled
    end
    if input.KeyCode == Enum.KeyCode.F1 then
        toggleCollapse()
    end
end)

-- Обновление Canvas
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiList.AbsoluteContentSize.Y + 20)

-- Перетаскивание
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

print("🔥 TROLL MENU ULTRA V5 ЗАГРУЖЕН!")
print("🦵 ДОБАВЛЕНЫ DROPKICK ФУНКЦИИ!")
print("📌 INSERT - скрыть/показать | F1 - свернуть")
