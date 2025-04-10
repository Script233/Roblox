-- Mostrar mensaje
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
    Text = "[TSB SCRIPT] Activado por tu reina.";
    Color = Color3.fromRGB(255, 105, 180);
})

-- Anti-AFK
for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    v:Disable()
end

-- Speed Boost
local humanoid = char:WaitForChild("Humanoid")
humanoid.WalkSpeed = 50 -- Valor predeterminado es 16

-- Teleport al enemigo más cercano (cada segundo)
RunService.RenderStepped:Connect(function()
    local closestDist = math.huge
    local target = nil

    for i, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if dist < closestDist and dist < 100 then -- rango máximo
                closestDist = dist
                target = plr
            end
        end
    end

    if target then
        hrp.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) -- detrás del enemigo
    end
end)
