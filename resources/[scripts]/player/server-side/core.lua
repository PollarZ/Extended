-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("player",Creative)
vCLIENT = Tunnel.getInterface("player")
vSKINSHOP = Tunnel.getInterface("skinshop")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:DEMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Demand")
AddEventHandler("player:Demand",function(OtherSource)
	local source = source
	local Passport = vRP.Passport(source)
	local OtherPassport = vRP.Passport(OtherSource)
	if Passport and OtherPassport then
		local Keyboard = vKEYBOARD.Primary(source,"Valor da Cobrança")
		if Keyboard and vRP.Passport(OtherSource) then
			local Price = parseInt(Keyboard[1])
			if vRP.Request(OtherSource,"Cobrança","Aceitar a cobrança de <b>$"..parseFormat(Price).."</b> feita por <b>"..vRP.FullName(Passport).."</b>.") then
				if vRP.PaymentFull(OtherPassport,Price,true) then
					vRP.GiveBank(Passport,Price,true)
				end
			else
				TriggerClientEvent("Notify",source,"Cobrança","Pedido recusado.","vermelho",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
local Debug = {}
RegisterServerEvent("player:Debug")
AddEventHandler("player:Debug",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Debug[Passport] or os.time() > Debug[Passport] then
		TriggerClientEvent("target:Debug",source)
		TriggerEvent("DebugObjects",Passport)
		Debug[Passport] = os.time() + 300
		vRPC.ReloadCharacter(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Stress")
AddEventHandler("player:Stress",function(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.DowngradeStress(Passport,Number)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		local Message = string.sub(History:sub(4),1,100)

		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("showme:pressMe",v,source,Message,10)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if Message[2] == "friend" then
			local ClosestPed = vRPC.ClosestPed(source,2)
			if ClosestPed and vRP.GetHealth(ClosestPed) > 100 and not Player(ClosestPed)["state"]["Handcuff"] then
				if vRP.Request(ClosestPed,"Animação","Pedido de <b>"..vRP.FullName(Passport).."</b> da animação <b>"..Message[1].."</b>?") then
					TriggerClientEvent("emotes",ClosestPed,Message[1])
					TriggerClientEvent("emotes",source,Message[1])
				end
			end
		else
			TriggerClientEvent("emotes",source,Message[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if vRP.HasService(Passport,"Paramedico") then
				TriggerClientEvent("emotes",ClosestPed,Message[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E3
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e3",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasGroup(Passport,"Admin") then
			local Players = vRPC.ClosestPeds(source,50)
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("emotes",v,Message[1])
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Doors")
AddEventHandler("player:Doors",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Vehicle,Network = vRPC.VehicleList(source,5)
		if Vehicle then
			local Players = vRPC.Players(source)
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("player:syncDoors",v,Network,Number)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CVFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:cvFunctions")
AddEventHandler("player:cvFunctions",function(Mode)
	local Distance = 1
	if Mode == "rv" then
		Distance = 10
	end

	local source = source
	local Passport = vRP.Passport(source)
	local OtherSource = vRPC.ClosestPed(source,Distance)
	if Passport and OtherSource then
		if vRP.HasService(Passport,"Emergencia") or vRP.ConsultItem(Passport,"rope",1) then
			local Vehicle,Network = vRPC.VehicleList(source,5)
			if Vehicle then
				local Networked = NetworkGetEntityFromNetworkId(Network)

				if GetVehicleDoorLockStatus(Networked) <= 1 then
					if Mode == "rv" then
						vCLIENT.RemoveVehicle(OtherSource)
					elseif Mode == "cv" then
						vCLIENT.PlaceVehicle(OtherSource,Network)
						TriggerEvent("inventory:CarryDetach",source,Passport)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local Preset = {
	["1"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 161, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 148, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 54, texture = 0 },
			["tshirt"] = { item = 197, texture = 0 },
			["torso"] = { item = 443, texture = 0 },
			["accessory"] = { item = 167, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 4, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 170, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 160, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 9, texture = 0 },
			["tshirt"] = { item = 245, texture = 0 },
			["torso"] = { item = 474, texture = 0 },
			["accessory"] = { item = 137, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 0, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["2"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 161, texture = 1 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 146, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 54, texture = 0 },
			["tshirt"] = { item = 197, texture = 0 },
			["torso"] = { item = 443, texture = 3 },
			["accessory"] = { item = 167, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 4, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 170, texture = 1 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 158, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 9, texture = 0 },
			["tshirt"] = { item = 245, texture = 0 },
			["torso"] = { item = 474, texture = 3 },
			["accessory"] = { item = 137, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 0, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["3"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 161, texture = 2 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 148, texture = 3 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 54, texture = 0 },
			["tshirt"] = { item = 197, texture = 0 },
			["torso"] = { item = 443, texture = 6 },
			["accessory"] = { item = 167, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 4, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 170, texture = 2 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 160, texture = 3 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 9, texture = 0 },
			["tshirt"] = { item = 245, texture = 0 },
			["torso"] = { item = 474, texture = 6 },
			["accessory"] = { item = 137, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 0, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["4"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 161, texture = 3 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 148, texture = 5 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 54, texture = 0 },
			["tshirt"] = { item = 197, texture = 0 },
			["torso"] = { item = 443, texture = 9 },
			["accessory"] = { item = 167, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 4, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 170, texture = 3 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 160, texture = 5 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 9, texture = 0 },
			["tshirt"] = { item = 245, texture = 0 },
			["torso"] = { item = 474, texture = 9 },
			["accessory"] = { item = 137, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 0, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["5"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 20, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 1, texture = 1 },
			["tshirt"] = { item = 96, texture = 0 },
			["torso"] = { item = 32, texture = 7 },
			["accessory"] = { item = 126, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 79, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 23, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 1, texture = 0 },
			["tshirt"] = { item = 101, texture = 0 },
			["torso"] = { item = 58, texture = 7 },
			["accessory"] = { item = 96, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 91, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["6"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 149, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 57, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 25, texture = 0 },
			["tshirt"] = { item = 94, texture = 0 },
			["torso"] = { item = 249, texture = 0 },
			["accessory"] = { item = 127, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 86, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 157, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 65, texture = 0 },
			["mask"] = { item = 121, texture = 0 },
			["shoes"] = { item = 106, texture = 0 },
			["tshirt"] = { item = 71, texture = 1 },
			["torso"] = { item = 257, texture = 0 },
			["accessory"] = { item = 97, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 104, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["7"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 20, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 1, texture = 1 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 146, texture = 6 },
			["accessory"] = { item = 127, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 85, texture = 1 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 23, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 1, texture = 0 },
			["tshirt"] = { item = 2, texture = 0 },
			["torso"] = { item = 141, texture = 1 },
			["accessory"] = { item = 97, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 109, texture = 1 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Preset")
AddEventHandler("player:Preset",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Emergencia") and Preset[Number] then
		local Model = vRP.ModelPlayer(source)

		if Preset[Number][Model] then
			TriggerClientEvent("skinshop:Apply",source,Preset[Number][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrunk")
AddEventHandler("player:checkTrunk",function()
	local source = source
	local ClosestPed = vRPC.ClosestPed(source,2)
	if ClosestPed then
		TriggerClientEvent("player:checkTrunk",ClosestPed)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrash")
AddEventHandler("player:checkTrash",function()
	local source = source
	local ClosestPed = vRPC.ClosestPed(source,2)
	if ClosestPed then
		TriggerClientEvent("player:checkTrash",ClosestPed)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKSHOES
-----------------------------------------------------------------------------------------------------------------------------------------
local UniqueShoes = {}
RegisterServerEvent("player:checkShoes")
AddEventHandler("player:checkShoes",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not UniqueShoes[Entity] then
			UniqueShoes[Entity] = os.time()
		end

		if os.time() >= UniqueShoes[Entity] and vSKINSHOP.checkShoes(Entity) then
			vRP.GenerateItem(Passport,"WEAPON_SHOES",2,true)
			UniqueShoes[Entity] = os.time() + 300
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVIT
-----------------------------------------------------------------------------------------------------------------------------------------
local Removit = {
	["mp_m_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Outfit")
AddEventHandler("player:Outfit",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Reposed(Passport) and not exports["hud"]:Wanted(Passport) then
		if Mode == "aplicar" then
			local Result = vRP.GetSrvData("Outfit:"..Passport,true)
			if Result["pants"] then
				TriggerClientEvent("skinshop:Apply",source,Result)
				TriggerClientEvent("Notify",source,"Sucesso","Roupas aplicadas.","verde",5000)
			else
				TriggerClientEvent("Notify",source,"Aviso","Roupas não encontradas.","amarelo",5000)
			end
		elseif Mode == "salvar" then
			local Custom = vSKINSHOP.Customization(source)
			if Custom then
				vRP.SetSrvData("Outfit:"..Passport,Custom,true)
				TriggerClientEvent("Notify",source,"Sucesso","Roupas salvas.","verde",5000)
			end
		elseif Mode == "aplicarpre" then
			local Result = vRP.GetSrvData("Premiumfit:"..Passport,true)
			if Result["pants"] then
				TriggerClientEvent("skinshop:Apply",source,Result)
				TriggerClientEvent("Notify",source,"Sucesso","Roupas aplicadas.","verde",5000)
			else
				TriggerClientEvent("Notify",source,"Aviso","Roupas não encontradas.","amarelo",5000)
			end
		elseif Mode == "salvarpre" then
			local Custom = vSKINSHOP.Customization(source)
			if Custom then
				vRP.SetSrvData("Premiumfit:"..Passport,Custom,true)
				TriggerClientEvent("Notify",source,"Sucesso","Roupas salvas.","verde",5000)
			end
		elseif Mode == "remover" then
			local Model = vRP.ModelPlayer(source)

			if Removit[Model] then
				TriggerClientEvent("skinshop:Apply",source,Removit[Model])
			end
		else
			TriggerClientEvent("skinshop:set"..Mode,source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Death")
AddEventHandler("player:Death",function(PedSource,OtherSource)
	local Passport = vRP.Passport(PedSource)
	local OtherPassport = vRP.Passport(OtherSource)
	if Passport and OtherPassport and Passport ~= OtherPassport then
		local Identity = vRP.Identity(Passport)
		local OtherIdentity = vRP.Identity(OtherPassport)
		if Identity and OtherIdentity then
			if vRP.DoesEntityExist(PedSource) and vRP.DoesEntityExist(OtherSource) then
				local Coords = vRP.GetEntityCoords(PedSource)
				local OtherCoords = vRP.GetEntityCoords(OtherSource)

				exports["vrp"]:Embed("Deaths","**Passaporte do Assassino:** "..OtherPassport.."\n**Localização do Assassino:** "..mathLength(OtherCoords["x"])..","..mathLength(OtherCoords["y"])..","..mathLength(OtherCoords["z"]).."\n\n**Passaporte da Vítima:** "..Passport.."\n**Localização da Vítima:** "..mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]).."\n\n**Data & Hora:** "..os.date("%d/%m/%Y").." às "..os.date("%H:%M"),0xa3c846)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("player:DuiTable",source,DuiTextures)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Debug[Passport] then
		Debug[Passport] = nil
	end
end)