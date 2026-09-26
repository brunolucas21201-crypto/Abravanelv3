local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove painel antigo
local antigo = playerGui:FindFirstChild("AbravanelHub")
if antigo then
    antigo:Destroy()
end

-- Envia mensagem
local function enviarChat(mensagem)
    local textChannels = TextChatService:FindFirstChild("TextChannels")

    if not textChannels then
        return
    end

    local canal = textChannels:FindFirstChild("RBXGeneral")

    if canal then
        canal:SendAsync(mensagem)
    end
end

-- GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AbravanelHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Painel
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 230, 0, 270)
mainFrame.Position = UDim2.new(0.5, -115, 0.5, -135)
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

-- Cores da bandeira da Colômbia
local AMARELO = Color3.fromRGB(252, 209, 22)
local AZUL = Color3.fromRGB(0, 56, 147)
local VERMELHO = Color3.fromRGB(206, 17, 38)

-- Fundo
local faixaAmarela = Instance.new("Frame")
faixaAmarela.Name = "FaixaAmarela"
faixaAmarela.Size = UDim2.new(1, 0, 0.50, 0)
faixaAmarela.Position = UDim2.new(0, 0, 0, 0)
faixaAmarela.BackgroundColor3 = AMARELO
faixaAmarela.BorderSizePixel = 0
faixaAmarela.ZIndex = 0
faixaAmarela.Parent = mainFrame

local faixaAzul = Instance.new("Frame")
faixaAzul.Name = "FaixaAzul"
faixaAzul.Size = UDim2.new(1, 0, 0.25, 0)
faixaAzul.Position = UDim2.new(0, 0, 0.50, 0)
faixaAzul.BackgroundColor3 = AZUL
faixaAzul.BorderSizePixel = 0
faixaAzul.ZIndex = 0
faixaAzul.Parent = mainFrame

local faixaVermelha = Instance.new("Frame")
faixaVermelha.Name = "FaixaVermelha"
faixaVermelha.Size = UDim2.new(1, 0, 0.25, 0)
faixaVermelha.Position = UDim2.new(0, 0, 0.75, 0)
faixaVermelha.BackgroundColor3 = VERMELHO
faixaVermelha.BorderSizePixel = 0
faixaVermelha.ZIndex = 0
faixaVermelha.Parent = mainFrame

-- Cabeçalho
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -100, 0, 38)
titleLabel.Position = UDim2.new(0, 12, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Abravanel Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 5
titleLabel.Parent = mainFrame

-- Bandeiras
local bandeiras = Instance.new("TextLabel")
bandeiras.Name = "Bandeiras"
bandeiras.Size = UDim2.new(0, 55, 0, 30)
bandeiras.Position = UDim2.new(1, -92, 0, 9)
bandeiras.BackgroundTransparency = 1
bandeiras.Text = "🇧🇷🇨🇴"
bandeiras.TextSize = 17
bandeiras.ZIndex = 5
bandeiras.Parent = mainFrame

-- Botão minimizar
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "Toggle"
toggleButton.Size = UDim2.new(0, 28, 0, 28)
toggleButton.Position = UDim2.new(1, -38, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
toggleButton.BackgroundTransparency = 0.15
toggleButton.BorderSizePixel = 0
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 18
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.ZIndex = 6
toggleButton.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

-- Área dos botões
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ContainerScroll"
scrollFrame.Size = UDim2.new(1, -20, 1, -58)
scrollFrame.Position = UDim2.new(0, 10, 0, 50)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ZIndex = 5
scrollFrame.Parent = mainFrame

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0, 60, 0, 60)
grid.CellPadding = UDim2.new(0, 8, 0, 8)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.SortOrder = Enum.SortOrder.LayoutOrder
grid.Parent = scrollFrame

grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(
        0,
        0,
        0,
        grid.AbsoluteContentSize.Y + 10
    )
end)

-- Criador de botões de texto
local function criarBotao(emoji, mensagem, ordem)
    local btn = Instance.new("TextButton")

    btn.Name = "Button_" .. ordem
    btn.Size = UDim2.new(0, 60, 0, 60)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.BackgroundTransparency = 0.08
    btn.BorderSizePixel = 0
    btn.Text = emoji
    btn.TextSize = 24
    btn.Font = Enum.Font.SourceSansBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.LayoutOrder = ordem
    btn.AutoButtonColor = false
    btn.ZIndex = 6
    btn.Parent = scrollFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.Activated:Connect(function()
        enviarChat(mensagem)

        btn.BackgroundColor3 = Color3.fromRGB(100, 100, 105)

        task.delay(0.25, function()
            if btn and btn.Parent then
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            end
        end)
    end)
end

-- Criador de botão com imagem
local function criarBotaoImagem(imageId, mensagem, ordem)
    local btn = Instance.new("ImageButton")

    btn.Name = "Button_" .. ordem
    btn.Size = UDim2.new(0, 60, 0, 60)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.BackgroundTransparency = 0.08
    btn.BorderSizePixel = 0
    btn.Image = imageId
    btn.ScaleType = Enum.ScaleType.Fit
    btn.LayoutOrder = ordem
    btn.AutoButtonColor = false
    btn.ZIndex = 6
    btn.Parent = scrollFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.Activated:Connect(function()
        enviarChat(mensagem)

        btn.BackgroundColor3 = Color3.fromRGB(100, 100, 105)

        task.delay(0.25, function()
            if btn and btn.Parent then
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            end
        end)
    end)
end

-- =========================================================
-- MENSAGENS
-- =========================================================

criarBotao(
    "🩸",
    ". ᴍᴀᴛ +1x ᴘᴀ Aʙʀᴀᴠᴀɴᴇʟ 🇧🇷🇨🇴",
    1
)

criarBotao(
    "🙋‍♂️",
    ". Ʀᴇɴᴅᴇʀ ғᴀ ᴀǫᴜɪ 🇧🇷🇨🇴",
    2
)

criarBotao(
    "🛞",
    "//furar pneu | Toma essa aí 🔪 🇧🇷🇨🇴",
    3
)

criarBotao(
    "🔓",
    "//lockpick | perdeu o carro, but 🪵 🇧🇷🇨🇴",
    4
)

criarBotao(
    "🔫",
    "//Coronhada de Scar 🪵 🇧🇷🇨🇴",
    5
)

criarBotao(
    "✋",
    "//Tapa 🇧🇷🇨🇴",
    6
)

criarBotao(
    "😵",
    "//Desmaiar | ala, dormiu 🤣 🇧🇷🇨🇴",
    7
)

criarBotao(
    "🚓",
    "//Algemar | Abravanel como sempre 🇧🇷🇨🇴",
    8
)

-- =========================================================
-- PIPOCA / RAJADA
-- =========================================================

-- COLOQUE AQUI O ID DA IMAGEM DA PIPOCA
local IMAGE_ID_PIPOCA = "rbxassetid://SEU_ID_DA_PIPOCA"

criarBotaoImagem(
    IMAGE_ID_PIPOCA,
    "//rajada nem tenta || teu carro virou pipoca 🇨🇴🇧🇷",
    9
)

-- =========================================================
-- MINIMIZAR / MAXIMIZAR
-- =========================================================

local minimizado = false

toggleButton.Activated:Connect(function()
    minimizado = not minimizado

    scrollFrame.Visible = not minimizado

    if minimizado then
        mainFrame.Size = UDim2.new(0, 230, 0, 48)

        faixaAmarela.Size = UDim2.new(1, 0, 0.50, 0)
        faixaAzul.Visible = false
        faixaVermelha.Visible = false

        titleLabel.ZIndex = 5
        bandeiras.ZIndex = 5

        toggleButton.Text = "+"
    else
        mainFrame.Size = UDim2.new(0, 230, 0, 270)

        faixaAmarela.Size = UDim2.new(1, 0, 0.50, 0)
        faixaAzul.Visible = true
        faixaVermelha.Visible = true

        titleLabel.ZIndex = 5
        bandeiras.ZIndex = 5

        toggleButton.Text = "-"
    end
end)
