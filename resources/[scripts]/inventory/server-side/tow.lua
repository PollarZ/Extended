-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:TOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Tow")
AddEventHandler("inventory:Tow",function(Vehicle,Vehicle02,Mode)
	local source = source
	local Players = vRPC.Players(source)
	for _,v in pairs(Players) do
		async(function()
			TriggerClientEvent("inventory:ClientTow",v,Vehicle,Vehicle02,Mode)
		end)
	end
end)