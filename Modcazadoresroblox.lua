-- Cargar la librería visual de interfaces
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Crear la ventana principal del Hub
local Window = OrionLib:MakeWindow({
    Name = "Panel de Pruebas | Hub",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "MiConfigTest"
})

-- Notificación de bienvenida al ejecutar
OrionLib:MakeNotification({
    Title = "¡Script cargado con éxito!",
    Content = "El menú visual interactivo está listo.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

----------------------------------------------------------------
-- 1. PESTAÑA: JUGADOR (Movimiento y Física)
----------------------------------------------------------------
local PlayerTab = Window:MakeTab({
    Name = "Jugador",
    Icon = "rbxassetid://6023426915",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "Velocidad de Movimiento (WalkSpeed)",
    Min = 16,
    Max = 150,
    Default = 16,
    Color = Color3.fromRGB(0, 170, 255),
    Increment = 1,
    ValueName = "Velocidad",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end    
})

PlayerTab:AddSlider({
    Name = "Potencia de Salto (JumpPower)",
    Min = 50,
    Max = 300,
    Default = 50,
    Color = Color3.fromRGB(0, 255, 127),
    Increment = 5,
    ValueName = "Salto",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end    
})

PlayerTab:AddButton({
    Name = "Restaurar Valores por Defecto",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16
            char.Humanoid.JumpPower = 50
        end
    end    
})

----------------------------------------------------------------
-- 2. PESTAÑA: VISUALES (Iluminación y Brillo)
----------------------------------------------------------------
local VisualsTab = Window:MakeTab({
    Name = "Visuales",
    Icon = "rbxassetid://6023426922",
    PremiumOnly = false
})

VisualsTab:AddToggle({
    Name = "Modo Fullbright (Sin oscuridad)",
    Default = false,
    Callback = function(State)
        local Lighting = game:GetService("Lighting")
        if State then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.GlobalShadows = true
        end
    end
})

VisualsTab:AddButton({
    Name = "Destacar Personajes (Highlight)",
    Callback = function()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and not player.Character:FindFirstChild("VisualHighlight") then
                local hl = Instance.new("Highlight")
                hl.Name = "VisualHighlight"
                hl.Adornee = player.Character
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Parent = player.Character
            end
        end
    end    
})

----------------------------------------------------------------
-- 3. PESTAÑA: UTILIDADES (Cámara y Teletransporte)
----------------------------------------------------------------
local UtilsTab = Window:MakeTab({
    Name = "Utilidades",
    Icon = "rbxassetid://6023426918",
    PremiumOnly = false
})

UtilsTab:AddButton({
    Name = "Zoom Máximo de Cámara Infinito",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.CameraMaxZoomDistance = 999999
        player.CameraMinZoomDistance = 0.5
    end    
})

-- Inicializar la interfaz visual
OrionLib:Init()
