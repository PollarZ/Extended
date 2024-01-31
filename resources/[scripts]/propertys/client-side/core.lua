-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("propertys",Creative)
vSERVER = Tunnel.getInterface("propertys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Init = ""
local Blips = {}
local Chest = ""
local Theft = nil
local Interior = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)

			if Init == "" then
				for Name,v in pairs(Propertys) do
					if #(Coords - v) <= 0.75 then
						TimeDistance = 1

						if IsControlJustPressed(1,38) then
							local Consult = vSERVER.Propertys(Name)

							if Consult then
								if Consult == "Nothing" then
									for Line,v in pairs(Informations) do
										exports["dynamic"]:AddButton("Baú","Total de <yellow>"..v["Vault"].."Kg</yellow> no compartimento.","","",Line,false)
										exports["dynamic"]:AddButton("Geladeira","Total de <yellow>"..v["Fridge"].."Kg</yellow> no compartimento.","","",Line,false)
										exports["dynamic"]:AddButton("Credenciais","Máximo <yellow>1</yellow> proprietário e <yellow>3</yellow> moradores.","","",Line,false)
										exports["dynamic"]:AddButton("Comprar","Custo de <yellow>$"..parseFormat(v["Price"]).."</yellow> dólares.","propertys:Buy",Name.."-"..Line,Line,true)
										exports["dynamic"]:SubMenu(Line,"Informações sobre o interior.",Line)
									end
								else
									exports["dynamic"]:AddButton("Entrar","Adentrar a propriedade.","propertys:Enter",Name,false,false)
									exports["dynamic"]:AddButton("Credenciais","Reconfigurar os cartões de acesso.","propertys:Credentials",Name,false,true)
									exports["dynamic"]:AddButton("Cartões","Comprar um novo cartão de acesso.","propertys:Item",Name,false,true)
									exports["dynamic"]:AddButton("Fechadura","Trancar/Destrancar a propriedade.","propertys:Lock",Name,false,true)
									exports["dynamic"]:AddButton("Garagem","Adicionar/Reajustar a garagem.","garages:Propertys",Name,false,true)
									exports["dynamic"]:AddButton("Vender","Se desfazer da propriedade.","propertys:Sell",Name,false,true)
									exports["dynamic"]:AddButton("Transferência","Mudar proprietário.","propertys:Transfer",Name,false,true)
									exports["dynamic"]:AddButton("Hipoteca",Consult["Tax"],"","",false,false)

									Interior = Consult["Interior"]
								end

								exports["dynamic"]:openMenu()
							end
						end
					end
				end
			else
				if Interiors[Interior] then
					SetPlayerBlipPositionThisFrame(Propertys[Init]["x"],Propertys[Init]["y"])

					if Coords["z"] < (Interiors[Interior]["Exit"]["z"] - 25.0) then
						SetEntityCoords(Ped,Interiors[Interior]["Exit"],false,false,false,false)
					end

					if Theft and Robbery[Interior]["Furniture"] then
						for Index,v in pairs(Robbery[Interior]["Furniture"]) do
							if #(Coords - v) <= 1.0 then
								TimeDistance = 1
								DrawText3D(v,"~g~E~w~  ROUBAR")

								if IsControlJustPressed(1,38) and vSERVER.Robbery(Init,Index) then
									vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)

									if exports["taskbar"]:Task(5,10000) then
										vSERVER.Paybbery(Init,Index)
									end

									vRP.Destroy()
								end
							end
						end

						if Theft < GetGameTimer() and GetEntitySpeed(Ped) > 2 then
							Theft = GetGameTimer() + 60000
							vSERVER.Police(Propertys[Init])
						end
					end

					for Line,v in pairs(Interiors[Interior]) do
						if #(Coords - v) <= 0.75 then
							TimeDistance = 1

							if Line == "Exit" and IsControlJustPressed(1,38) then
								SetEntityCoords(Ped,Propertys[Init],false,false,false,false)
								vSERVER.Toggle(Init,"Exit")
								Interior = ""
								Theft = nil
								Chest = ""
								Init = ""
							elseif not Theft and (Line == "Vault" or Line == "Fridge") and IsControlJustPressed(1,38) and vSERVER.Permission(Init) then
								vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
								SendNUIMessage({ Action = "Open" })
								SetNuiFocus(true,true)
								Chest = Line
							elseif not Theft and Line == "Clothes" and IsControlJustPressed(1,38) then
								ClothesMenu()
							end
						end
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHESMENU
-----------------------------------------------------------------------------------------------------------------------------------------
function ClothesMenu()
	exports["dynamic"]:AddButton("Guardar","Salvar suas vestimentas do corpo.","propertys:Clothes","save",false,true)
	exports["dynamic"]:AddButton("Shopping","Abrir a loja de vestimentas.","skinshop:Open","",false,false)
	exports["dynamic"]:SubMenu("Vestir","Abrir lista com todas as vestimentas.","apply")
	exports["dynamic"]:SubMenu("Remover","Abrir lista com todas as vestimentas.","delete")

	local Clothes = vSERVER.Clothes()
	if parseInt(#Clothes) > 0 then
		for _,v in pairs(Clothes) do
			exports["dynamic"]:AddButton(v,"Vestir-se com as vestimentas.","propertys:Clothes","apply-"..v,"apply",true)
			exports["dynamic"]:AddButton(v,"Remover a vestimenta salva.","propertys:Clothes","delete-"..v,"delete",true)
		end
	end

	exports["dynamic"]:openMenu()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:CLOTHESRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:ClothesReset")
AddEventHandler("propertys:ClothesReset",function()
	TriggerEvent("dynamic:closeSystem")
	ClothesMenu()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:ENTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Enter")
AddEventHandler("propertys:Enter",function(Name,Thefting)
	if Thefting then
		Theft = GetGameTimer() + 10000
		Interior = Thefting
	end

	Init = Name
	local Ped = PlayerPedId()
	vSERVER.Toggle(Init,"Enter")
	TriggerEvent("dynamic:closeSystem")
	SetEntityCoords(Ped,Interiors[Interior]["Exit"],false,false,false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local Inventory,Chest,InvPeso,InvMax,ChestPeso,ChestMax = vSERVER.Request(Init,Chest)
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, InvPeso = InvPeso, InvMax = InvMax, ChestPeso = ChestPeso, ChestMax = ChestMax })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	vRP.Destroy()

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Take(Data["slot"],Data["amount"],Data["target"],Init,Chest)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"],Init,Chest)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"],Init,Chest)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Update")
AddEventHandler("propertys:Update",function()
	SendNUIMessage({ Action = "Request" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:WEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Weight")
AddEventHandler("propertys:Weight",function(InvPeso,InvMax,ChestPeso,ChestMax)
	SendNUIMessage({ Action = "Weight", InvPeso = InvPeso, InvMax = InvMax, ChestPeso = ChestPeso, ChestMax = ChestMax })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Tables = {}
	for _,v in pairs(Propertys) do
		Tables[#Tables + 1] = { v,0.75,"E","Propriedade","Pressione para acessar" }
	end

	for _,Intern in pairs(Interiors) do
		for Line,v in pairs(Intern) do
			local Message = "Saída"

			if Line == "Vault" then
				Message = "Baú"
			elseif Line == "Fridge" then
				Message = "Geladeira"
			elseif Line == "Clothes" then
				Message = "Armário"
			end

			Tables[#Tables + 1] = { v,0.75,"E",Message,"Pressione para acessar" }
		end
	end

	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Blips")
AddEventHandler("propertys:Blips",function()
	if json.encode(Blips) ~= "[]" then
		for _,v in pairs(Blips) do
			if DoesBlipExist(v) then
				RemoveBlip(v)
			end
		end

		Blips = {}

		TriggerEvent("Notify","Sucesso","Marcações desativadas.","verde",10000)
	else
		for Name,v in pairs(Propertys) do
			Blips[Name] = AddBlipForCoord(v["x"],v["y"],v["z"])
			SetBlipSprite(Blips[Name],374)
			SetBlipAsShortRange(Blips[Name],true)
			SetBlipColour(Blips[Name],GlobalState["Markers"][Name] and 35 or 43)
			SetBlipScale(Blips[Name],0.4)
		end

		TriggerEvent("Notify","Sucesso","Marcações ativadas.","verde",10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(Coords,Text)
	local onScreen,x,y = World3dToScreen2d(Coords["x"],Coords["y"],Coords["z"])

	if onScreen then
		SetTextFont(4)
		SetTextCentre(true)
		SetTextProportional(1)
		SetTextScale(0.35,0.35)
		SetTextColour(255,255,255,150)

		SetTextEntry("STRING")
		AddTextComponentString(Text)
		EndTextCommandDisplayText(x,y)

		local Width = string.len(Text) / 160 * 0.45
		DrawRect(x,y + 0.0125,Width,0.03,15,15,15,175)
	end
end