-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
local Treatment = false
local TreatmentTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Beds = {
	-- Medical Center Sul
	{ ["Coords"] = vec3(1124.82,-1554.57,34.59), ["Heading"] = 360.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1121.36,-1554.54,34.59), ["Heading"] = 360.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1117.83,-1554.57,34.59), ["Heading"] = 360.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1117.87,-1563.12,34.59), ["Heading"] = 180.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1121.33,-1563.12,34.59), ["Heading"] = 180.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1124.75,-1563.14,34.59), ["Heading"] = 180.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1128.62,-1557.90,39.06), ["Heading"] = 270.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1124.89,-1552.42,39.06), ["Heading"] = 180.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1124.87,-1545.34,39.06), ["Heading"] = 180.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1152.09,-1542.25,39.06), ["Heading"] = 0.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1152.09,-1548.76,39.06), ["Heading"] = 0.0, ["Invert"] = 0.0 },
	{ ["Coords"] = vec3(1152.09,-1555.27,39.06), ["Heading"] = 0.0, ["Invert"] = 0.0 },
	-- Medical Center Norte
	{ ["Coords"] = vec3(-252.15,6323.11,32.35), ["Heading"] = 133.23, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-250.5,6321.87,32.35), ["Heading"] = 133.23, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-246.98,6317.95,32.33), ["Heading"] = 133.23, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-245.27,6316.22,32.35), ["Heading"] = 133.23, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-251.03,6310.51,32.35), ["Heading"] = 317.49, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-252.63,6312.12,32.35), ["Heading"] = 317.49, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-254.39,6313.88,32.35), ["Heading"] = 317.49, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-256.1,6315.58,32.35), ["Heading"] = 317.49, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(-258.03,6317.12,32.35), ["Heading"] = 317.49, ["Invert"] = 180.0 },
	-- Boolingbroke
	{ ["Coords"] = vec3(1761.87,2591.56,45.66), ["Heading"] = 272.13, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(1761.87,2594.64,45.66), ["Heading"] = 272.13, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(1761.87,2597.73,45.66), ["Heading"] = 272.13, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(1771.98,2597.95,45.66), ["Heading"] = 87.88, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(1771.98,2594.88,45.66), ["Heading"] = 87.88, ["Invert"] = 180.0 },
	{ ["Coords"] = vec3(1771.98,2591.79,45.66), ["Heading"] = 87.88, ["Invert"] = 180.0 },
	-- Clandestine
	{ ["Coords"] = vec3(-471.87,6287.56,13.63), ["Heading"] = 53.86, ["Invert"] = 180.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Beds) do
		AddBoxZone("Beds:"..Number,v["Coords"],2.0,1.0,{
			name = "Beds:"..Number,
			heading = v["Heading"],
			minZ = v["Coords"]["z"] - 0.10,
			maxZ = v["Coords"]["z"] + 0.50
		},{
			shop = Number,
			Distance = 1.50,
			options = {
				{
					event = "target:PutBed",
					label = "Deitar",
					tunnel = "client"
				},{
					event = "target:Treatment",
					label = "Tratamento",
					tunnel = "client"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PUTBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:PutBed")
AddEventHandler("target:PutBed",function(Number)
	if not Previous then
		local Ped = PlayerPedId()
		Previous = GetEntityCoords(Ped)
		SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
		vRP.playAnim(false,{"amb@world_human_sunbathe@female@back@idle_a","idle_a"},true)
		SetEntityHeading(Ped,Beds[Number]["Heading"] - Beds[Number]["Invert"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpBed")
AddEventHandler("target:UpBed",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Treatment")
AddEventHandler("target:Treatment",function(Number)
	if not Previous and vSERVER.CheckIn() then
		local Ped = PlayerPedId()
		Previous = GetEntityCoords(Ped)
		SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
		vRP.playAnim(false,{"amb@world_human_sunbathe@female@back@idle_a","idle_a"},true)
		SetEntityHeading(Ped,Beds[Number]["Heading"] - Beds[Number]["Invert"])

		TriggerEvent("inventory:preventWeapon")
		LocalPlayer["state"]:set("Commands",true,true)
		LocalPlayer["state"]:set("Buttons",true,true)
		LocalPlayer["state"]:set("Cancel",true,true)
		NetworkSetFriendlyFireOption(false)
		TriggerEvent("paramedic:Reset")

		if GetEntityHealth(Ped) <= 100 then
			exports["survival"]:Revive(101)
		end

		Treatment = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:StartTreatment")
AddEventHandler("target:StartTreatment",function()
	if not Treatment then
		LocalPlayer["state"]:set("Commands",true,true)
		LocalPlayer["state"]:set("Buttons",true,true)
		LocalPlayer["state"]:set("Cancel",true,true)
		NetworkSetFriendlyFireOption(false)
		TriggerEvent("paramedic:Reset")
		Treatment = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBEDS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if Previous and not IsEntityPlayingAnim(Ped,"amb@world_human_sunbathe@female@back@idle_a","idle_a",3) then
			SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
			Previous = nil
		end

		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if Treatment then
			if GetGameTimer() >= TreatmentTimer then
				local Ped = PlayerPedId()
				local Health = GetEntityHealth(Ped)
				TreatmentTimer = GetGameTimer() + 1000

				if Health < 200 then
					SetEntityHealth(Ped,Health + 1)
				else
					Treatment = false
					NetworkSetFriendlyFireOption(true)
					LocalPlayer["state"]:set("Cancel",false,true)
					LocalPlayer["state"]:set("Buttons",false,true)
					LocalPlayer["state"]:set("Commands",false,true)
					TriggerEvent("Notify","Sucesso","Tratamento concluido.","amarelo",5000)
				end
			end
		end

		Wait(1000)
	end
end)