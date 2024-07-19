local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DraggableRectangleUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 300)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local TopBorder = Instance.new("Frame")
TopBorder.Name = "TopBorder"
TopBorder.Size = UDim2.new(1, 0, 0, 20)
TopBorder.Position = UDim2.new(0, 0, 0, 0)
TopBorder.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TopBorder.BorderSizePixel = 0
TopBorder.Parent = MainFrame

local CMDLabel = Instance.new("TextLabel")
CMDLabel.Name = "CMDLabel"
CMDLabel.Size = UDim2.new(0, 40, 1, 0)
CMDLabel.Position = UDim2.new(0, 33, 0, 0)
CMDLabel.BackgroundTransparency = 1
CMDLabel.Text = "Command Bar"
CMDLabel.TextColor3 = Color3.new(1, 1, 1)
CMDLabel.TextStrokeTransparency = 0
CMDLabel.Font = Enum.Font.SourceSans
CMDLabel.TextSize = 14
CMDLabel.Parent = TopBorder

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 20, 1, 0)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextStrokeTransparency = 0
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 14
CloseButton.Parent = TopBorder

local MaximizeButton = Instance.new("TextButton")
MaximizeButton.Name = "MaximizeButton"
MaximizeButton.Size = UDim2.new(0, 20, 1, 0)
MaximizeButton.Position = UDim2.new(1, -40, 0, 0)
MaximizeButton.BackgroundTransparency = 1
MaximizeButton.Text = "□"
MaximizeButton.TextColor3 = Color3.new(1, 1, 1)
MaximizeButton.TextStrokeTransparency = 0
MaximizeButton.Font = Enum.Font.SourceSans
MaximizeButton.TextSize = 14
MaximizeButton.Parent = TopBorder

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 20, 1, 0)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.TextStrokeTransparency = 0
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.TextSize = 14
MinimizeButton.Parent = TopBorder

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(1, 0, 0, 20)
VersionLabel.Position = UDim2.new(0, 0, 0, 20)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "Made by pwrsk"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.TextStrokeTransparency = 0
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 14
VersionLabel.Parent = MainFrame

local CopyrightLabel = Instance.new("TextLabel")
CopyrightLabel.Name = "CopyrightLabel"
CopyrightLabel.Size = UDim2.new(1, 0, 0, 20)
CopyrightLabel.Position = UDim2.new(0, 0, 0, 40)
CopyrightLabel.BackgroundTransparency = 1
CopyrightLabel.Text = "Roundix corporation. All rights reserved"
CopyrightLabel.TextColor3 = Color3.new(1, 1, 1)
CopyrightLabel.TextStrokeTransparency = 0
CopyrightLabel.Font = Enum.Font.SourceSans
CopyrightLabel.TextSize = 14
CopyrightLabel.Parent = MainFrame

local CommandTextBox = Instance.new("TextBox")
CommandTextBox.Name = "CommandTextBox"
CommandTextBox.Size = UDim2.new(1, -10, 0, 20)
CommandTextBox.Position = UDim2.new(0, 5, 1, -25)
CommandTextBox.BackgroundColor3 = Color3.new(0, 0, 0)
CommandTextBox.BorderSizePixel = 0
CommandTextBox.TextColor3 = Color3.new(1, 1, 1)
CommandTextBox.TextStrokeTransparency = 0
CommandTextBox.Font = Enum.Font.SourceSans
CommandTextBox.TextSize = 14
CommandTextBox.Text = "C:/Users/" .. game.Players.LocalPlayer.Name .. "> "
CommandTextBox.ClearTextOnFocus = false
CommandTextBox.Parent = MainFrame

local dragging = false
local dragStart = nil
local frameStart = nil
local isMaximized = false

TopBorder.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        frameStart = MainFrame.Position
    end
end)

TopBorder.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

MaximizeButton.MouseButton1Click:Connect(function()
    if isMaximized then
        MainFrame.Size = UDim2.new(0, 600, 0, 300)
        MainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
        isMaximized = false
    else
        MainFrame.Size = UDim2.new(1, 0, 1, 0)
        MainFrame.Position = UDim2.new(0, 0, 0, 0)
        isMaximized = true
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Size = UDim2.new(0, 600, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
end)

CommandTextBox.Changed:Connect(function(property)
    if property == "Text" then
        local prefix = "C:/Users/" .. game.Players.LocalPlayer.Name .. "> "
        if not CommandTextBox.Text:match("^" .. prefix) then
            CommandTextBox.Text = prefix .. CommandTextBox.Text:sub(#prefix + 1)
            CommandTextBox:SetSelection(#prefix + 1, #prefix + 1)
        end
    end
end)

local secretCommands = {
    ["launch"] = function(arg)
        if arg == "roundix" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pwrsk/dh/main/main-script"))()
        elseif arg == "exlare" then
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cplusplusguides/sex/main/niegrs')))()
        end
    end,
    ["printidentity()"] = function()
        print("Current indentity is 69.")
    end,
    ["iy"] = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
}

CommandTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local prefix = "C:/Users/" .. game.Players.LocalPlayer.Name .. "> "
        local command = CommandTextBox.Text:sub(#prefix + 1)
        CommandTextBox.Text = prefix
        local commandName, arg = command:match("(%S+)%s*(%S*)")
        local func = secretCommands[commandName]
        if func then
            func(arg)
        else
            print("Unknown command: " .. commandName)
        end
    end
end)
