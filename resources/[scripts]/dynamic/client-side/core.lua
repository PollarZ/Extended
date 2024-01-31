-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("dynamic")
vINVENTORY = Tunnel.getInterface("inventory")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Dynamic = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddButton",function(title,description,trigger,par,id,server)
	SendNUIMessage({ addbutton = true, title = title, description = description, trigger = trigger, par = par, id = id, server = server })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUBMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("SubMenu",function(title,description,id)
	SendNUIMessage({ addmenu = true, title = title, description = description, menuid = id })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("openMenu",function()
	SendNUIMessage({ show = true })
	SetNuiFocus(true,true)
	Dynamic = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLICKED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("clicked",function(Data,Callback)
	if Data["trigger"] and Data["trigger"] ~= "" then
		if Data["server"] == "true" then
			TriggerServerEvent(Data["trigger"],Data["param"])
		else
			TriggerEvent(Data["trigger"],Data["param"])
		end
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SetNuiFocus(false,false)
	Dynamic = false

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:closeSystem")
AddEventHandler("dynamic:closeSystem",function()
	if Dynamic then
		SendNUIMessage({ close = true })
		SetNuiFocus(false,false)
		Dynamic = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("globalFunctions",function()
	if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not LocalPlayer["state"]["Prison"] and not Dynamic and not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if GetEntityHealth(Ped) > 100 then
			if LocalPlayer["state"]["Premium"] then
				exports["dynamic"]:AddButton("Vestir Premium","Vestir-se com as vestimentas guardadas.","player:Outfit","aplicarpre","wardrobe",true)
				exports["dynamic"]:AddButton("Guardar Premium","Salvar suas vestimentas do corpo.","player:Outfit","salvarpre","wardrobe",true)
			end

			exports["dynamic"]:AddButton("Vestir","Vestir-se com as vestimentas guardadas.","player:Outfit","aplicar","wardrobe",true)
			exports["dynamic"]:AddButton("Guardar","Salvar suas vestimentas do corpo.","player:Outfit","salvar","wardrobe",true)
			exports["dynamic"]:SubMenu("Armário","Colocar/Retirar roupas.","wardrobe")

			exports["dynamic"]:AddButton("Chapéu","Colocar/Retirar o chapéu.","player:Outfit","Hat","clothes",true)
			exports["dynamic"]:AddButton("Máscara","Colocar/Retirar a máscara.","player:Outfit","Mask","clothes",true)
			exports["dynamic"]:AddButton("Óculos","Colocar/Retirar o óculos.","player:Outfit","Glasses","clothes",true)
			exports["dynamic"]:AddButton("Camisa","Colocar/Retirar a camisa.","player:Outfit","Shirt","clothes",true)
			exports["dynamic"]:AddButton("Jaqueta","Colocar/Retirar a jaqueta.","player:Outfit","Torso","clothes",true)
			exports["dynamic"]:AddButton("Mãos","Ajustas as mãos.","player:Outfit","Arms","clothes",true)
			exports["dynamic"]:AddButton("Colete","Colocar/Retirar o colete.","player:Outfit","Vest","clothes",true)
			exports["dynamic"]:AddButton("Calça","Colocar/Retirar a calça.","player:Outfit","Pants","clothes",true)
			exports["dynamic"]:AddButton("Sapatos","Colocar/Retirar o sapato.","player:Outfit","Shoes","clothes",true)
			exports["dynamic"]:AddButton("Acessórios","Colocar/Retirar os acessórios.","player:Outfit","Accessory","clothes",true)
			exports["dynamic"]:SubMenu("Roupas","Colocar/Retirar roupas.","clothes")

			local Vehicle = vRP.ClosestVehicle(7)
			local LastVehicle = GetLastDrivenVehicle()
			if IsEntityAVehicle(Vehicle) then
				if not IsPedInAnyVehicle(Ped) then
					if GetEntityModel(LastVehicle) == GetHashKey("flatbed") and not IsPedInAnyVehicle(Ped) then
						exports["dynamic"]:AddButton("Rebocar","Colocar o veículo na prancha.","inventory:Tow","","others",false)
					end

					if vRP.ClosestPed(3) then
						exports["dynamic"]:AddButton("Colocar no Veículo","Colocar no veículo mais próximo.","player:cvFunctions","cv","closestpeds",true)
						exports["dynamic"]:AddButton("Remover do Veículo","Remover do veículo mais próximo.","player:cvFunctions","rv","closestpeds",true)

						exports["dynamic"]:SubMenu("Jogador","Pessoa mais próxima de você.","closestpeds")
					end
				else
					exports["dynamic"]:AddButton("Sentar no Motorista","Sentar no banco do motorista.","player:seatPlayer","0","vehicle",false)
					exports["dynamic"]:AddButton("Sentar no Passageiro","Sentar no banco do passageiro.","player:seatPlayer","1","vehicle",false)
					exports["dynamic"]:AddButton("Sentar em Outros","Sentar no banco do passageiro.","player:seatPlayer","2","vehicle",false)
					exports["dynamic"]:AddButton("Mexer nos Vidros","Levantar/Abaixar os vidros.","player:Windows","","vehicle",false)

					exports["dynamic"]:SubMenu("Veículo","Funções do veículo.","vehicle")
				end

				exports["dynamic"]:AddButton("Porta do Motorista","Abrir porta do motorista.","player:Doors","1","doors",true)
				exports["dynamic"]:AddButton("Porta do Passageiro","Abrir porta do passageiro.","player:Doors","2","doors",true)
				exports["dynamic"]:AddButton("Porta Traseira Esquerda","Abrir porta traseira esquerda.","player:Doors","3","doors",true)
				exports["dynamic"]:AddButton("Porta Traseira Direita","Abrir porta traseira direita.","player:Doors","4","doors",true)
				exports["dynamic"]:AddButton("Porta-Malas","Abrir porta-malas.","player:Doors","5","doors",true)
				exports["dynamic"]:AddButton("Capô","Abrir capô.","player:Doors","6","doors",true)

				exports["dynamic"]:SubMenu("Portas","Portas do veículo.","doors")
			end

			exports["dynamic"]:AddButton("Propriedades","Marcar/Desmarcar propriedades no mapa.","propertys:Blips","","others",false)
			exports["dynamic"]:AddButton("Ferimentos","Verificar ferimentos no corpo.","paramedic:Injuries","","others",false)
			exports["dynamic"]:AddButton("Desbugar","Recarregar o personagem.","player:Debug","","others",true)
			exports["dynamic"]:SubMenu("Outros","Todas as funções do personagem.","others")

			exports["dynamic"]:openMenu()
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMERGENCYFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("emergencyFunctions",function()
	if (LocalPlayer["state"]["Policia"] or LocalPlayer["state"]["Paramedico"]) and not IsPauseMenuActive() and not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not LocalPlayer["state"]["Prison"] and not Dynamic then
		local Ped = PlayerPedId()
		if LocalPlayer["state"]["Policia"] then
			exports["dynamic"]:AddButton("10-13","Oficial desmaiado/ferido.","dynamic:Tencode","13","tencode",true)
			exports["dynamic"]:AddButton("10-20","Localização.","dynamic:Tencode","20","tencode",true)
			exports["dynamic"]:AddButton("10-38","Abordagem de trânsito.","dynamic:Tencode","38","tencode",true)
			exports["dynamic"]:AddButton("10-78","Apoio com prioridade.","dynamic:Tencode","78","tencode",true)
			exports["dynamic"]:SubMenu("Emergência","Avisos emergenciais.","tencode")

			if GetEntityHealth(Ped) > 100 and not IsPedInAnyVehicle(Ped) then
				exports["dynamic"]:AddButton("Carregar","Carregar a pessoa mais próxima.","inventory:Carry","","player",true)
				exports["dynamic"]:AddButton("Colocar no Veículo","Colocar no veículo mais próximo.","player:cvFunctions","cv","player",true)
				exports["dynamic"]:AddButton("Remover do Veículo","Remover do veículo mais próximo.","player:cvFunctions","rv","player",true)
				exports["dynamic"]:AddButton("Remover Chapéu","Remover da pessoa mais próxima.","skinshop:Remove","Hat","player",true)
				exports["dynamic"]:AddButton("Remover Máscara","Remover da pessoa mais próxima.","skinshop:Remove","Mask","player",true)
				exports["dynamic"]:AddButton("Remover Óculos","Remover da pessoa mais próxima.","skinshop:Remove","Glasses","player",true)
				exports["dynamic"]:SubMenu("Jogador","Pessoa mais próxima de você.","player")

				exports["dynamic"]:AddButton("Sheriff","Fardamento de oficial.","player:Preset","1","prePolice",true)
				exports["dynamic"]:AddButton("Los Santos Police","Fardamento de oficial.","player:Preset","2","prePolice",true)
				exports["dynamic"]:AddButton("State Police","Fardamento de oficial.","player:Preset","3","prePolice",true)
				exports["dynamic"]:AddButton("Park Ranger","Fardamento de oficial.","player:Preset","4","prePolice",true)
				exports["dynamic"]:SubMenu("Fardamentos","Todos os fardamentos policiais.","prePolice")
			end

			exports["dynamic"]:AddButton("Computador","Computador de bordo policial.","police:Open","",false,false)

			exports["dynamic"]:openMenu()
		elseif LocalPlayer["state"]["Paramedico"] then
			if GetEntityHealth(Ped) > 100 and not IsPedInAnyVehicle(Ped) then
				exports["dynamic"]:AddButton("Carregar","Carregar a pessoa mais próxima.","inventory:Carry","","player",true)
				exports["dynamic"]:AddButton("Colocar no Veículo","Colocar no veículo mais próximo.","player:cvFunctions","cv","player",true)
				exports["dynamic"]:AddButton("Remover do Veículo","Remover do veículo mais próximo.","player:cvFunctions","rv","player",true)
				exports["dynamic"]:AddButton("Remover Chapéu","Remover da pessoa mais próxima.","skinshop:Remove","Hat","player",true)
				exports["dynamic"]:AddButton("Remover Máscara","Remover da pessoa mais próxima.","skinshop:Remove","Mask","player",true)
				exports["dynamic"]:AddButton("Remover Óculos","Remover da pessoa mais próxima.","skinshop:Remove","Glasses","player",true)
				exports["dynamic"]:SubMenu("Jogador","Pessoa mais próxima de você.","player")

				exports["dynamic"]:AddButton("Medical Center","Fardamento de doutor.","player:Preset","5","preMedic",true)
				exports["dynamic"]:AddButton("Medical Center","Fardamento de paramédico.","player:Preset","6","preMedic",true)
				exports["dynamic"]:AddButton("Medical Center","Fardamento de paramédico interno.","player:Preset","7","preMedic",true)
				exports["dynamic"]:SubMenu("Fardamentos","Todos os fardamentos médicos.","preMedic")

				exports["dynamic"]:openMenu()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("globalFunctions","Abrir menu principal.","keyboard","F9")
RegisterKeyMapping("emergencyFunctions","Abrir menu de emergencial.","keyboard","F10")