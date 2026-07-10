--[[
  ██████  ██████  ███████  ██████  ██   ██ ██   ██  █████  ██    ██ ███████ ███    ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ████   ██ 
  ██████  ██████  █████   ██    ██ █████   ███████ ███████ ██    ██ █████   ██ ██  ██ 
  ██   ██ ██   ██ ██      ██    ██ ██  ██  ██   ██ ██   ██ ██    ██ ██      ██  ██ ██ 
  ██████  ██   ██ ███████  ██████  ██   ██ ██   ██ ██   ██  ██████  ███████ ██   ████ 
  ============== TROLL MENU ULTRA V3 ==============
--]]

-- Проверка на игру
if not game:IsLoaded() then game.Loaded:Wait() end

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrollMenuUltra"
screenGui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 600)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 100)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Заголовок с анимацией
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
title.BorderSizePixel = 0
title.Text = "🔥 TROLL MENU ULTRA 🔥"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.Bangers
title.Parent = mainFrame

-- Скроллинг-контейнер для кнопок
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -10, 1, -50)
scrollingFrame.Position = UDim2.new(0, 5, 0, 45)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.Parent = mainFrame

local uiList = Instance.new("UIListLayout")
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 6)
uiList.Parent = scrollingFrame

-- Функция создания кнопок
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scrollingFrame
    
    btn.MouseButton1Click:Connect(callback)
    
    -- Эффект наведения
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(
            math.min(color.R * 255 + 50, 255),
            math.min(color.G * 255 + 50, 255),
            math.min(color.B * 255 + 50, 255)
        )
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = color
    end)
    
    return btn
end

-- ====== ОГРОМНОЕ ТРОЛЛ МЕНЮ ======

-- 1. Телепорты
createButton("🚀 ТЕЛЕПОРТ К ИГРОКАМ", Color3.fromRGB(200, 0, 0), function()
    local players = game.Players:GetPlayers()
    for i, v in ipairs(players) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
            break
        end
    end
end)

createButton("🌀 ТЕЛЕПОРТ В НЕБО (ВЫСОТА)", Color3.fromRGB(0, 100, 200), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
end)

createButton("🌊 ТЕЛЕПОРТ ПОД ВОДУ", Color3.fromRGB(0, 50, 150), function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -50, 0)
end)

-- 2. Анимации
createButton("💃 ТАНЕЦ (DANCE)", Color3.fromRGB(255, 100, 0), function()
    game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Instance.new("Animation"))
end)

createButton("🤸 ФЛИП В ВОЗДУХЕ", Color3.fromRGB(150, 0, 255), function()
    for i = 1, 10 do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(36))
        wait(0.05)
    end
end)

createButton("😵 ГОЛОВА КРУГОМ", Color3.fromRGB(255, 0, 200), function()
    for i = 1, 20 do
        game.Players.LocalPlayer.Character.Head.CFrame = game.Players.LocalPlayer.Character.Head.CFrame * CFrame.Angles(0, math.rad(18), 0)
        wait(0.05)
    end
end)

-- 3. Взрывные эффекты
createButton("💥 ВЗРЫВ РЯДОМ", Color3.fromRGB(255, 150, 0), function()
    local explosion = Instance.new("Explosion")
    explosion.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)
    explosion.BlastRadius = 15
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
end)

createButton("🔥 ОГНЕННЫЙ ШАР", Color3.fromRGB(255, 50, 0), function()
    local fire = Instance.new("Fire")
    fire.Size = 15
    fire.Heat = 20
    fire.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    wait(2)
    fire:Destroy()
end)

-- 4. Изменение персонажа
createButton("📏 СДЕЛАТЬ ГИГАНТОМ (x5)", Color3.fromRGB(0, 200, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Size = v.Size * 5
        end
    end
end)

createButton("🐭 СДЕЛАТЬ МАЛЕНЬКИМ", Color3.fromRGB(0, 100, 0), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Size = v.Size * 0.2
        end
    end
end)

createButton("👻 СТАТЬ ПРИЗРАКОМ", Color3.fromRGB(100, 0, 150), function()
    local char = game.Players.LocalPlayer.Character
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = 0.7
            v.Material = Enum.Material.Neon
        end
    end
end)

-- 5. Троллинг других
createButton("🚗 ПРИЗВАТЬ МАШИНУ НА ИГРОКА", Color3.fromRGB(0, 0, 200), function()
    local players = game.Players:GetPlayers()
    for i, v in ipairs(players) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local vehicle = Instance.new("Part")
            vehicle.Size = Vector3.new(10, 3, 6)
            vehicle.Position = v.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
            vehicle.Anchored = true
            vehicle.BrickColor = BrickColor.Random()
            vehicle.Parent = workspace
            wait(0.5)
            vehicle.Anchored = false
            break
        end
    end
end)

createButton("💩 БРОСАТЬ КАКАШКИ", Color3.fromRGB(100, 50, 0), function()
    local poop = Instance.new("Part")
    poop.Size = Vector3.new(1, 0.5, 1)
    poop.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1, 0)
    poop.BrickColor = BrickColor.new("Brown")
    poop.Shape = Enum.PartType.Ball
    poop.Parent = workspace
    poop.Velocity = Vector3.new(math.random(-50, 50), 30, math.random(-50, 50))
end)

-- 6. Звуки и визуал
createButton("📢 ГРОМКИЙ ЗВУК (ВСЕМ)", Color3.fromRGB(200, 200, 0), function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120407644"
    sound.Volume = 10
    sound.PlayOnRemove = true
    sound.Parent = workspace
    sound:Play()
    wait(1)
    sound:Destroy()
end)

createButton("🌈 РАДУГА ВОКРУГ", Color3.fromRGB(255, 0, 255), function()
    for i = 1, 30 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + 
                        Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
        part.BrickColor = BrickColor.Random()
        part.Anchored = true
        part.Parent = workspace
        wait(0.1)
        part:Destroy()
    end
end)

-- 7. Бесконечные трюки
createButton("♾️ БЕСКОНЕЧНЫЙ ПОЛЕТ", Color3.fromRGB(0, 200, 200), function()
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    local bodyVel = Instance.new("BodyVelocity")
    bodyVel.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVel.Velocity = Vector3.new(0, 50, 0)
    bodyVel.Parent = hrp
    wait(5)
    bodyVel:Destroy()
end)

createButton("🔄 ВРАЩЕНИЕ МИРА", Color3.fromRGB(150, 150, 0), function()
    for i = 1, 360, 5 do
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(0, math.rad(5), 0)
        wait(0.02)
    end
end)

-- 8. Изменение времени суток
createButton("🌙 НОЧЬ (ТЕМНОТА)", Color3.fromRGB(0, 0, 50), function()
    game.Lighting.Brightness = 0
    game.Lighting.ClockTime = 0
    game.Lighting.FogEnd = 100
    game.Lighting.FogColor = Color3.fromRGB(0, 0, 0)
end)

createButton("☀️ ДЕНЬ", Color3.fromRGB(255, 200, 0), function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 1000
    game.Lighting.FogColor = Color3.fromRGB(200, 200, 200)
end)

-- 9. Спам
createButton("💬 СПАМ В ЧАТ (ТРОЛЛЬ)", Color3.fromRGB(200, 0, 200), function()
    for i = 1, 20 do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Я ТРОЛЛЬ! 🤪", "All")
        wait(0.1)
    end
end)

createButton("👾 СПАМ ЭМОДЗИ", Color3.fromRGB(0, 200, 100), function()
    for i = 1, 30 do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("😈👻💀👽🤖🎃", "All")
        wait(0.05)
    end
end)

-- 10. Удаление и сброс
createButton("🗑️ УДАЛИТЬ ВСЕ ЧАСТИ", Color3.fromRGB(100, 0, 0), function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v ~= game.Players.LocalPlayer.Character then
            v:Destroy()
        end
    end
end)

createButton("🔄 СБРОС ПЕРСОНАЖА", Color3.fromRGB(50, 50, 50), function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Переключатель видимости GUI
createButton("❌ ЗАКРЫТЬ МЕНЮ", Color3.fromRGB(100, 0, 0), function()
    screenGui.Enabled = false
end)

-- Горячая клавиша для показа/скрытия (Insert)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        screenGui.Enabled = not screenGui.Enabled
    end
end)

-- Обновление размера Canvas
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiList.AbsoluteContentSize.Y + 10)

print("🔥 TROLL MENU ULTRA ЗАГРУЖЕН! Нажми INSERT чтобы скрыть/показать.")
