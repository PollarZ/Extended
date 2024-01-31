-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Dismantle = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
function GeneratePlate()
	local Plate = ""

	repeat
		Plate = vRP.GenerateString("DDLLLDDD")
	until not Dismantle[Plate]

	return Plate
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:Delete")
AddEventHandler("garages:Delete",function(Network,Plate)
	if Plate and Dismantle[Plate] and vRP.Passport(Dismantle[Plate]["Source"]) then
		TriggerClientEvent("dismantle:Reset",Dismantle[Plate]["Source"])
		Dismantle[Plate] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CreateVehicle(Model,Coords,Experience)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Vehicle = CreateVehicle(Model,Coords,true,true)

		while not DoesEntityExist(Vehicle) do
			Wait(1)
		end

		if DoesEntityExist(Vehicle) then
			local Plate = GeneratePlate()
			local Network = NetworkGetNetworkIdFromEntity(Vehicle)
			local Networked = NetworkGetEntityFromNetworkId(Network)

			SetVehicleNumberPlateText(Vehicle,Plate)

			Entity(Networked)["state"]:set("Nitro",0,true)
			Entity(Networked)["state"]:set("Fuel",100,true)
			Entity(Networked)["state"]:set("Dismantle",true,true)
			Dismantle[Plate] = {
				["Source"] = source,
				["Experience"] = Experience
			}

			local Service = vRP.NumPermission("Policia")
			for Passports,Sources in pairs(Service) do
				async(function()
					TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
					TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Desmanche de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(Model).." - "..Plate, color = 44 })
				end)
			end

			return Network
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Dismantle")
AddEventHandler("inventory:Dismantle",function(Entity)
	local source = source
	local Plate = Entity[1]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Dismantle[Plate] then
		Active[Passport] = os.time() + 60
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Desmanchando",60000)
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) and Dismantle[Plate] then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				TriggerClientEvent("dismantle:Reset",source)
				TriggerClientEvent("player:Residuals",source,"Resíduo de Metal.")
				TriggerClientEvent("player:Residuals",source,"Resíduo de Alumínio.")

				local Level = ClassCategory(Dismantle[Plate]["Experience"])
				TriggerEvent("garages:Delete",Entity[4],Plate)
				local Valuation = math.random(2500,2750)

				if Level == 2 or Level == 3 or Level == 4 then
					Valuation = Valuation + 250
				elseif Level == 5 or Level == 6 or Level == 7 then
					Valuation = Valuation + 375
				elseif Level >= 8 then
					Valuation = Valuation + 500
				end

				if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
					Valuation = Valuation + (Valuation * 0.1)
				end

				if exports["party"]:DoesExist(Passport) then
					local Consult = exports["party"]:Room(Passport,source,20)
					local AmountMembers = CountTable(Consult)
					local TotalMembers = 5

					if AmountMembers < 5 then
						TotalMembers = AmountMembers
					end

					for Number = 1,TotalMembers do
						if vRP.Passport(Consult[Number]["Source"]) then
							vRP.PutExperience(Consult[Number]["Passport"],"Dismantle",1)
							vRP.GenerateItem(Consult[Number]["Passport"],"dollars2",Valuation,true)
							exports["vrp"]:Payments(Consult[Number]["Source"],Consult[Number]["Passport"],"Desmanche",Valuation)
						end
					end
				else
					vRP.PutExperience(Passport,"Dismantle",1)
					vRP.GenerateItem(Passport,"dollars2",Valuation,true)
					exports["vrp"]:Payments(source,Passport,"Desmanche",Valuation)
				end

				if math.random(100) >= 75 then
					vRP.GenerateItem(Passport,"plate",1,true)
				end
			end

			Wait(100)
		until not Active[Passport] or not Dismantle[Plate]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Experience()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return vRP.GetExperience(Passport,"Dismantle")
	end

	return 0
end