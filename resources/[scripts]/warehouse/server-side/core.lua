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
Tunnel.bindInterface("warehouse",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Warehouses"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:TRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("warehouse:Transfer")
AddEventHandler("warehouse:Transfer",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Warehouse = vRP.Query("warehouse/Informations",{ Name = Name })
		if Warehouse[1] and Warehouse[1]["Passport"] == Passport then
			local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
			if Keyboard and vRP.Request(source,"Armazém","Deseja transferir o <b>Armazém</b> para o passaporte <b>"..Keyboard[1].."</b>?") then
				vRP.Query("warehouse/Transfer",{ Passport = Keyboard[1], Name = Name })
				TriggerClientEvent("Notify",source,"Sucesso","Armazém transferido.","verde",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:PASSWORD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("warehouse:Password")
AddEventHandler("warehouse:Password",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Warehouse = vRP.Query("warehouse/Informations",{ Name = Name })
		if Warehouse[1] and Warehouse[1]["Passport"] == Passport then
			local Keyboard = vKEYBOARD.Password(source,"Nova Senha")
			if Keyboard then
				local Password = sanitizeString(Keyboard[1],"0123456789",true)
				if string.len(Password) >= 4 and string.len(Password) <= 20 then
					vRP.Query("warehouse/Password",{ Name = Name, Password = Password })
					TriggerClientEvent("Notify",source,"Sucesso","Senha atualizada.","amarelo",5000)
				else
					TriggerClientEvent("Notify",source,"Atenção","Necessário possuir entre <b>4</b> e <b>20</b> números.","amarelo",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Warehouse(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.Query("warehouse/Informations",{ Name = Name })
		if Consult[1] then
			if Consult[1]["Tax"] < os.time() then
				if Consult[1]["Passport"] == Passport and vRP.Request(source,"Armazém","Deseja efetuar o pagamento do aluguel de <b>$75.000</b>?") then
					if vRP.PaymentFull(Passport,75000) then
						vRP.Query("warehouse/Tax",{ Name = Name })

						return true
					else
						TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
					end
				end

				return false
			end

			if Consult[1]["Passport"] == Passport then
				return true
			else
				local Keyboard = vKEYBOARD.Password(source,"Senha")
				if Keyboard then
					local Warehouse = vRP.Query("warehouse/Acess",{ Name = Name, Password = Keyboard[1] })
					if Warehouse[1] then
						return true
					else
						TriggerClientEvent("Notify",source,"Erro","Senha incorreta.","vermelho",5000)
					end
				end
			end
		else
			if vRP.Request(source,"Armazém","Gostaria de comprar o armazém por <b>$500.000</b>?") then
				local Keyboard = vKEYBOARD.Password(source,"Senha")
				if Keyboard then
					local Password = sanitizeString(Keyboard[1],"0123456789",true)
					if string.len(Password) >= 4 and string.len(Password) <= 20 then
						if vRP.Request(source,"Armazém","Finalizar a compra usando a senha <b>"..Password.."</b>?") then
							if vRP.PaymentFull(Passport,500000) then
								local Warehouses = GlobalState["Warehouses"]
								Warehouses[Name] = true
								GlobalState:set("Warehouses",Warehouses,true)

								exports["bank"]:AddTaxs(Passport,"Armazém",500000,"Compra de armazém.")
								vRP.Query("warehouse/Buy",{ Name = Name, Passport = Passport, Password = Password })

								return true
							else
								TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
							end
						end
					else
						TriggerClientEvent("Notify",source,"Aviso","Necessário possuir entre <b>4</b> e <b>20</b> números.","amarelo",5000)
					end
				end
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request(Name)
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

		local myWarehouse = {}
		local Consult = vRP.GetSrvData("Warehouse:"..Name,true)
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

			myWarehouse[Index] = v
		end

		local Warehouse = vRP.Query("warehouse/Informations",{ Name = Name })
		if Warehouse[1] then
			return Inventory,myWarehouse,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Consult),Warehouse[1]["Weight"]
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target,Name)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if itemBlock(Item) then
			TriggerClientEvent("warehouse:Update",source)

			return false
		end

		local Consult = vRP.Query("warehouse/Informations",{ Name = Name })
		if Consult[1] then
			if Item == "diagram" then
				if vRP.TakeItem(Passport,Item,Amount,false) then
					vRP.Query("warehouse/Upgrade",{ Name = Name, Multiplier = Amount })
					TriggerClientEvent("warehouse:Update",source)
				end
			else
				if vRP.StoreChest(Passport,"Warehouse:"..Name,Amount,Consult[1]["Weight"],Slot,Target,true) then
					TriggerClientEvent("warehouse:Update",source)
				else
					local Result = vRP.GetSrvData("Warehouse:"..Name,true)
					TriggerClientEvent("warehouse:Weight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Consult[1]["Weight"])
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Item,Slot,Amount,Target,Name)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.Query("warehouse/Informations",{ Name = Name })
		if Consult[1] then
			if vRP.TakeChest(Passport,"Warehouse:"..Name,Amount,Slot,Target,true) then
				TriggerClientEvent("warehouse:Update",source)
			else
				local Result = vRP.GetSrvData("Warehouse:"..Name,true)
				TriggerClientEvent("warehouse:Weight",source,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.ChestWeight(Result),Consult[1]["Weight"])
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot,Target,Amount,Name)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.UpdateChest(Passport,"Warehouse:"..Name,Slot,Target,Amount,true) then
			TriggerClientEvent("warehouse:Update",source)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Warehouses = {}
	local Consult = vRP.Query("warehouse/All")

	for _,v in pairs(Consult) do
		local Name = v["Name"]
		if (v["Tax"] + 604800) <= os.time() then
			vRP.Query("warehouse/Sell",{ Name = Name })
			vRP.Query("entitydata/RemoveData",{ Name = "Warehouse:"..Name })
		else
			Warehouses[Name] = true
		end
	end

	GlobalState:set("Warehouses",Warehouses,true)
end)