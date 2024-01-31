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
Tunnel.bindInterface("inspect",Creative)
vCLIENT = Tunnel.getInterface("inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Players = {}
local Sourcers = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:INSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Inspect")
AddEventHandler("police:Inspect",function(OtherSource)
	local source = source
	local Passport = vRP.Passport(source)
	local OtherPassport = vRP.Passport(OtherSource)
	if Passport and vRP.GetHealth(source) > 100 and vRP.DoesEntityExist(OtherSource) and not Players[OtherPassport] then
		Sourcers[Passport] = OtherSource
		Players[Passport] = OtherPassport

		TriggerEvent("inventory:ServerCarry",source,Passport,OtherSource,true)
		TriggerClientEvent("inventory:Close",OtherSource)
		TriggerClientEvent("inspect:Open",source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
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

		local Chest = {}
		local Inv = vRP.Inventory(Players[Passport])
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

			Chest[Index] = v
		end

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.InventoryWeight(Players[Passport]),vRP.GetWeight(Players[Passport])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Reset()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Sourcers[Passport] then
			if vRP.DoesEntityExist(Sourcers[Passport]) then
				TriggerEvent("inventory:ServerCarry",source,Passport,Sourcers[Passport])
			end

			Sourcers[Passport] = nil
		end

		if Players[Passport] then
			Players[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Sourcers[Passport] and vRP.DoesEntityExist(Sourcers[Passport]) then
		if vRP.MaxItens(Players[Passport],Item,Amount) then
			TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
			TriggerClientEvent("inspect:Update",source,"Request")

			return false
		end

		if (vRP.InventoryWeight(Players[Passport]) + itemWeight(Item) * Amount) <= vRP.GetWeight(Players[Passport]) then
			if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
				vRP.GiveItem(Players[Passport],Item,Amount,true,Target)
			end
		else
			TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
			TriggerClientEvent("inspect:Update",source,"Request")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Item,Slot,Target,Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Sourcers[Passport] and vRP.DoesEntityExist(Sourcers[Passport]) then
		if vRP.MaxItens(Passport,Item,Amount) then
			TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
			TriggerClientEvent("inspect:Update",source,"Request")

			return false
		end

		if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Players[Passport],Item,Amount,true,Slot) then
				vRP.GiveItem(Passport,Item,Amount,true,Target)
				TriggerClientEvent("inspect:Update",source,"Request")
			end
		else
			TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
			TriggerClientEvent("inspect:Update",source,"Request")
		end
	end
end