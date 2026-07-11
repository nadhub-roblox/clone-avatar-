local P = game:GetService("Players"); local LP = P.LocalPlayer
local G = Instance.new("ScreenGui", game:GetService("CoreGui")); G.Name = "S"
local F = Instance.new("Frame", G); F.Size = UDim2.new(0, 200, 0, 100); F.Position = UDim2.new(0.5,-100,0.4,-50); F.Draggable = true
local T = Instance.new("TextBox", F); T.Size = UDim2.new(1, 0, 0, 50); T.PlaceholderText = "Nhập Username thật..."
local B = Instance.new("TextButton", F); B.Size = UDim2.new(1, 0, 0, 50); B.Position = UDim2.new(0, 0, 0.5, 0); B.Text = "COPY AVATAR TOÀN CẦU"

B.MouseButton1Click:Connect(function()
    if T.Text == "" then return end
    B.Text = "ĐANG TÌM KIẾM..."
    
    -- Bước 1: Tra cứu ID của người đó trên hệ thống Roblox dựa vào tên đã nhập
    local idSuccess, targetId = pcall(function()
        return P:GetUserIdFromNameAsync(T.Text)
    end)
    
    if idSuccess and targetId and LP.Character then
        B.Text = "ĐANG TẢI ĐỒ..."
        task.wait(0.5)
        
        -- Bước 2: Tải trang phục từ ID vừa tìm được
        local ok, desc = pcall(function() return P:GetHumanoidDescriptionFromUserId(targetId) end)
        if ok and desc then 
            LP.Character.Humanoid:ApplyDescription(desc)
            B.Text = "OK THÀNH CÔNG" 
        else 
            B.Text = "GAME CHẶN ĐỔI ĐỒ" 
        end
        task.wait(1.5)
        B.Text = "COPY AVATAR TOÀN CẦU"
    else
        B.Text = "SAI USERNAME THẬT!"
        task.wait(1.5)
        B.Text = "COPY AVATAR TOÀN CẦU"
    end
end)
