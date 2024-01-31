-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Cooldown = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:REGISTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Register")
AddEventHandler("inventory:Register",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not Cooldown[Number] or os.time() > Cooldown[Number] then
			vRPC.AnimActive(source)
			Active[Passport] = os.time() + 15
			Cooldown[Number] = os.time() + 3600
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Roubando",15000)
			vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)

			if math.random(1000) >= 950 then
				TriggerEvent("Wanted",source,Passport,120)

				local Coords = vRP.GetEntityCoords(source)
				local Service = vRP.NumPermission("Policia")
				for Passports,Sources in pairs(Service) do
					async(function()
						TriggerClientEvent("sounds:Private",Sources,"crime",0.25)
						TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Caixa Registradora", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
					end)
				end
			end

			local Valuation = math.random(300,350)
			if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
				Valuation = Valuation + (Valuation * 0.1)
			end

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false
					vRP.GenerateItem(Passport,"dollars2",Valuation,true)
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Cooldown[Number] - os.time().."</b> segundos.","amarelo",5000)
		end
	end
end)