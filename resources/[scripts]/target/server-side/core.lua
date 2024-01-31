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
Tunnel.bindInterface("target",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckIn()
	local Repose = 900
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetHealth(source) <= 100 then
			local Repose = 900
			local Valuation = 975

			if vRP.Medicplan(source) then
				Repose = 450
				Valuation = 485
			end

			if vRP.PaymentFull(Passport,Valuation,true) then
				vRP.UpgradeThirst(Passport,15)
				vRP.UpgradeHunger(Passport,15)
				TriggerEvent("Reposed",source,Passport,Repose)
				exports["bank"]:AddTaxs(Passport,"Hospital",Valuation,"Tratamento hospitalar.")

				return true
			else
				TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
			end
		else
			local Repose = 900
			local Valuation = 750

			if vRP.Medicplan(source) then
				Repose = 450
				Valuation = 375
			end

			if vRP.Request(source,"Hospital","Prosseguir o tratamento por <b>$"..Valuation.."</b> dólares?") then
				if vRP.PaymentFull(Passport,Valuation,true) then
					vRP.UpgradeThirst(Passport,15)
					vRP.UpgradeHunger(Passport,15)
					TriggerEvent("Reposed",source,Passport,Repose)
					exports["bank"]:AddTaxs(Passport,"Hospital",Valuation,"Tratamento hospitalar.")

					return true
				else
					TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
				end
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:MEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:Medicplan")
AddEventHandler("target:Medicplan",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not vRP.Medicplan(source) then
			if vRP.Request(source,"Hospital","Assinar o plano de saúde por <b>$10.000</b>? Lembrando que a duração do mesmo é de 7 dias.") then
				if vRP.PaymentFull(Passport,10000,true) then
					TriggerClientEvent("Notify",source,false,"Compra efetuada.","verde",5000)
					vRP.SetMedicplan(source,Passport)
				else
					TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
				end
			end
		else
			TriggerClientEvent("Notify",source,"Atenção","Já possui um plano ativo.","amarelo",5000)
		end
	end
end)