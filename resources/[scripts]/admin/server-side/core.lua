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
Tunnel.bindInterface("admin",Creative)
vCLIENT = Tunnel.getInterface("admin")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- UGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ugroups",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and parseInt(Message[1]) > 0 and vRP.HasGroup(Passport,"Admin") then
		local Messages = ""
		local Groups = vRP.Groups()
		local OtherPassport = Message[1]
		for Permission,_ in pairs(Groups) do
			local Data = vRP.DataGroups(Permission)
			if Data[OtherPassport] then
				Messages = Messages.."<b>Permissão:</b> "..Permission.."<br><b>Nível:</b> "..Data[OtherPassport].."<br>"
			end
		end

		if Messages ~= "" then
			TriggerClientEvent("Notify",source,"Grupos Pertencentes",Messages,"verde",10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("usource",function(source,Message)
	local Passport = vRP.Passport(source)
	local OtherSource = parseInt(Message[1])
	if Passport and OtherSource and OtherSource > 0 and vRP.Passport(OtherSource) and vRP.HasGroup(Passport,"Admin") then
		TriggerClientEvent("Notify",source,"Informações","<b>Passaporte:</b> "..vRP.Passport(OtherSource),"azul",5000)
		exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** usource "..Message[1],0xa3c846)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAM
-----------------------------------------------------------------------------------------------------------------------------------------
local FreeHook = "https://discord.com/api/webhooks/1120038819719295087/YfSpglgn9lrtp1dk3s9Tmvfnjxb15LUeEOkOLU-jDt6IXCCV9Ny7mSrNZ2d2_WlMWz1s"
RegisterCommand("cam",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasPermission(Passport,"Camera") then
		TriggerClientEvent("freecam:Active",source)
		exports["megazord"]:Discord("**Passaporte:** "..Passport.."\n**Coords:** "..vRP.GetEntityCoords(source),source,FreeHook)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ID
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("id",function(source,Message)
	local Passport = vRP.Passport(source)
	local OtherPassport = parseInt(Message[1])
	if Passport and OtherPassport and OtherPassport > 0 and vRP.Identity(OtherPassport) and vRP.HasGroup(Passport,"Admin") then
		TriggerClientEvent("Notify",source,false,"<b>Nome:</b> "..vRP.FullName(OtherPassport),"azul",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("skin",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and Message[2] and vRPC.ModelExist(source,Message[2]) then
		if vRP.HasGroup(Passport,"Admin") then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				vRPC.Skin(ClosestPed,Message[2])
				vRP.SkinCharacter(parseInt(Message[1]),Message[2])

				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** skin "..Message[1].." "..Message[2],0xa3c846)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unwl",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and Message[1] then
			vRP.Query("accounts/Clean",{ Discord = Message[1] })
			exports["vrp"]:Content("Roles",Message[1].." 720476376871731241 Remover")
			TriggerClientEvent("Notify",source,"Sucesso","Allowlist removida.","verde",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearinv",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 then
			TriggerClientEvent("Notify",source,"Sucesso","Limpeza concluída.","verde",5000)
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** clearinv "..Message[1],0xa3c846)
			vRP.ClearInventory(Message[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("dima",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			vRP.UpgradeGemstone(Message[1],Message[2],true)
			TriggerClientEvent("Notify",source,"Sucesso","Diamantes entregues.","verde",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("blips",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			vRPC.BlipAdmin(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			if Message[1] then
				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** god "..Message[1],0xa3c846)

				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.Revive(ClosestPed,300)
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					TriggerClientEvent("paramedic:Reset",ClosestPed)

					vRPC.Destroy(ClosestPed)
				end
			else
				vRP.Revive(source,300)
				vRP.SetArmour(source,100)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)
				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and Message[2] and itemBody(Message[1]) then
		if vRP.HasGroup(Passport,"Admin") then
			vRP.GenerateItem(Passport,Message[1],Message[2],true)
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** item "..Message[1].." "..Message[2],0xa3c846)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and Message[2] and Message[3] and itemBody(Message[1]) then
		if vRP.HasGroup(Passport,"Admin",1) then
			vRP.GenerateItem(Message[3],Message[1],Message[2],true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delete",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		if vRP.HasGroup(Passport,"Admin") then
			vRP.Query("characters/Delete",{ id = Message[1] })
			TriggerClientEvent("Notify",source,"Sucesso","Personagem <b>"..Message[1].."</b> deletado.","verde",5000)
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** delete "..Message[1],0xa3c846)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			vRPC.noClip(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 then
			local OtherSource = vRP.Source(Message[1])
			if OtherSource then
				TriggerClientEvent("Notify",source,"Sucesso","Passaporte <b>"..Message[1].."</b> expulso.","verde",5000)
				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** kick "..Message[1],0xa3c846)
				vRP.Kick(OtherSource,"Expulso da cidade.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Days = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("accounts/InsertBanned",{ License = Identity["License"], Days = Days })
				TriggerClientEvent("Notify",source,"Sucesso","Passaporte <b>"..OtherPassport.."</b> banido por <b>"..Days.."</b> dias.","verde",5000)
				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** ban "..Message[1].." "..Message[2],0xa3c846)

				local OtherSource = vRP.Source(OtherPassport)
				if OtherSource then
					vRP.Kick(OtherSource,"Banido.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("accounts/RemoveBanned",{ License = Identity["License"] })
				TriggerClientEvent("Notify",source,"Sucesso","Passaporte <b>"..OtherPassport.."</b> desbanido.","verde",5000)
				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** unban "..Message[1],0xa3c846)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Admin") then
		local Keyboard = vKEYBOARD.Primary(source,"Cordenadas")
		if Keyboard then
			local Split = splitString(Keyboard[1],",")
			if Split[1] and Split[2] and Split[3] then
				vRP.Teleport(source,Split[1],Split[2],Split[3])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and vRP.DoesEntityExist(source) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local Heading = GetEntityHeading(Ped)

			vKEYBOARD.Copy(source,"Cordenadas",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(Heading))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Admin") and Message[1] and Message[2] and Message[3] then
		local Level = Message[3]
		local Permission = Message[2]
		local OtherPassport = Message[1]

		if vRP.GroupType(Permission) then
			if not vRP.GetUserType(OtherPassport,"Work") then
				exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** group "..OtherPassport.." "..Permission.." "..Level,0xa3c846)
				TriggerClientEvent("Notify",source,"Sucesso","Adicionado <b>"..Permission.."</b> ao passaporte <b>"..OtherPassport.."</b>.","verde",5000)
				vRP.SetPermission(OtherPassport,Permission,Level)
			else
				TriggerClientEvent("Notify",source,"Atenção","O passaporte já pertence a outro grupo.","amarelo",5000)
			end
		else
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** group "..OtherPassport.." "..Permission.." "..Level,0xa3c846)
			TriggerClientEvent("Notify",source,"Sucesso","Adicionado <b>"..Permission.."</b> ao passaporte <b>"..OtherPassport.."</b>.","verde",5000)
			vRP.SetPermission(OtherPassport,Permission,Level)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"Sucesso","Removido <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.","verde",5000)
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** ungroup "..Message[1].." "..Message[2],0xa3c846)
			vRP.RemovePermission(Message[1],Message[2])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed and vRP.DoesEntityExist(source) then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(ClosestPed,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(ClosestPed)
				local Coords = GetEntityCoords(Ped)

				vRP.Teleport(source,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) <= 100 then
		vCLIENT.teleportLimbo(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			TriggerClientEvent("admin:Tuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fix",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,10)
			if Vehicle then
				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("inventory:RepairAdmin",v,Network,Plate)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			TriggerClientEvent("Notify",source,"Listagem","<b>Jogadores Conectados:</b> "..GetNumPlayerIndices(),"verde",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Coords")
AddEventHandler("admin:Coords",function(Coords)
	vRP.Archive("coordenadas.txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Doords")
AddEventHandler("admin:Doords",function(Coords,Model,Heading)
	vRP.Archive("coordenadas.txt","Coords = "..Coords..", Hash = "..Model..", Heading = "..Heading)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.buttonTxt()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and vRP.DoesEntityExist(source) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local Heading = GetEntityHeading(Ped)

			vRP.Archive(Passport..".txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(Heading))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("announce",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",2) and Message[1] then
			TriggerClientEvent("Notify",-1,"Governador",History:sub(9),"vermelho",60000)
			exports["vrp"]:Embed("Admin","**Passaporte:** "..Passport.."\n**Comando:** announce "..History:sub(9),0xa3c846)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("console",function(source,Message,History)
	if source == 0 then
		TriggerClientEvent("Notify",-1,"Governador",History:sub(8),"vermelho",60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kickall",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end

	local List = vRP.Players()
	for _,Sources in pairs(List) do
		vRP.Kick(Sources,"Desconectado, a cidade reiniciou.")
		Wait(100)
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("save",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVEAUTO
-----------------------------------------------------------------------------------------------------------------------------------------
local LastSave = os.time() + 300
CreateThread(function()
	while true do
		Wait(60000)

		if os.time() >= LastSave then
			TriggerEvent("SaveServer",true)
			LastSave = os.time() + 300
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local List = vRP.Players()
			for OtherPlayer,_ in pairs(List) do
				async(function()
					vRP.GenerateItem(OtherPlayer,Message[1],Message[2],true)
				end)
			end

			TriggerClientEvent("Notify",source,"Aviso","Envio concluído.","amarelo",10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RaceConfig(Left,Center,Right,Distance)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.Archive(Passport..".txt","{")

		vRP.Archive(Passport..".txt","['Left'] = vec3("..mathLength(Left["x"])..","..mathLength(Left["y"])..","..mathLength(Left["z"]).."),")
		vRP.Archive(Passport..".txt","['Center'] = vec3("..mathLength(Center["x"])..","..mathLength(Center["y"])..","..mathLength(Center["z"]).."),")
		vRP.Archive(Passport..".txt","['Right'] = vec3("..mathLength(Right["x"])..","..mathLength(Right["y"])..","..mathLength(Right["z"]).."),")
		vRP.Archive(Passport..".txt","['Distance'] = "..Distance)

		vRP.Archive(Passport..".txt","},")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Spectate = {}
RegisterCommand("spectate",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			if Spectate[Passport] then
				local Ped = GetPlayerPed(Spectate[Passport])
				if DoesEntityExist(Ped) then
					SetEntityDistanceCullingRadius(Ped,0.0)
				end

				TriggerClientEvent("admin:resetSpectate",source)
				Spectate[Passport] = nil
			else
				local nsource = vRP.Source(Message[1])
				if nsource then
					local Ped = GetPlayerPed(nsource)
					if DoesEntityExist(Ped) then
						SetEntityDistanceCullingRadius(Ped,999999999.0)
						Wait(1000)
						TriggerClientEvent("admin:initSpectate",source,nsource)
						Spectate[Passport] = nsource
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUAKE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Quake"] = false
RegisterCommand("quake",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") then
			TriggerClientEvent("Notify",-1,"Terromoto","Os geólogos informaram para nossa unidade governamental que foi encontrado um abalo de magnitude <b>60</b> na <b>Escala Richter</b>, encontrem abrigo até que o mesmo passe.","vermelho",60000)
			GlobalState["Quake"] = true
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limparea",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Admin") then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Players = vRPC.Players(source)
		for _,Sources in pairs(Players) do
			async(function()
				vCLIENT.Limparea(Sources,Coords)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RENAME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rename",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Admin",2) then
		local Keyboard = vKEYBOARD.Tertiary(source,"Passaporte","Nome","Sobrenome")
		if Keyboard then
			vRP.UpgradeNames(Keyboard[1],Keyboard[2],Keyboard[3])
			TriggerClientEvent("Notify",source,"Sucesso","Nome atualizado.","verde",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("deleteall",function(source,Message,rawCmd)
    local Passport = vRP.Passport(source)
    if not vRP.HasGroup(Passport,"Admin") then
        return
    end

    if not Message[1] then
        return
    end

    if Message[1] == "objects" then
        for _i,item in pairs(GetAllObjects()) do
            DeleteEntity(item)
        end
        vRPC.removeObjects(source)
        vRPC.removeActived(source)
		TriggerClientEvent("Notify",source,"Aviso","Todos os objetos foram <b>DELETADOS</b> com sucesso","amarelo",10000)
    elseif Message[1] == "npcs" then
        for _,pedHandle in pairs(GetAllPeds()) do
            DeleteEntity(pedHandle)
        end
		TriggerClientEvent("Notify",source,"Aviso","Todos os npcs foram <b>DELETADOS</b> com sucesso","amarelo",10000)
    elseif Message[1] == "vehicles" then
        for _,vehicles in pairs(GetAllVehicles()) do
            DeleteEntity(vehicles)
        end
		TriggerClientEvent("Notify",source,"Aviso","Todos os veiculos foram <b>DELETADOS</b> com sucesso","amarelo",10000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TXADMIN:EVENTS:SERVERSHUTTINGDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("txAdmin:events:serverShuttingDown",function(eventData)
    TriggerEvent("SaveServer",false)
end)