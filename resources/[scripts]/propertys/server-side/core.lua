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
vKEYBOARD = Tunnel.getInterface("keyboard")
vSKINSHOP = Tunnel.getInterface("skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Lock = {}
local Inside = {}
local Actived = {}
local Robbery = {}
GlobalState["Markers"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Robbery(Name,Number)
	local source = source

	if not Robbery[Name] then
		Robbery[Name] = {}
	end

	if not Robbery[Name][Number] then
		Robbery[Name][Number] = 0
	end

	if Robbery[Name] and os.time() < Robbery[Name][Number] then
		TriggerClientEvent("Notify",source,"Propriedades","Aguarde <b>"..Robbery[Name][Number] - os.time().."</b> segundos.","amarelo",5000)

		return false
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Police(Coords)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerEvent("Wanted",source,Passport,300)

		local Service = vRP.NumPermission("Policia")
		for Passports,Sources in pairs(Service) do
			async(function()
				TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
				TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Propriedade", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 44 })
			end)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYBERRY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Paybbery(Name,Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Robbery[Name] and os.time() >= Robbery[Name][Number] then
		local Random = math.random(#RobberyItem)
		local Valuation = math.random(RobberyItem[Random]["Min"],RobberyItem[Random]["Max"])

		if (vRP.InventoryWeight(Passport) + itemWeight(RobberyItem[Random]["Item"]) * Valuation) <= vRP.GetWeight(Passport) then
			local Buffs = exports["inventory"]:Buffs("Luck",Passport)
			if Buffs and Buffs > os.time() and math.random(100) >= 90 then
				Valuation = Valuation * 2
			end

			vRP.GenerateItem(Passport,RobberyItem[Random]["Item"],Valuation,true)
			Robbery[Name][Number] = os.time() + 3600
		else
			TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Propertys(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.Query("propertys/Exist",{ Name = Name })
		if Consult[1] then
			if Consult[1]["Passport"] == Passport or vRP.InventoryFull(Passport,"propertys-"..Consult[1]["Serial"]) or Lock[Name] then
				local Tax = CompleteTimers(Consult[1]["Tax"] - os.time())

				if os.time() > Consult[1]["Tax"] then
					Tax = "Efetue o pagamento do <b>Iptu</b>."
					local Price = Informations[Consult[1]["Interior"]]["Price"] * 0.15

					if vRP.Request(source,"Propriedades","Hipoteca atrasada, deseja pagar por <b>$"..parseFormat(Price).."</b>?") and vRP.PaymentFull(Passport,Price) then
						TriggerClientEvent("Notify",source,"Propriedades","Pagamento concluído.","verde",5000)
						vRP.Query("propertys/Tax",{ Name = Name })
						Tax = CompleteTimers(2592000)
					else
						return false
					end
				end

				return {
					["Interior"] = Consult[1]["Interior"],
					["Tax"] = Tax
				}
			end
		else
			return "Nothing"
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Toggle(Name,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Mode == "Exit" then
			Inside[Passport] = nil
			TriggerEvent("vRP:BucketServer",source,"Exit")
		else
			Inside[Passport] = Name
			TriggerEvent("vRP:BucketServer",source,"Enter",Route(Name))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:BUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Buy")
AddEventHandler("propertys:Buy",function(Name)
	local source = source
	local Split = splitString(Name)
	local Passport = vRP.Passport(source)
	if Passport then
		local Name = Split[1]
		local Interior = Split[2]

		local Consult = vRP.Query("propertys/Exist",{ Name = Name })
		if not Consult[1] then
			TriggerClientEvent("dynamic:closeSystem",source)

			if vRP.Request(source,"Propriedades","Deseja comprar a propriedade?") then
				if vRP.PaymentFull(Passport,Informations[Interior]["Price"]) then
					local Markers = GlobalState["Markers"]
					Markers[Name] = true
					GlobalState:set("Markers",Markers,true)

					local Serial = PropertysSerials()
					vRP.GiveItem(Passport,"propertys-"..Serial,3,true)

					exports["bank"]:AddTaxs(Passport,"Propriedades",Informations[Interior]["Price"],"Compra de propriedade.")
					vRP.Query("propertys/Buy",{ Name = Name, Interior = Interior, Passport = Passport, Serial = Serial, Vault = Informations[Interior]["Vault"], Fridge = Informations[Interior]["Fridge"], Tax = os.time() + 2592000 })
					TriggerClientEvent("Notify",source,"Propriedades","Compra concluída.","verde",5000)
				else
					TriggerClientEvent("Notify",source,"Propriedades","<b>Dólares</b> insuficientes.","amarelo",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:LOCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Lock")
AddEventHandler("propertys:Lock",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	local Consult = vRP.Query("propertys/Exist",{ Name = Name })
	if Passport and Consult[1] and (vRP.InventoryFull(Passport,"propertys-"..Consult[1]["Serial"]) or Consult[1]["Passport"] == Passport) then
		if Lock[Name] then
			Lock[Name] = nil
			TriggerClientEvent("Notify",source,false,"Propriedade trancada.","verde",5000)
		else
			Lock[Name] = true
			TriggerClientEvent("Notify",source,false,"Propriedade destrancada.","vermelho",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:SELL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Sell")
AddEventHandler("propertys:Sell",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true

		local Consult = vRP.Query("propertys/Exist",{ Name = Name })
		if Consult[1] and Consult[1]["Passport"] == Passport then
			TriggerClientEvent("dynamic:closeSystem",source)
			local Price = Informations[Consult[1]["Interior"]]["Price"] * 0.75

			if vRP.Request(source,"Propriedades","Vender por <b>$"..parseFormat(Price).."</b>?") then
				if GlobalState["Markers"][Name] then
					local Markers = GlobalState["Markers"]
					Markers[Name] = nil
					GlobalState:set("Markers",Markers,true)
				end

				vRP.GiveBank(Passport,Price)
				vRP.RemSrvData("Vault:"..Name,true)
				vRP.RemSrvData("Fridge:"..Name,true)
				vRP.Query("propertys/Sell",{ Name = Name })
				TriggerClientEvent("garages:Clean",-1,Name)
				TriggerClientEvent("Notify",source,"Propriedades","Venda concluída.","verde",5000)
			end
		end

		Actived[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:TRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Transfer")
AddEventHandler("propertys:Transfer",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true

		local Consult = vRP.Query("propertys/Exist",{ Name = Name })
		if Consult[1] and Consult[1]["Passport"] == Passport then
			TriggerClientEvent("dynamic:closeSystem",source)

			local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
			if Keyboard and vRP.Identity(Keyboard[1]) and vRP.Request(source,"Propriedades","Deseja trasnferir a propriedade para passaporte <b>"..Keyboard[1].."</b>?") then
				vRP.Query("propertys/Transfer",{ Name = Name, Passport = Keyboard[1] })
				TriggerClientEvent("Notify",source,"Propriedades","Transferência concluída.","verde",5000)
			end
		end

		Actived[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:CREDENTIALS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Credentials")
AddEventHandler("propertys:Credentials",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	local Consult = vRP.Query("propertys/Exist",{ Name = Name })
	if Passport and Consult[1] and Consult[1]["Passport"] == Passport then
		TriggerClientEvent("dynamic:closeSystem",source)

		if vRP.Request(source,"Propriedades","Lembre-se que ao prosseguir todos os cartões vão deixar de funcionar, deseja prosseguir?") then
			local Serial = PropertysSerials()
			vRP.Query("propertys/Credentials",{ Name = Name, Serial = Serial })
			vRP.GiveItem(Passport,"propertys-"..Serial,Consult[1]["Item"],true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Item")
AddEventHandler("propertys:Item",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	local Consult = vRP.Query("propertys/Exist",{ Name = Name })
	if Passport and Consult[1] and Consult[1]["Passport"] == Passport and Consult[1]["Item"] < 5 then
		TriggerClientEvent("dynamic:closeSystem",source)

		if vRP.Request(source,"Propriedades","Comprar uma chave adicional por <b>$150.000</b> dólares?") then
			if vRP.PaymentFull(Passport,150000) then
				vRP.Query("propertys/Item",{ Name = Name })
				vRP.GiveItem(Passport,"propertys-"..Consult[1]["Serial"],1,true)
			else
				TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Clothes()
	local Clothes = {}
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.GetSrvData("Wardrobe:"..Passport,true)

		for Table,_ in pairs(Consult) do
			Clothes[#Clothes + 1] = Table
		end
	end

	return Clothes
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:CLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Clothes")
AddEventHandler("propertys:Clothes",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.GetSrvData("Wardrobe:"..Passport,true)
		local Split = splitString(Mode)
		local Name = Split[2]

		if Split[1] == "save" then
			local Keyboard = vKEYBOARD.Primary(source,"Nome")
			if Keyboard then
				local Check = sanitizeString(Keyboard[1],"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",true)

				if not Consult[Check] then
					Consult[Check] = vSKINSHOP.Customization(source)
					vRP.SetSrvData("Wardrobe:"..Passport,Consult,true)
					TriggerClientEvent("propertys:ClothesReset",source)
					TriggerClientEvent("Notify",source,"Propriedades","<b>"..Check.."</b> adicionado.","verde",5000)
				else
					TriggerClientEvent("Notify",source,"Propriedades","Nome escolhido já existe em seu armário.","amarelo",5000)
				end
			end
		elseif Split[1] == "delete" then
			if Consult[Name] then
				Consult[Name] = nil
				vRP.SetSrvData("Wardrobe:"..Passport,Consult,true)
				TriggerClientEvent("propertys:ClothesReset",source)
				TriggerClientEvent("Notify",source,"Propriedades","<b>"..Name.."</b> removido.","verde",5000)
			else
				TriggerClientEvent("Notify",source,"Propriedades","A vestimenta salva não se encontra mais em seu armário.","amarelo",5000)
			end
		elseif Split[1] == "apply" then
			if Consult[Name] then
				TriggerClientEvent("skinshop:Apply",source,Consult[Name])
				TriggerClientEvent("Notify",source,"Propriedades","<b>"..Name.."</b> aplicado.","verde",5000)
			else
				TriggerClientEvent("Notify",source,"Propriedades","A vestimenta salva não se encontra mais em seu armário.","amarelo",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYSSERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
function PropertysSerials()
	local Serial = vRP.GenerateString("LDLDLDLDLD")
	local Consult = vRP.Query("propertys/Serial",{ Serial = Serial })
	if Consult[1] then
		PropertysSerials()
	end

	return Serial
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Name)
	local source = source
	local Passport = vRP.Passport(source)
	local Consult = vRP.Query("propertys/Exist",{ Name = Name })
	if Passport and Consult[1] and (vRP.InventoryFull(Passport,"propertys-"..Consult[1]["Serial"]) or Consult[1]["Passport"] == Passport) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request(Name,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Chest = {}
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		local Consult = vRP.GetSrvData(Mode..":"..Name,true)
		local Exist = vRP.Query("propertys/Exist",{ Name = Name })

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

		for Index,v in pairs(Consult) do
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

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Consult),Exist[1][Mode]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target,Name,Mode)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if itemBlock(Item) or (Mode == "Vault" and BlockChest(Item)) or (Mode == "Fridge" and not BlockChest(Item)) then
			TriggerClientEvent("propertys:Update",source)
			return
		end

		local Consult = vRP.Query("propertys/Exist",{ Name = Name })
		if Consult[1] then
			if Item == "diagram" then
				if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
					vRP.Query("propertys/"..Mode,{ Name = Name, Weight = 10 * Amount })
					TriggerClientEvent("propertys:Update",source)
				end
			else
				if vRP.StoreChest(Passport,Mode..":"..Name,Amount,Consult[1][Mode],Slot,Target,true) then
					TriggerClientEvent("propertys:Update",source)
				else
					local Result = vRP.GetSrvData(Mode..":"..Name,true)
					TriggerClientEvent("propertys:Weight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Consult[1][Mode])
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Slot,Amount,Target,Name,Mode)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.TakeChest(Passport,Mode..":"..Name,Amount,Slot,Target,true) then
			TriggerClientEvent("propertys:Update",source)
		else
			local Consult = vRP.Query("propertys/Exist",{ Name = Name })
			if Consult[1] then
				local Result = vRP.GetSrvData(Mode..":"..Name,true)
				TriggerClientEvent("propertys:Weight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Consult[1][Mode])
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot,Target,Amount,Name,Mode)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.UpdateChest(Passport,Mode..":"..Name,Slot,Target,Amount,true) then
			TriggerClientEvent("propertys:Update",source)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUTE
-----------------------------------------------------------------------------------------------------------------------------------------
function Route(Name)
	local Split = splitString(Name,"ropertys")

	return parseInt(100000 + Split[2])
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Inside[Passport] then
		vRP.InsidePropertys(Passport,Propertys[Inside[Passport]])
		Inside[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Markers = {}
	local Consult = vRP.Query("propertys/All")

	for _,v in pairs(Consult) do
		local Name = v["Name"]
		if (v["Tax"] + 604800) <= os.time() then
			vRP.RemSrvData("Vault:"..Name,true)
			vRP.RemSrvData("Fridge:"..Name,true)
			vRP.Query("propertys/Sell",{ Name = Name })
		else
			if Propertys[Name] then
				Markers[Name] = true
			end
		end
	end

	GlobalState:set("Markers",Markers,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("CharacterChosen",function(Passport,source)
	local Consult = vRP.Query("propertys/AllUser",{ Passport = Passport })
	if Consult[1] then
		local Increments = {}

		for _,v in pairs(Consult) do
			local Name = v["Name"]
			if Propertys[Name] then
				Increments[#Increments + 1] = Propertys[Name]
			end
		end

		TriggerClientEvent("spawn:Increment",source,Increments)
	end
end)