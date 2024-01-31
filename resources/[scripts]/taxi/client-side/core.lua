-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("taxi")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blip = nil
local Selected = 1
local Current = nil
local Passenger = nil
local Service = false
local Walking = false
local PaymentActive = false
local Lasted = math.random(#Locations)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	exports["target"]:AddBoxZone("WorkTaxi",Init["xyz"],0.75,0.75,{
		name = "WorkTaxi",
		heading = Init["w"],
		minZ = Init["z"] - 0.0,
		maxZ = Init["z"] + 2.0
	},{
		Distance = 2.0,
		options = {
			{
				event = "taxi:Init",
				label = "Trabalhar",
				tunnel = "client"
			}
		}
	})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAXI:INIT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("taxi:Init",function()
	Walking = false
	PaymentActive = false

	if DoesBlipExist(Blip) then
		RemoveBlip(Blip)
		Blip = nil
	end

	if Current then
		TriggerServerEvent("DeletePed",Current)
		Current = nil
	end

	if Passenger then
		TriggerServerEvent("DeletePed",Passenger)
		Passenger = nil
	end

	if Service then
		TriggerEvent("Notify","Sucesso","Trabalho finalizado.","verde",5000)
		exports["target"]:LabelText("WorkTaxi","Trabalhar")
		Service = false
	else
		TriggerEvent("Notify","Sucesso","Trabalho iniciado.","verde",5000)
		exports["target"]:LabelText("WorkTaxi","Finalizar")
		MarkedPassenger()
		Service = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if Service and IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)
			local Vehicle = GetVehiclePedIsUsing(Ped)
			local Distance = #(Coords - Locations[Selected]["Vehicle"])
			if Distance <= 100 and not Walking and GetEntityArchetypeName(Vehicle) == "taxi" then
				TimeDistance = 1

				DrawMarker(21,Locations[Selected]["Vehicle"]["x"],Locations[Selected]["Vehicle"]["y"],Locations[Selected]["Vehicle"]["z"],0,0,0,0,180.0,130.0,1.5,1.5,1.0,65,130,226,100,0,0,0,1)

				if IsControlJustPressed(1,38) and Distance <= 2.5 then
					if PaymentActive then
						FreezeEntityPosition(Vehicle,true)

						if DoesEntityExist(Current) then
							vSERVER.Payment(Selected)
							Passenger = PedToNet(Current)
							TaskLeaveVehicle(Current,Vehicle,0)

							SetTimeout(1500,function()
								SetVehicleDoorShut(Vehicle,3,false)
								TaskWanderStandard(Current,10.0,10)
								SetEntityAsNoLongerNeeded(Current)
							end)
						end

						FreezeEntityPosition(Vehicle,false)

						PaymentActive = false
						Lasted = Selected

						repeat
							if Lasted == Selected then
								Selected = math.random(#Locations)
							end

							Wait(1)
						until Lasted ~= Selected

						MarkedPassenger()

						SetTimeout(30000,function()
							if Passenger then
								TriggerServerEvent("DeletePed",Passenger)
								Passenger = nil
							end
						end)
					else
						CreatePassenger(Vehicle)
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPASSENGER
-----------------------------------------------------------------------------------------------------------------------------------------
function CreatePassenger(Vehicle)
	if Current then
		TriggerServerEvent("DeletePed",Current)
		Current = nil
	end

	if Passenger then
		TriggerServerEvent("DeletePed",Passenger)
		Passenger = nil
	end

	local Rand = math.random(#Models)
	local Application,Network = vRPS.CreateModels(Models[Rand],Locations[Selected]["Ped"]["x"],Locations[Selected]["Ped"]["y"],Locations[Selected]["Ped"]["z"])
	if Application then
		Walking = true

		SetTimeout(1000,function()
			Current = LoadNetwork(Network)
			if Current then
				SetPedAlertness(Current,3)
				SetPedAsEnemy(Current,false)
				SetPedKeepTask(Current,true)
				StopPedSpeaking(Current,true)
				DisablePedPainAudio(Current,true)
				SetPedSeeingRange(Current,10000.0)
				SetPedHearingRange(Current,10000.0)
				SetPedFleeAttributes(Current,0,false)

				SetTimeout(1000,function()
					LocalPlayer["state"]:set("BlockLocked",true,false)
					TaskEnterVehicle(Current,Vehicle,-1,2,1.0,8,0)
					FreezeEntityPosition(Vehicle,true)
					SetEntityInvincible(Current,true)
					SetVehicleDoorsLocked(Vehicle,1)

					while not IsPedSittingInVehicle(Current,Vehicle) do
						Wait(1)
					end

					LocalPlayer["state"]:set("BlockLocked",false,false)
					FreezeEntityPosition(Vehicle,false)
					Lasted = Selected

					repeat
						if Lasted == Selected then
							Selected = math.random(#Locations)
						end

						Wait(1)
					until Lasted ~= Selected

					Walking = false
					MarkedPassenger()
					PaymentActive = true
				end)
			end
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKEDPASSENGER
-----------------------------------------------------------------------------------------------------------------------------------------
function MarkedPassenger()
	if DoesBlipExist(Blip) then
		RemoveBlip(Blip)
		Blip = nil
	end

	Blip = AddBlipForCoord(Locations[Selected]["Vehicle"]["x"],Locations[Selected]["Vehicle"]["y"],Locations[Selected]["Vehicle"]["z"])
	SetBlipSprite(Blip,1)
	SetBlipDisplay(Blip,4)
	SetBlipAsShortRange(Blip,true)
	SetBlipColour(Blip,77)
	SetBlipScale(Blip,0.75)
	SetBlipRoute(Blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Taxista")
	EndTextCommandSetBlipName(Blip)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,Text)
	local Screen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if Screen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(Text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local Width = string.len(Text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,Width,0.03,15,15,15,175)
	end
end