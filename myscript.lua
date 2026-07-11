-- Создание экранного контейнера для интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyAutomationGui"
-- Привязка интерфейса к CoreGui (чтобы он отображался поверх игры)
ScreenGui.Parent = game:GetService("CoreGui")

-- Создание главной панели меню
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Parent = ScreenGui

-- Создание кнопки активации функции
local ActionButton = Instance.new("TextButton")
ActionButton.Size = UDim2.new(0, 180, 0, 50)
ActionButton.Position = UDim2.new(0, 10, 0, 50)
ActionButton.Text = "Включить Авто-фарм"
ActionButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.Parent = MainFrame
local isEnabled = false -- Изначально функция выключена

-- Функция, которая срабатывает при нажатии на кнопку
ActionButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled -- Меняем значение на противоположное
    
    if isEnabled then
        ActionButton.Text = "Выключить Авто-фарм"
        ActionButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        -- Здесь запускается основной цикл автоматизации
        spawn(startAutomation) 
    else
        ActionButton.Text = "Включить Авто-фарм"
        ActionButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)
function startAutomation()
    -- Получаем доступ к персонажу локального игрока
    local player = game:GetService("Players").LocalPlayer
    
    -- Цикл выполняется до тех пор, пока переменная isEnabled равна true
    while isEnabled do
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            
            -- Пример: поиск объекта с именем "Coin" в Workspace
            local targetItem = game:GetService("Workspace"):FindFirstChild("Coin")
            
            if targetItem and targetItem:IsA("BasePart") then
                -- Телепортация персонажа к найденному предмету
                character.HumanoidRootPart.CFrame = targetItem.CFrame
            end
        end
        
        -- Обязательная задержка (пауза), чтобы игра не зависла от бесконечного цикла
        task.wait(1) 
    end
end
