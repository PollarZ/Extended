-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Displays = {}
local Active = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFY
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if not Active then
			if LocalPlayer["state"]["Route"] == 0 then
				for Number,v in pairs(Displays) do
					if #(Coords - v["Coords"]) <= v["Distance"] then
						SendNUIMessage({ name = "Show", payload = { v["Key"], v["Title"], v["Legend"] } })
						Active = Number
					end
				end
			end
		else
			if Displays[Active] and #(Coords - Displays[Active]["Coords"]) > Displays[Active]["Distance"] then
				SendNUIMessage({ name = "Hide" })
				Active = false
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOVERFY:INSERT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hoverfy:Insert")
AddEventHandler("hoverfy:Insert",function(Table)
	for Number = 1,#Table do
		Displays[#Displays + 1] = {
			["Coords"] = Table[Number][1],
			["Distance"] = Table[Number][2],
			["Key"] = Table[Number][3],
			["Title"] = Table[Number][4],
			["Legend"] = Table[Number][5]
		}
	end
end)