-- Локальный скрипт для троллинга НА ТЕЛЕФОНЕ (поместите в StarterPlayerScripts)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

-- Переменные для мобильного управления
local isMobile = UserInputService.TouchEnabled
local guiEnabled = true

-- Создаем анимации
local slapAnimation = Instance.new("Animation")
slapAnimation.AnimationId = "rbxassetid://10468835186"

local biteAnimation = Instance.new("Animation")
biteAnimation.AnimationId = "rbxassetid://11343441594"

-- Функция для поиска ближайшего игрока
local function getNearestPlayer(maxDistance)
    local nearestPlayer = nil
    local shortestDistance = maxDistance
    
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local otherHumanoid = otherPlayer.Character:FindFirstChild("Humanoid")
            if otherHumanoid and otherHumanoid.Health > 0 then
                local distance = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestPlayer = otherPlayer
                end
            end
        end
    end
    
    return nearestPlayer
end

-- Функция 1: УДАР
local function slapPlayer()
    local target = getNearestPlayer(15)
    if not target or not target.Character then
        showNotification("Нет цели рядом! 😢")
        return
    end
    
    local targetCharacter = target.Character
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    
    if not targetHumanoid or not targetRoot then return end
    
    -- Проигрываем анимацию
    local slapTrack = animator:LoadAnimation(slapAnimation)
    slapTrack:Play()
    
    -- Эффект удара
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9115759652"
    sound.Parent = character.HumanoidRootPart
    sound:Play()
    game.Debris:AddItem(sound, 1)
    
    -- Визуальный эффект
    local effect = Instance.new("Part")
    effect.Size = Vector3.new(1, 1, 1)
    effect.Shape = Enum.PartType.Ball
    effect.BrickColor = BrickColor.new("Bright yellow")
    effect.Material = Enum.Material.Neon
    effect.Anchored = true
    effect.CanCollide = false
    effect.Position = targetRoot.Position
    effect.Parent = workspace
    
    -- Анимация эффекта
    spawn(function()
        for i = 1, 10 do
            effect.Size = effect.Size + Vector3.new(0.2, 0.2, 0.2)
            effect.Transparency = i / 10
            wait(0.05)
        end
        effect:Destroy()
    end)
    
    -- Отбрасываем цель
    local direction = (targetRoot.Position - character.HumanoidRootPart.Position).Unit
    direction = direction * Vector3.new(1, 0, 1) + Vector3.new(0, 0.7, 0)
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bodyVelocity.Velocity = direction * 60
    bodyVelocity.P = 10000
    bodyVelocity.Parent = targetRoot
    
    game.Debris:AddItem(bodyVelocity, 0.5)
    
    wait(0.3)
    targetHumanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
    
    showNotification("💥 " .. target.Name .. " отлетел!")
    vibrateFeedback()
end

-- Функция 2: УКУС
local function bitePlayer()
    local target = getNearestPlayer(8)
    if not target or not target.Character then
        showNotification("Нет цели рядом для укуса! 🦷")
        return
    end
    
    local targetCharacter = target.Character
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    
    if not targetHumanoid or targetHumanoid.Health <= 0 then return end
    
    -- Телепортируем цель
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    if targetRoot then
        targetRoot.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
    end
    
    -- Замораживаем
    targetHumanoid.WalkSpeed = 0
    targetHumanoid.JumpPower = 0
    
    -- Анимация укуса
    local biteTrack = animator:LoadAnimation(biteAnimation)
    biteTrack:Play()
    
    -- Звук
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3438514569"
    sound.Parent = character.HumanoidRootPart
    sound:Play()
    game.Debris:AddItem(sound, 1)
    
    -- Частицы крови (много!)
    for i = 1, 5 do
        local blood = Instance.new("Part")
        blood.Size = Vector3.new(0.3, 0.3, 0.3)
        blood.BrickColor = BrickColor.new("Bright red")
        blood.Material = Enum.Material.Neon
        blood.Anchored = false
        blood.CanCollide = false
        blood.Position = targetCharacter:FindFirstChild("Head") and targetCharacter.Head.Position or targetRoot.Position
        
        local bloodMesh = Instance.new("SpecialMesh", blood)
        bloodMesh.MeshType = Enum.MeshType.Sphere
        
        blood.Parent = workspace
        
        -- Разлетаются в разные стороны
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.new(math.random(-10, 10), math.random(5, 15), math.random(-10, 10))
        bv.Parent = blood
        
        game.Debris:AddItem(blood, 1)
        game.Debris:AddItem(bv, 0.5)
    end
    
    -- Эффект скримера (тёмный экран на долю секунды)
    local screamer = Instance.new("Frame")
    screamer.Size = UDim2.new(1, 0, 1, 0)
    screamer.BackgroundColor3 = Color3.new(1, 0, 0)
    screamer.BackgroundTransparency = 0.7
    screamer.Parent = player:WaitForChild("PlayerGui")
    
    spawn(function()
        for i = 1, 5 do
            screamer.BackgroundTransparency = 0.7 - (i * 0.1)
            wait(0.05)
        end
        wait(0.1)
        screamer:Destroy()
    end)
    
    wait(0.5)
    targetHumanoid.Health = 0
    
    showNotification("🦷 " .. target.Name .. " был убит укусом!")
    vibrateFeedback()
end

-- Функция вибрации телефона
function vibrateFeedback()
    if UserInputService.VibrationEnabled then
        UserInputService.VibrationEnabled = true
        -- Встроенная вибрация при активации
    end
end

-- Функция показа уведомлений
function showNotification(text)
    -- Удаляем старые уведомления
    if player.PlayerGui:FindFirstChild("Notification") then
        player.PlayerGui.Notification:Destroy()
    end
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 250, 0, 50)
    notification.Position = UDim2.new(0.5, -125, 0, 20)
    notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notification.BackgroundTransparency = 0.2
    notification.Parent = player:WaitForChild("PlayerGui")
    
    local notifText = Instance.new("TextLabel")
    notifText.Size = UDim2.new(1, -10, 1, -10)
    notifText.Position = UDim2.new(0, 5, 0, 5)
    notifText.Text = text
    notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifText.BackgroundTransparency = 1
    notifText.TextScaled = true
    notifText.Font = Enum.Font.GothamBold
    notifText.Parent = notification
    
    -- Плавное появление и исчезновение
    notification.BackgroundTransparency = 1
    local tweenIn = TweenService:Create(notification, TweenInfo.new(0.3), {BackgroundTransparency = 0.2})
    tweenIn:Play()
    
    wait(2)
    local tweenOut = TweenService:Create(notification, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    tweenOut:Play()
    wait(0.5)
    notification:Destroy()
end

-- СОЗДАНИЕ МОБИЛЬНОГО UI
local function createMobileUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TrollingUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Главная кнопка (меню)
    local menuButton = Instance.new("TextButton")
    menuButton.Size = UDim2.new(0, 60, 0, 60)
    menuButton.Position = UDim2.new(0, 20, 0.8, -30)
    menuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    menuButton.BackgroundTransparency = 0.3
    menuButton.Text = "👊"
    menuButton.TextScaled = true
    menuButton.Font = Enum.Font.SourceSans
    menuButton.Parent = screenGui
    
    -- Делаем кнопку круглой
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = menuButton
    
    -- Кнопка удара
    local slapButton = Instance.new("TextButton")
    slapButton.Size = UDim2.new(0, 150, 0, 150)
    slapButton.Position = UDim2.new(0.3, -75, 0.5, -75)
    slapButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    slapButton.BackgroundTransparency = 0.3
    slapButton.Text = "💥\nУДАР"
    slapButton.TextScaled = true
    slapButton.Font = Enum.Font.GothamBold
    slapButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    slapButton.Visible = false
    slapButton.Parent = screenGui
    
    local slapCorner = Instance.new("UICorner")
    slapCorner.CornerRadius = UDim.new(1, 0)
    slapCorner.Parent = slapButton
    
    -- Кнопка укуса
    local biteButton = Instance.new("TextButton")
    biteButton.Size = UDim2.new(0, 150, 0, 150)
    biteButton.Position = UDim2.new(0.7, -75, 0.5, -75)
    biteButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    biteButton.BackgroundTransparency = 0.3
    biteButton.Text = "🦷\nУКУС"
    biteButton.TextScaled = true
    biteButton.Font = Enum.Font.GothamBold
    biteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    biteButton.Visible = false
    biteButton.Parent = screenGui
    
    local biteCorner = Instance.new("UICorner")
    biteCorner.CornerRadius = UDim.new(1, 0)
    biteCorner.Parent = biteButton
    
    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0, 300, 0, 30)
    title.Position = UDim2.new(0.5, -150, 0.3, -15)
    title.Text = "🎭 ТРОЛЛИНГ МЕНЮ 🎭"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 0.5
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBlack
    title.Visible = false
    title.Parent = screenGui
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0.3, 0)
    titleCorner.Parent = title
    
    -- Переключение меню
    local menuOpen = false
    
    menuButton.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        slapButton.Visible = menuOpen
        biteButton.Visible = menuOpen
        title.Visible = menuOpen
        
        -- Анимация кнопки меню
        if menuOpen then
            menuButton.Text = "❌"
        else
            menuButton.Text = "👊"
        end
    end)
    
    -- Функционал кнопок
    slapButton.MouseButton1Click:Connect(function()
        slapPlayer()
    end)
    
    biteButton.MouseButton1Click:Connect(function()
        bitePlayer()
    end)
    
    -- Поддержка перетаскивания кнопки меню
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    menuButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = menuButton.Position
        end
    end)
    
    menuButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            menuButton.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Также добавляем поддержку клавиатуры для игры на ПК/планшете
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        slapPlayer()
    elseif input.KeyCode == Enum.KeyCode.Q then
        bitePlayer()
    end
end)

-- Инициализация при загрузке персонажа
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    animator = humanoid:WaitForChild("Animator")
end)

-- Создаем мобильный UI
createMobileUI()

print("📱 Мобильный троллинг скрипт загружен!")
print("Нажмите кнопку 👊 для открытия меню")
print("E - УДАР | Q - УКУС (для ПК)")
