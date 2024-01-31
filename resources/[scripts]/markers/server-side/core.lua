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
Tunnel.bindInterface("markers",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Players = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Users()
	local Markers = {}

	for Index,v in pairs(Players) do
		local Ped = GetPlayerPed(Index)
		if DoesEntityExist(Ped) then
			Markers[Index] = {
				["Coords"] = GetEntityCoords(Ped),
				["Service"] = v
			}
		end
	end

	return Markers
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTER
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Enter",function(source,Permission)
	if not Players[source] then
		Players[source] = Permission

		local Service = vRP.NumPermission("Emergencia")
		for _,Sources in pairs(Service) do
			async(function()
				TriggerClientEvent("markers:Add",Sources,source,Permission)
			end)
		end

		TriggerClientEvent("markers:Full",source,Players)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXIT
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Exit",function(source)
	if Players[source] then
		Players[source] = nil

		local Service = vRP.NumPermission("Emergencia")
		for _,Sources in pairs(Service) do
			async(function()
				TriggerClientEvent("markers:Remove",Sources,source)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	exports["markers"]:Exit(source)
end)