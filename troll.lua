-- Локальный скрипт для троллинга (поместите в StarterPlayerScripts)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

-- Создаем анимации
local slapAnimation = Instance.new("Animation")
slapAnimation.AnimationId = "rbxassetid://10468835186" -- Анимация удара/толчка

local biteAnimation = Instance.new("Animation")
biteAnimation.AnimationId = "rbxassetid://11343441594" -- Анимация укуса

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

-- Функция 1: УДАР (человек отлетает)
local function slapPlayer()
    local target = getNearestPlayer(15)
    if not target or not target.Character then
        print("Нет цели рядом!")
        return
    end
    
    local targetCharacter = target.Character
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    
    if not targetHumanoid or not targetRoot then return end
    
    -- Проигрываем анимацию удара
    local slapTrack = animator:LoadAnimation(slapAnimation)
    slapTrack:Play()
    
    -- Создаем эффект удара (частицы/звук)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9115759652" -- Звук удара
    sound.Parent = character.HumanoidRootPart
    sound:Play()
    game.Debris:AddItem(sound, 1)
    
    -- Отбрасываем цель
    local direction = (targetRoot.Position - character.HumanoidRootPart.Position).Unit
    direction = direction * Vector3.new(1, 0, 1) + Vector3.new(0, 0.5, 0) -- Добавляем подброс
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bodyVelocity.Velocity = direction * 50 -- Сила отбрасывания
    bodyVelocity.P = 10000
    bodyVelocity.Parent = targetRoot
    
    -- Убираем BodyVelocity через секунду
    game.Debris:AddItem(bodyVelocity, 0.5)
    
    -- Анимация падения для цели
    wait(0.3)
    targetHumanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
    
    print("💥 " .. target.Name .. " отлетел!")
end

-- Функция 2: УБИТЬ УКУСОМ
local function bitePlayer()
    local target = getNearestPlayer(5) -- Ближе, так как укус требует контакта
    if not target or not target.Character then
        print("Нет цели рядом для укуса!")
        return
    end
    
    local targetCharacter = target.Character
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    
    if not targetHumanoid or targetHumanoid.Health <= 0 then return end
    
    -- Телепортируем цель к нам (для анимации)
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    if targetRoot then
        targetRoot.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
    end
    
    -- Замораживаем цель
    targetHumanoid.WalkSpeed = 0
    targetHumanoid.JumpPower = 0
    
    -- Проигрываем анимацию укуса
    local biteTrack = animator:LoadAnimation(biteAnimation)
    biteTrack:Play()
    
    -- Звук укуса
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3438514569" -- Звук укуса/хруста
    sound.Parent = character.HumanoidRootPart
    sound:Play()
    game.Debris:AddItem(sound, 1)
    
    -- Частицы крови
    local blood = Instance.new("Part")
    blood.Size = Vector3.new(0.5, 0.5, 0.5)
    blood.BrickColor = BrickColor.new("Bright red")
    blood.Material = Enum.Material.Neon
    blood.Anchored = false
    blood.CanCollide = false
    blood.Position = targetCharacter:FindFirstChild("Head") and targetCharacter.Head.Position or targetRoot.Position
    
    local bloodMesh = Instance.new("SpecialMesh", blood)
    bloodMesh.MeshType = Enum.MeshType.Sphere
    
    blood.Parent = workspace
    game.Debris:AddItem(blood, 2)
    
    -- Наносим смертельный урон
    wait(0.5)
    targetHumanoid.Health = 0
    
    -- Создаем эффект смерти
    local explosion = Instance.new("Explosion")
    explosion.BlastRadius = 1
    explosion.BlastPressure = 0
    explosion.Position = targetRoot.Position
    explosion.Parent = workspace
    
    print("🦷 " .. target.Name .. " был убит укусом!")
end

-- Привязка к клавишам
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then -- Нажмите E для удара
        slapPlayer()
    elseif input.KeyCode == Enum.KeyCode.Q then -- Нажмите Q для укуса
        bitePlayer()
    end
end)

-- UI подсказка
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 10, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
frame.Parent = screenGui

local instructions = Instance.new("TextLabel")
instructions.Size = UDim2.new(1, -20, 1, -20)
instructions.Position = UDim2.new(0, 10, 0, 10)
instructions.Text = "ТРОЛЛИНГ МЕНЮ:\n\nE - УДАР (отбросить)\nQ - УКУС (убить)"
instructions.TextColor3 = Color3.fromRGB(255, 255, 255)
instructions.BackgroundTransparency = 1
instructions.TextScaled = true
instructions.Font = Enum.Font.GothamBold
instructions.Parent = frame

print("🤡 Троллинг скрипт загружен!")
print("E - УДАР | Q - УКУС")
