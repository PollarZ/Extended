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
Tunnel.bindInterface("taxi",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Payment()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then

		local Experience = vRP.GetExperience(Passport,"Taxi")
		local Level = ClassCategory(Experience)
		local Valuation = 440

		if Level == 2 or Level == 3 or Level == 5 then
			Valuation = Valuation + 175
		elseif Level == 6 or Level == 7 or Level == 8 then
			Valuation = Valuation + 275
		elseif Level == 9 or Level == 10 then
			Valuation = Valuation + 375
		end

		local Buffs = exports["inventory"]:Buffs("Dexterity",Passport)
		if Buffs and Buffs > os.time() then
			Valuation = Valuation + (Valuation * 0.1)
		end

		if exports["party"]:DoesExist(Passport) then
			local Members = exports["party"]:Room(Passport,source,10)
			if parseInt(#Members) >= 4 then
				Valuation = Valuation + (Valuation * 0.1)
			end
		end

		vRP.GenerateItem(Passport,"dollars",Valuation,true)
		vRP.PutExperience(Passport,"Taxi",1)
		vRP.UpgradeStress(Passport,2)
	end
end