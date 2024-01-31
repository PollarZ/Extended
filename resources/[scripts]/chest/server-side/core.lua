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
Tunnel.bindInterface("chest",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Open = {}
local Cooldown = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local ChestItens = {
	["backpackp"] = {
		["Slots"] = 20,
		["Weight"] = 50,
		["Block"] = true
	},
	["backpackm"] = {
		["Slots"] = 25,
		["Weight"] = 75,
		["Block"] = true
	},
	["backpackg"] = {
		["Slots"] = 30,
		["Weight"] = 100,
		["Block"] = true
	},
	["suitcase"] = {
		["Slots"] = 20,
		["Weight"] = 0,
		["Block"] = false,
		["Itens"] = {
			["dollars"] = true
		}
	},
	["cupholder"] = {
		["Slots"] = 155,
		["Weight"] = 0,
		["Block"] = false,
		["Itens"] = {
			["pokemon001"] = true,
			["pokemon002"] = true,
			["pokemon003"] = true,
			["pokemon004"] = true,
			["pokemon005"] = true,
			["pokemon006"] = true,
			["pokemon007"] = true,
			["pokemon008"] = true,
			["pokemon009"] = true,
			["pokemon010"] = true,
			["pokemon011"] = true,
			["pokemon012"] = true,
			["pokemon013"] = true,
			["pokemon014"] = true,
			["pokemon015"] = true,
			["pokemon016"] = true,
			["pokemon017"] = true,
			["pokemon018"] = true,
			["pokemon019"] = true,
			["pokemon020"] = true,
			["pokemon021"] = true,
			["pokemon022"] = true,
			["pokemon023"] = true,
			["pokemon024"] = true,
			["pokemon025"] = true,
			["pokemon026"] = true,
			["pokemon027"] = true,
			["pokemon028"] = true,
			["pokemon029"] = true,
			["pokemon030"] = true,
			["pokemon031"] = true,
			["pokemon032"] = true,
			["pokemon033"] = true,
			["pokemon034"] = true,
			["pokemon035"] = true,
			["pokemon036"] = true,
			["pokemon037"] = true,
			["pokemon038"] = true,
			["pokemon039"] = true,
			["pokemon040"] = true,
			["pokemon041"] = true,
			["pokemon042"] = true,
			["pokemon043"] = true,
			["pokemon044"] = true,
			["pokemon045"] = true,
			["pokemon046"] = true,
			["pokemon047"] = true,
			["pokemon048"] = true,
			["pokemon049"] = true,
			["pokemon050"] = true,
			["pokemon051"] = true,
			["pokemon052"] = true,
			["pokemon053"] = true,
			["pokemon054"] = true,
			["pokemon055"] = true,
			["pokemon056"] = true,
			["pokemon057"] = true,
			["pokemon058"] = true,
			["pokemon059"] = true,
			["pokemon060"] = true,
			["pokemon061"] = true,
			["pokemon062"] = true,
			["pokemon063"] = true,
			["pokemon064"] = true,
			["pokemon065"] = true,
			["pokemon066"] = true,
			["pokemon067"] = true,
			["pokemon068"] = true,
			["pokemon069"] = true,
			["pokemon070"] = true,
			["pokemon071"] = true,
			["pokemon072"] = true,
			["pokemon073"] = true,
			["pokemon074"] = true,
			["pokemon075"] = true,
			["pokemon076"] = true,
			["pokemon077"] = true,
			["pokemon078"] = true,
			["pokemon079"] = true,
			["pokemon080"] = true,
			["pokemon081"] = true,
			["pokemon082"] = true,
			["pokemon083"] = true,
			["pokemon084"] = true,
			["pokemon085"] = true,
			["pokemon086"] = true,
			["pokemon087"] = true,
			["pokemon088"] = true,
			["pokemon089"] = true,
			["pokemon090"] = true,
			["pokemon091"] = true,
			["pokemon092"] = true,
			["pokemon093"] = true,
			["pokemon094"] = true,
			["pokemon095"] = true,
			["pokemon096"] = true,
			["pokemon097"] = true,
			["pokemon098"] = true,
			["pokemon099"] = true,
			["pokemon100"] = true,
			["pokemon101"] = true,
			["pokemon102"] = true,
			["pokemon103"] = true,
			["pokemon104"] = true,
			["pokemon105"] = true,
			["pokemon106"] = true,
			["pokemon107"] = true,
			["pokemon108"] = true,
			["pokemon109"] = true,
			["pokemon110"] = true,
			["pokemon111"] = true,
			["pokemon112"] = true,
			["pokemon113"] = true,
			["pokemon114"] = true,
			["pokemon115"] = true,
			["pokemon116"] = true,
			["pokemon117"] = true,
			["pokemon118"] = true,
			["pokemon119"] = true,
			["pokemon120"] = true,
			["pokemon121"] = true,
			["pokemon122"] = true,
			["pokemon123"] = true,
			["pokemon124"] = true,
			["pokemon125"] = true,
			["pokemon126"] = true,
			["pokemon127"] = true,
			["pokemon128"] = true,
			["pokemon129"] = true,
			["pokemon130"] = true,
			["pokemon131"] = true,
			["pokemon132"] = true,
			["pokemon133"] = true,
			["pokemon134"] = true,
			["pokemon135"] = true,
			["pokemon136"] = true,
			["pokemon137"] = true,
			["pokemon138"] = true,
			["pokemon139"] = true,
			["pokemon140"] = true,
			["pokemon141"] = true,
			["pokemon142"] = true,
			["pokemon143"] = true,
			["pokemon144"] = true,
			["pokemon145"] = true,
			["pokemon146"] = true,
			["pokemon147"] = true,
			["pokemon148"] = true,
			["pokemon149"] = true,
			["pokemon150"] = true,
			["pokemon151"] = true
		}
	},
	["treasurebox"] = {
		["Slots"] = 20,
		["Weight"] = 50,
		["Block"] = false,
		["Itens"] = {}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permissions(Name,Mode,Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Mode == "Personal" then
			Open[Passport] = {
				["Name"] = "Personal:"..Passport,
				["Weight"] = 50,
				["Logs"] = false,
				["Save"] = true,
				["Slots"] = 50
			}

			return true
		elseif Mode == "Tray" then
			Open[Passport] = {
				["Name"] = Name,
				["Weight"] = 25,
				["Logs"] = false,
				["Save"] = false,
				["Slots"] = 20
			}

			return true
		elseif Mode == "Custom" or Mode == "Trash" then
			if SplitOne(Name,":") == "Helicrash" and Cooldown[Name] and Cooldown[Name] > os.time() then
				TriggerClientEvent("Notify",source,"Aviso","Aguarde até que esfrie o compartimento.","amarelo",10000)
				vRPC.DowngradeHealth(source,50)

				return false
			end

			if Mode == "Trash" then
				Name = "Trash:"..Name
			end

			Open[Passport] = {
				["Name"] = Name,
				["Weight"] = 50,
				["Logs"] = false,
				["Save"] = false,
				["Slots"] = 20
			}

			return true
		elseif Mode == "Item" then
			local Previous = SplitOne(Name,":")
			if ChestItens[Previous] then
				Open[Passport] = {
					["Name"] = Name,
					["Save"] = true,
					["Logs"] = false,
					["Unique"] = Previous,
					["Slots"] = ChestItens[Previous]["Slots"],
					["Weight"] = ChestItens[Previous]["Weight"]
				}

				if Item then
					Open[Passport]["Item"] = Item
				end

				return true
			end
		else
			local Consult = vRP.Query("chests/GetChests",{ Name = Name })
			if not Consult[1] then
				vRP.Query("chests/AddChests",{ Name = Name })
				Consult = vRP.Query("chests/GetChests",{ Name = Name })
			end

			if Consult[1] and vRP.HasService(Passport,Consult[1]["Permission"]) then
				local Slots = Consult[1]["Slots"]
				local Weight = Consult[1]["Weight"]
				if vRP.ChestPremium(Name) then
					Slots = Slots * 2
					Weight = Weight * 2
				end

				Open[Passport] = {
					["Slots"] = Slots,
					["Weight"] = Weight,
					["NameLogs"] = Name,
					["Name"] = "Chest:"..Name,
					["Logs"] = Consult[1]["Logs"],
					["Permission"] = Consult[1]["Permission"],
					["Save"] = true
				}

				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Chest()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		local Chest = {}
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

		local Result = vRP.GetSrvData(Open[Passport]["Name"],Open[Passport]["Save"])
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

			Chest[Index] = v
		end

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"],Open[Passport]["Slots"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if itemBlock(Item) then
			TriggerClientEvent("chest:Update",source,"Refresh")

			return true
		end

		if Item == "diagram" and Open[Passport]["NameLogs"] then
			if vRP.TakeItem(Passport,Item,Amount,false) then
				Open[Passport]["Weight"] = Open[Passport]["Weight"] + (10 * Amount)

				local Result = vRP.GetSrvData(Open[Passport]["Name"],Open[Passport]["Save"])
				vRP.Query("chests/UpdateWeight",{ Name = Open[Passport]["NameLogs"], Multiplier = Amount })
				TriggerClientEvent("chest:Update",source,"Update",vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"])
				TriggerClientEvent("chest:Update",source,"Refresh")
			end
		else
			local Item = SplitOne(Item)
			local Unique = Open[Passport]["Unique"]

			if Unique and ChestItens[Unique] and ((ChestItens[Item] and ChestItens[Item]["Block"]) or (ChestItens[Unique]["Itens"] and not ChestItens[Unique]["Itens"][Item])) then
				TriggerClientEvent("chest:Update",source,"Refresh")
				return false
			end

			if vRP.StoreChest(Passport,Open[Passport]["Name"],Amount,Open[Passport]["Weight"],Slot,Target,Open[Passport]["Save"],ChestItens[Unique]) then
				TriggerClientEvent("chest:Update",source,"Refresh")
			else
				local Result = vRP.GetSrvData(Open[Passport]["Name"],Open[Passport]["Save"])
				TriggerClientEvent("chest:Update",source,"Update",vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"])

				if Open[Passport]["Logs"] then
					exports["vrp"]:Embed(Open[Passport]["NameLogs"],"**Passaporte:** "..Passport.."\n**Guardou:** "..Amount.."x "..itemName(Item),0xa3c846)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if vRP.TakeChest(Passport,Open[Passport]["Name"],Amount,Slot,Target,Open[Passport]["Save"]) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		else
			local Result = vRP.GetSrvData(Open[Passport]["Name"],Open[Passport]["Save"])
			TriggerClientEvent("chest:Update",source,"Update",vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Open[Passport]["Weight"])

			if string.sub(Open[Passport]["Name"],1,9) == "Helicrash" and json.encode(Result) == "[]" then
				TriggerClientEvent("chest:Close",source)
				exports["helicrash"]:Box()
			end

			if Open[Passport]["Item"] and json.encode(Result) == "[]" then
				vRP.RemoveItem(Passport,Open[Passport]["Item"],1,false)
				TriggerClientEvent("chest:Update",source,"Refresh")
			end

			if Open[Passport]["Logs"] then
				exports["vrp"]:Embed(Open[Passport]["NameLogs"],"**Passaporte:** "..Passport.."\n**Retirou:** "..Amount.."x "..itemName(Item),0xe84855)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then
		if vRP.UpdateChest(Passport,Open[Passport]["Name"],Slot,Target,Amount,Open[Passport]["Save"]) then
			TriggerClientEvent("chest:Update",source,"Refresh")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:COOLDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chest:Cooldown")
AddEventHandler("chest:Cooldown",function(Name)
	Cooldown[Name] = os.time() + math.random(1200,1800)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Open[Passport] then
		Open[Passport] = nil
	end
end)