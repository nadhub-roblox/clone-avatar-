local P = game:GetService("Players"); local LP = P.LocalPlayer
local G = Instance.new("ScreenGui", game:GetService("CoreGui")); G.Name = "S"
local F = Instance.new("Frame", G); F.Size = UDim2.new(0, 200, 0, 100); F.Position = UDim2.new(0.5,-100,0.4,-50); F.Draggable = true
local T = Instance.new("TextBox", F); T.Size = UDim2.new(1, 0, 0, 50); T.PlaceholderText = "Nhập tên..."
local B = Instance.new("TextButton", F); B.Size = UDim2.new(1, 0, 0, 50); B.Position = UDim2.new(0, 0, 0.5, 0); B.Text = "COPY AVATAR"

B.MouseButton1Click:Connect(function()
    local target = P:FindFirstChild(T.Text)
    if target and LP.Character then
        B.Text = "..."
        task.wait(0.5) -- Delay an toàn
        local ok, desc = pcall(function() return P:GetHumanoidDescriptionFromUserId(target.UserId) end)
        if ok then LP.Character.Humanoid:ApplyDescription(desc); B.Text = "OK" 
        else B.Text = "LỖI" end
        task.wait(1)
        B.Text = "COPY AVATAR"
    end
end)
