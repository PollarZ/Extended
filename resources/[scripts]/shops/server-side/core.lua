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
Tunnel.bindInterface("shops",Creative)
vCLIENT = Tunnel.getInterface("shops")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["Drinks"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["absolut"] = 15,
			["chandon"] = 15,
			["dewars"] = 15,
			["hennessy"] = 15,
			["cola"] = 15,
			["soda"] = 15,
			["fries"] = 15
		}
	},
	["Departament"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["worm"] = 5,
			["postit"] = 20,
			["emptybottle"] = 30,
			["cigarette"] = 10,
			["lighter"] = 175,
			["rose"] = 25,
			["rope"] = 875,
			["radio"] = 975,
			["vape"] = 4750,
			["scuba"] = 975,
			["fishingrod"] = 725,
			["firecracker"] = 100,
			["cellphone"] = 725,
			["camera"] = 425,
			["binoculars"] = 425,
			["hotdog"] = 15,
			["cola"] = 15,
			["soda"] = 15,
			["coffee"] = 20,
			["donut"] = 15,
			["chocolate"] = 15,
			["hamburger"] = 25,
			["teddy"] = 75,
			["suitcase"] = 275,
			["WEAPON_BRICK"] = 25,
			["WEAPON_SHOES"] = 25,
			["alliancemale"] = 525,
			["alliancefemale"] = 525
		}
	},
	["Fuel"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["WEAPON_PETROLCAN"] = 250
		}
	},
	["Pharmacy"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["medkit"] = 575,
			["bandage"] = 225,
			["gauze"] = 100,
			["analgesic"] = 125
		}
	},
	["Paramedico"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["Permission"] = "Paramedico",
		["List"] = {
			["syringe"] = 2,
			["syringe01"] = 50,
			["syringe02"] = 50,
			["syringe03"] = 50,
			["syringe04"] = 50,
			["bandage"] = 115,
			["gauze"] = 50,
			["gdtkit"] = 20,
			["medkit"] = 285,
			["sinkalmy"] = 185,
			["analgesic"] = 65,
			["ritmoneury"] = 235,
			["medicbag"] = 425
		}
	},
	["Ammunation"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["WEAPON_HATCHET"] = 975,
			["WEAPON_BAT"] = 975,
			["WEAPON_BATTLEAXE"] = 975,
			["WEAPON_GOLFCLUB"] = 975,
			["WEAPON_HAMMER"] = 975,
			["WEAPON_MACHETE"] = 975,
			["WEAPON_POOLCUE"] = 975,
			["WEAPON_STONE_HATCHET"] = 975,
			["WEAPON_KNUCKLE"] = 975,
			["WEAPON_KARAMBIT"] = 975,
			["WEAPON_KATANA"] = 975,
			["WEAPON_FLASHLIGHT"] = 975,
			["WEAPON_PICKAXE"] = 725,
			["GADGET_PARACHUTE"] = 225,
			["WEAPON_CROWBAR"] = 725,
			["WEAPON_WRENCH"] = 725
		}
	},
	["Hunting"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["boar1star"] = 125,
			["boar2star"] = 175,
			["boar3star"] = 225,
			["deer1star"] = 125,
			["deer2star"] = 175,
			["deer3star"] = 225,
			["coyote1star"] = 125,
			["coyote2star"] = 175,
			["coyote3star"] = 225,
			["mtlion1star"] = 125,
			["mtlion2star"] = 175,
			["mtlion3star"] = 225
		}
	},
	["Hunting2"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["ration"] = 125,
			["WEAPON_SWITCHBLADE"] = 725,
			["WEAPON_MUSKET"] = 3250,
			["WEAPON_SAUER"] = 7225,
			["WEAPON_MUSKET_AMMO"] = 10
		}
	},
	["Fishing"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["anchovy"] = 32,
			["catfish"] = 36,
			["herring"] = 35,
			["orangeroughy"] = 30,
			["salmon"] = 40,
			["sardine"] = 26,
			["smallshark"] = 75,
			["smalltrout"] = 27,
			["yellowperch"] = 31
		}
	},
	["Recycle"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["creditcard"] = 3,
			["propertys"] = 3,
			["postit"] = 5,
			["techtrash"] = 25,
			["tarp"] = 10,
			["sheetmetal"] = 10,
			["roadsigns"] = 10,
			["explosives"] = 10,
			["sulfuric"] = 10,
			["saline"] = 10,
			["alcohol"] = 10,
			["syringe"] = 1,
			["codeine"] = 10,
			["amphetamine"] = 10,
			["acetone"] = 10,
			["emptybottle"] = 10,
			["plate"] = 75,
			["plastic"] = 5,
			["glass"] = 5,
			["rubber"] = 5,
			["aluminum"] = 10,
			["firecracker"] = 50,
			["copper"] = 10,
			["rose"] = 10,
			["teddy"] = 15
		}
	},
	["Miners"] = {
		["Mode"] = "Sell",
		["Type"] = "Cash",
		["List"] = {
			["sapphire_pure"] = 30,
			["emerald_pure"] = 32,
			["ruby_pure"] = 30,
			["gold_pure"] = 25,
			["iron_pure"] = 15,
			["lead_pure"] = 13,
			["sulfur_pure"] = 12,
			["tin_pure"] = 13,
			["diamond_pure"] = 20,
			["copper_pure"] = 14
		}
	},
	["Coffee"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["coffee"] = 20
		}
	},
	["CoolBeans"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["List"] = {
			["coffeemilk"] = 70,
			["sandwich"] = 15,
			["coffee"] = 20,
			["donut"] = 15,
			["chocolate"] = 15
		}
	},
	["Soda"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["cola"] = 15,
			["soda"] = 15
		}
	},
	["Donut"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["donut"] = 15,
			["chocolate"] = 15
		}
	},
	["Hamburger"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hamburger"] = 25
		}
	},
	["Hotdog"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hotdog"] = 15
		}
	},
	["Chihuahua"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["hotdog"] = 15,
			["hamburger"] = 25,
			["cola"] = 15,
			["soda"] = 15
		}
	},
	["Water"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["water"] = 30
		}
	},
	["Cigarette"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["List"] = {
			["cigarette"] = 10,
			["lighter"] = 175
		}
	},
	["Policia"] = {
		["Mode"] = "Buy",
		["Type"] = "Cash",
		["Permission"] = "Policia",
		["List"] = {
			["vest"] = 100,
			["gsrkit"] = 10,
			["gdtkit"] = 10,
			["barrier"] = 25,
			["handcuff"] = 125,
			["WEAPON_SMG"] = 1225,
			["WEAPON_STUNGUN"] = 725,
			["WEAPON_PISTOL"] = 5725,
			["WEAPON_PUMPSHOTGUN"] = 1225,
			["WEAPON_CARBINERIFLE"] = 1725,
			["WEAPON_TACTICALRIFLE"] = 1725,
			["WEAPON_COMBATPISTOL"] = 725,
			["WEAPON_HEAVYPISTOL"] = 925,
			["WEAPON_NIGHTSTICK"] = 375,
			["WEAPON_POLICE_AMMO"] = 2
		}
	},
	["Materials"] = {
		["Mode"] = "Buy",
		["Type"] = "Consume",
		["Item"] = "dollars2",
		["List"] = {
			["plastic"] = 36,
			["glass"] = 36,
			["rubber"] = 36,
			["aluminum"] = 36,
			["copper"] = 36,
			["sheetmetal"] = 90,
			["roadsigns"] = 90,
			["tarp"] = 90,
			["techtrash"] = 225,
			["explosives"] = 135,
			["racecoin"] = 30
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Type)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if List[Type] and List[Type]["Permission"] and not vRP.HasService(Passport,List[Type]["Permission"]) then
			return false
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Name or not List[Name] or not List[Name]["List"] then
			exports["megazord"]:Discord("**Passaporte:** "..Passport.."\n**Função:** Request do shops",source)
		end

		if List[Name] then
			local Shop = {}
			local Slots = 20
			for Index,v in pairs(List[Name]["List"]) do
				Shop[#Shop + 1] = { key = Index, price = parseInt(v), name = itemName(Index), index = itemIndex(Index), peso = itemWeight(Index) }
			end

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

			if parseInt(#Shop) > 20 then
				Slots = parseInt(#Shop)
			end

			return Shop,Inventory,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),Slots
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ShopType(Type)
	if List[Type] and List[Type]["Mode"] then
		return List[Type]["Mode"]
	end

	return "Buy"
end
---------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.functionShops(Type,Item,Amount,Slot)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and List[Type] then
		if Amount > 1 and itemUnique(Item) then
			Amount = 1
		end

		local Inv = vRP.Inventory(Passport)
		if (Inv[Slot] and Inv[Slot]["item"] == Item) or not Inv[Slot] then
			if List[Type]["Mode"] == "Buy" then
				if vRP.MaxItens(Passport,Item,Amount) then
					TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
					vCLIENT.Update(source,"Request")

					return false
				end

				if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
					if List[Type]["Type"] == "Cash" then
						if List[Type]["List"][Item] then
							if vRP.PaymentFull(Passport,List[Type]["List"][Item] * Amount) then
								if Type == "Policia" and Item == "WEAPON_PISTOL" then
									local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
									if Keyboard and parseInt(Keyboard[1]) > 0 then
										vRP.GiveItem(Passport,"WEAPON_PISTOL-"..os.time().."-1-"..Keyboard[1],1,false,Slot)
									end
								else
									vRP.GenerateItem(Passport,Item,Amount,false,Slot)

									if Item == "WEAPON_PETROLCAN" then
										vRP.GenerateItem(Passport,"WEAPON_PETROLCAN_AMMO",4500,false)
									end
								end

								TriggerClientEvent("sounds:Private",source,"cash",0.1)
							else
								TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
							end
						end
					elseif List[Type]["Type"] == "Consume" then
						if vRP.TakeItem(Passport,List[Type]["Item"],parseInt(List[Type]["List"][Item] * Amount)) then
							vRP.GenerateItem(Passport,Item,Amount,false,Slot)
						else
							TriggerClientEvent("Notify",source,"Atenção","<b>"..itemName(List[Type]["Item"]).."</b> insuficiente.","amarelo",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
				end
			elseif List[Type]["Mode"] == "Sell" then
				local Split = splitString(Item)[1]

				if List[Type]["List"][Split] then
					local itemPrice = List[Type]["List"][Split]

					if itemPrice > 0 and vRP.CheckDamaged(Item) then
						TriggerClientEvent("Notify",source,"Atenção","Itens danificados não podem ser vendidos.","amarelo",5000)
						vCLIENT.Update(source,"Request")

						return false
					end

					if List[Type]["Type"] == "Cash" then
						if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
							if itemPrice > 0 then
								vRP.GenerateItem(Passport,"dollars",parseInt(itemPrice * Amount),false)
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
							end
						end
					elseif List[Type]["Type"] == "Consume" then
						if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
							if itemPrice > 0 then
								vRP.GenerateItem(Passport,List[Type]["Item"],parseInt(itemPrice * Amount),false)
							end
						end
					end
				end
			end
		end

		vCLIENT.Update(source,"Request")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("shops:populateSlot")
AddEventHandler("shops:populateSlot",function(Item,Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
			vRP.GiveItem(Passport,Item,Amount,false,Target)
			vCLIENT.Update(source,"Request")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("shops:updateSlot")
AddEventHandler("shops:updateSlot",function(Item,Slot,Target,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Target = tostring(Target)
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport then
		local Inv = vRP.Inventory(Passport)
		if Inv[Slot] and Inv[Target] and Inv[Slot]["item"] == Inv[Target]["item"] then
			if vRP.TakeItem(Passport,Item,Amount,false,Slot) then
				vRP.GiveItem(Passport,Item,Amount,false,Target)
			end
		else
			vRP.SwapSlot(Passport,Slot,Target)
		end

		vCLIENT.Update(source,"Request")
	end
end)