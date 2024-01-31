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
Tunnel.bindInterface("trunkchest",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Vehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Vehicle[Passport] then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		for Index,v in pairs(Inv) do
			v["amount"] = parseInt(v["amount"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["name"] = itemName(v["item"])
			v["key"] = v["item"]
			v["slot"] = Index

			v["desc"] = "<item>"..v["name"].."</item>"

			local Split = splitString(v["item"])
			local Description = itemDescription(v["item"])

			if Description then
				v["desc"] = v["desc"].."<br><description>"..Description.."</description>"
			else
				if Split[1] == "vehkey" then
					v["desc"] = v["desc"].."<br><description>Placa do Veículo: <green>"..Split[2].."</green></description>"
				end
			end

			local Max = itemMaxAmount(v["item"])
			if not Max then
				Max = "S/L"
			end

			v["desc"] = v["desc"].."<br><legenda>Economia: <r>"..itemEconomy(v["item"]).."</r> <s>|</s> Máximo: <r>"..Max.."</r></legenda>"

			if Split[2] then
				if itemCharges(v["item"]) then
					v["charges"] = parseInt(Split[2] * 33)
				end

				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - Split[2])
					v["days"] = itemDurability(v["item"])
				end
			end

			Inventory[Index] = v
		end

		local Vehicles = {}
		local Result = vRP.GetSrvData(Vehicle[Passport]["Data"],true)
		for Index,v in pairs(Result) do
			v["amount"] = parseInt(v["amount"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["name"] = itemName(v["item"])
			v["key"] = v["item"]
			v["slot"] = Index

			v["desc"] = "<item>"..v["name"].."</item>"

			local Split = splitString(v["item"])
			local Description = itemDescription(v["item"])

			if Description then
				v["desc"] = v["desc"].."<br><description>"..Description.."</description>"
			else
				if Split[1] == "vehkey" then
					v["desc"] = v["desc"].."<br><description>Placa do Veículo: <green>"..Split[2].."</green></description>"
				end
			end

			local Max = itemMaxAmount(v["item"])
			if not Max then
				Max = "S/L"
			end

			v["desc"] = v["desc"].."<br><legenda>Economia: <r>"..itemEconomy(v["item"]).."</r> <s>|</s> Máximo: <r>"..Max.."</r></legenda>"

			if Split[2] then
				if itemCharges(v["item"]) then
					v["charges"] = parseInt(Split[2] * 33)
				end

				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - Split[2])
					v["days"] = itemDurability(v["item"])
				end
			end

			Vehicles[Index] = v
		end

		return Inventory,Vehicles,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Vehicle[Passport]["Weight"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
local Store = {
	["ratloader"] = {
		["woodlog"] = true
	},
	["stockade"] = {
		["pouch"] = true
	},
	["trash"] = {
		["recyclable"] = true
	},
	["towtruck"] = {
		["tyres"] = true,
		["toolbox"] = true,
		["advtoolbox"] = true
	},
	["towtruck2"] = {
		["tyres"] = true,
		["toolbox"] = true,
		["advtoolbox"] = true
	},
	["flatbed"] = {
		["tyres"] = true,
		["toolbox"] = true,
		["advtoolbox"] = true
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLOCKED
-----------------------------------------------------------------------------------------------------------------------------------------
local Blocked = {
	["dollars"] = true,
	["dollars2"] = true,
	["foodbox"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and Vehicle[Passport] then
		if vRP.UpdateChest(Passport,Vehicle[Passport]["Data"],Slot,Target,Amount,true) then
			TriggerClientEvent("trunkchest:Update",source)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and Vehicle[Passport] then
		local Name = Vehicle[Passport]["Model"]

		if (Store[Name] and not Store[Name][Item]) or Blocked[Item] or itemBlock(Item) then
			TriggerClientEvent("trunkchest:Update",source)
			TriggerClientEvent("Notify",source,"Aviso","Armazenamento proibido.","amarelo",5000)
			return
		end

		if vRP.StoreChest(Passport,Vehicle[Passport]["Data"],Amount,Vehicle[Passport]["Weight"],Slot,Target,true) then
			TriggerClientEvent("trunkchest:Update",source)
		else
			if Vehicle[Passport] then
				local Result = vRP.GetSrvData(Vehicle[Passport]["Data"],true)
				TriggerClientEvent("trunkchest:UpdateWeight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Vehicle[Passport]["Weight"])
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and Vehicle[Passport] then
		if vRP.TakeChest(Passport,Vehicle[Passport]["Data"],Amount,Slot,Target,true) then
			TriggerClientEvent("trunkchest:Update",source)
		else
			if Vehicle[Passport] then
				local Result = vRP.GetSrvData(Vehicle[Passport]["Data"],true)
				TriggerClientEvent("trunkchest:UpdateWeight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Vehicle[Passport]["Weight"])
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Close()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Vehicle[Passport] and Vehicle[Passport]["Net"] then
		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				if Vehicle[Passport] and Vehicle[Passport]["Net"] then
					TriggerClientEvent("player:VehicleDoors",v,Vehicle[Passport]["Net"],"close")
				end
			end)
		end

		Vehicle[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKCHEST:OPENTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trunkchest:openTrunk")
AddEventHandler("trunkchest:openTrunk",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and VehicleChest(Entity[2]) > 0 then
		local PassportPlate = vRP.PassportPlate(Entity[1])

		if PassportPlate and (vRP.HasService(Passport,"Policia") or PassportPlate["Passport"] == Passport or vRP.InventoryFull(Passport,"vehkey-"..Entity[1])) then
			Vehicle[Passport] = {
				["Net"] = Entity[4],
				["Plate"] = Entity[1],
				["Model"] = Entity[2],
				["User"] = PassportPlate["Passport"],
				["Weight"] = VehicleChest(Entity[2]),
				["Data"] = "Trunkchest:"..PassportPlate["Passport"]..":"..Entity[2]
			}

			local Network = NetworkGetEntityFromNetworkId(Vehicle[Passport]["Net"])

			if GetVehicleDoorLockStatus(Network) <= 1 then
				TriggerClientEvent("trunkchest:Open",source)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						if Vehicle[Passport] and Vehicle[Passport]["Net"] then
							TriggerClientEvent("player:VehicleDoors",v,Vehicle[Passport]["Net"],"open")
						end
					end)
				end
			else
				TriggerClientEvent("Notify",source,"Atenção","Veículo trancado.","amarelo",5000)
				Vehicle[Passport] = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Vehicle[Passport] then
		Vehicle[Passport] = nil
	end
end)