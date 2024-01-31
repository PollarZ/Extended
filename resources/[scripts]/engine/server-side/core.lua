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
Tunnel.bindInterface("engine",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RechargeFuel(Price)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not vRP.PaymentFull(Passport,Price) then
		TriggerClientEvent("Notify",source,"Aviso","<b>Dólares</b> insuficientes.","amarelo",5000)
		exports["bank"]:AddTaxs(Passport,"Posto de Gasolina",Price,"Gastos com combustível.")
		return false
	end

	return true
end