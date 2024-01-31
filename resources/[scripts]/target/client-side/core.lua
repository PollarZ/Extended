-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("target")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Zones = {}
local Models = {}
local Selected = {}
local Sucess = false
local Dismantler = 1
local FreezeDismantle = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
local Dismantle = {
	vec3(943.23,-1497.87,30.11),
	vec3(-1172.57,-2037.65,13.75),
	vec3(-524.94,-1680.63,19.21),
	vec3(1358.14,-2095.41,52.0),
	vec3(602.47,-437.82,24.75),
	vec3(-413.86,-2179.29,10.31),
	vec3(146.51,320.62,112.14),
	vec3(520.91,169.14,99.36),
	vec3(1137.99,-794.32,57.59),
	vec3(-93.07,-2549.6,6.0),
	vec3(820.07,-488.43,30.46),
	vec3(1078.62,-2325.56,30.25),
	vec3(1204.69,-3116.71,5.50)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Dismantle")
AddEventHandler("target:Dismantle",function(Model)
	if not FreezeDismantle then
		FreezeDismantle = true
		Dismantler = math.random(#Dismantle)
		TriggerEvent("NotifyPush",{ code = 20, title = "Localização do Desmanche", x = Dismantle[Dismantler]["x"], y = Dismantle[Dismantler]["y"], z = Dismantle[Dismantler]["z"], vehicle = VehicleName(Model), color = 60 })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE:RESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dismantle:Reset")
AddEventHandler("dismantle:Reset",function()
	FreezeDismantle = false

	local Backup = Dismantler
	repeat
		Dismantler = math.random(#Dismantle)
	until Backup ~= Dismantler
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRES
-----------------------------------------------------------------------------------------------------------------------------------------
local Tyres = {
	["wheel_lf"] = 0,
	["wheel_rf"] = 1,
	["wheel_lm"] = 2,
	["wheel_rm"] = 3,
	["wheel_lr"] = 4,
	["wheel_rr"] = 5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Fuels = {
	vec3(273.83,-1253.46,28.29),
	vec3(273.83,-1261.29,28.29),
	vec3(273.83,-1268.63,28.29),
	vec3(265.06,-1253.46,28.29),
	vec3(265.06,-1261.29,28.29),
	vec3(265.06,-1268.63,28.29),
	vec3(256.43,-1253.46,28.29),
	vec3(256.43,-1261.29,28.29),
	vec3(256.43,-1268.63,28.29),
	vec3(2680.90,3266.40,54.39),
	vec3(2678.51,3262.33,54.39),
	vec3(-2104.53,-311.01,12.16),
	vec3(-2105.39,-319.21,12.16),
	vec3(-2106.06,-325.57,12.16),
	vec3(-2097.48,-326.48,12.16),
	vec3(-2096.81,-320.11,12.16),
	vec3(-2096.09,-311.90,12.16),
	vec3(-2087.21,-312.81,12.16),
	vec3(-2088.08,-321.03,12.16),
	vec3(-2088.75,-327.39,12.16),
	vec3(-2551.39,2327.11,32.24),
	vec3(-2558.02,2326.70,32.24),
	vec3(-2558.48,2334.13,32.24),
	vec3(-2552.60,2334.46,32.24),
	vec3(-2558.77,2341.48,32.24),
	vec3(-2552.39,2341.89,32.24),
	vec3(186.97,6606.21,31.06),
	vec3(179.67,6604.93,31.06),
	vec3(172.33,6603.63,31.06),
	vec3(818.99,-1026.24,25.44),
	vec3(810.7,-1026.24,25.44),
	vec3(810.7,-1030.94,25.44),
	vec3(818.99,-1030.94,25.44),
	vec3(818.99,-1026.24,25.44),
	vec3(827.3,-1026.24,25.64),
	vec3(827.3,-1030.94,25.64),
	vec3(1207.07,-1398.16,34.39),
	vec3(1204.2,-1401.03,34.39),
	vec3(1210.07,-1406.9,34.39),
	vec3(1212.94,-1404.03,34.39),
	vec3(1178.97,-339.54,68.37),
	vec3(1186.4,-338.23,68.36),
	vec3(1184.89,-329.7,68.31),
	vec3(1177.46,-331.01,68.32),
	vec3(1175.71,-322.3,68.36),
	vec3(1183.13,-320.99,68.36),
	vec3(629.64,263.84,102.27),
	vec3(629.64,273.97,102.27),
	vec3(620.99,273.97,102.27),
	vec3(621.0,263.84,102.27),
	vec3(612.44,263.84,102.27),
	vec3(612.43,273.96,102.27),
	vec3(2588.41,358.56,107.66),
	vec3(2588.65,364.06,107.66),
	vec3(2581.18,364.39,107.66),
	vec3(2580.94,358.89,107.66),
	vec3(2573.55,359.21,107.66),
	vec3(2573.79,364.71,107.66),
	vec3(174.99,-1568.44,28.33),
	vec3(181.81,-1561.96,28.33),
	vec3(176.03,-1555.91,28.33),
	vec3(169.3,-1562.26,28.33),
	vec3(-329.81,-1471.63,29.73),
	vec3(-324.74,-1480.41,29.73),
	vec3(-317.26,-1476.09,29.73),
	vec3(-322.33,-1467.31,29.73),
	vec3(-314.92,-1463.03,29.73),
	vec3(-309.85,-1471.79,29.73),
	vec3(1786.08,3329.86,40.42),
	vec3(1785.04,3331.48,40.35),
	vec3(50.31,2778.54,57.05),
	vec3(48.92,2779.59,57.05),
	vec3(264.98,2607.18,43.99),
	vec3(263.09,2606.8,43.99),
	vec3(1035.45,2674.44,38.71),
	vec3(1043.22,2674.45,38.71),
	vec3(1043.22,2667.92,38.71),
	vec3(1035.45,2667.91,38.71),
	vec3(1209.59,2658.36,36.9),
	vec3(1208.52,2659.43,36.9),
	vec3(1205.91,2662.05,36.9),
	vec3(2539.8,2594.81,36.96),
	vec3(2001.55,3772.21,31.4),
	vec3(2003.92,3773.48,31.4),
	vec3(2006.21,3774.96,31.4),
	vec3(2009.26,3776.78,31.4),
	vec3(1684.6,4931.66,41.23),
	vec3(1690.1,4927.81,41.23),
	vec3(1705.74,6414.61,31.77),
	vec3(1701.73,6416.49,31.77),
	vec3(1697.76,6418.35,31.77),
	vec3(-97.06,6416.77,30.65),
	vec3(-91.29,6422.54,30.65),
	vec3(-1808.71,799.96,137.69),
	vec3(-1803.62,794.4,137.69),
	vec3(-1797.22,800.56,137.66),
	vec3(-1802.31,806.12,137.66),
	vec3(-1795.93,811.97,137.7),
	vec3(-1790.83,806.41,137.7),
	vec3(-1438.07,-268.69,45.41),
	vec3(-1444.5,-274.23,45.41),
	vec3(-1435.5,-284.68,45.41),
	vec3(-1429.07,-279.15,45.41),
	vec3(-732.64,-932.51,18.22),
	vec3(-732.64,-939.32,18.22),
	vec3(-724.0,-939.32,18.22),
	vec3(-724.0,-932.51,18.22),
	vec3(-715.43,-932.51,18.22),
	vec3(-715.43,-939.32,18.22),
	vec3(-532.28,-1212.71,17.33),
	vec3(-529.51,-1213.96,17.33),
	vec3(-524.92,-1216.15,17.33),
	vec3(-522.23,-1217.42,17.33),
	vec3(-518.52,-1209.5,17.33),
	vec3(-521.21,-1208.23,17.33),
	vec3(-525.8,-1206.04,17.33),
	vec3(-528.57,-1204.8,17.33),
	vec3(-72.03,-1765.1,28.53),
	vec3(-69.45,-1758.01,28.55),
	vec3(-77.59,-1755.05,28.81),
	vec3(-80.17,-1762.14,28.8),
	vec3(-63.61,-1767.93,28.27),
	vec3(-61.03,-1760.85,28.31)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	RegisterCommand("+entityTarget",TargetEnable)
	RegisterCommand("-entityTarget",TargetDisable)
	RegisterKeyMapping("+entityTarget","Interação auricular.","keyboard","LMENU")

	AddBoxZone("WorkBus",vec3(453.47,-602.34,28.59),0.5,0.5,{
		name = "WorkBus",
		heading = 266.46,
		minZ = 28.59 - 0.75,
		maxZ = 28.59 + 0.75
	},{
		Distance = 1.0,
		options = {
			{
				event = "bus:Init",
				label = "Trabalhar",
				tunnel = "client"
			}
		}
	})

	AddTargetModel({ -2007231801,1339433404,1694452750,1933174915,-462817101,-469694731,-164877493,486135101 },{
		options = {
			{
				event = "shops:Fuel",
				label = "Combustível",
				tunnel = "client"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ 654385216,161343630,-430989390,1096374064,-1519644200,-1932041857,207578973,-487222358 },{
		options = {
			{
				event = "slotmachine:Init",
				label = "Sentar",
				tunnel = "client"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -1691644768,-742198632 },{
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Encher",
				tunnel = "proserver",
				service = "emptybottle"
			},
			{
				event = "inventory:Drink",
				label = "Beber",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ 690372739 },{
		options = {
			{
				event = "shops:Coffee",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -654402915,1421582485 },{
		options = {
			{
				event = "shops:Donut",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 992069095,1114264700 },{
		options = {
			{
				event = "shops:Soda",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 1129053052 },{
		options = {
			{
				event = "shops:Hamburger",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -1581502570 },{
		options = {
			{
				event = "shops:Hotdog",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 73774428 },{
		options = {
			{
				event = "shops:Cigarette",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -272361894 },{
		options = {
			{
				event = "shops:Chihuahua",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ 1099892058 },{
		options = {
			{
				event = "shops:Water",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ -832573324,-1430839454,1457690978,1682622302,402729631,-664053099,1794449327,307287994,-1323586730,111281960,-541762431,-745300483,-417505688 },{
		options = {
			{
				event = "inventory:Animals",
				label = "Esfolar",
				tunnel = "server"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 1281992692,1158960338,1511539537,-78626473,-429560270 },{
		options = {
			{
				event = "hup:phoneObject",
				label = "Ligar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ 684586828,577432224,-1587184881,-1426008804,-228596739,1437508529,-1096777189,-468629664,1143474856,-2096124444,-115771139,1329570871,-130812911 },{
		options = {
			{
				event = "inventory:Trasher",
				label = "Vasculhar",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -206690185,666561306,218085040,-58485588,1511880420,682791951 },{
		options = {
			{
				event = "inventory:Trasher",
				label = "Vasculhar",
				tunnel = "server"
			},{
				event = "player:enterTrash",
				label = "Esconder",
				tunnel = "client"
			},{
				event = "player:checkTrash",
				label = "Verificar",
				tunnel = "server"
			},{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Trash"
			}
		},
		Distance = 0.75
	})

	-- AddCircleZone("BurgershotJuice",vec3(-1190.75,-905.45,14.1),0.2,{
	-- 	name = "BurgershotJuice",
	-- 	heading = 0.0,
	-- 	useZ = true
	-- },{
	-- 	Distance = 1.25,
	-- 	options = {
	-- 		{
	-- 			event = "inventory:MakeProducts",
	-- 			label = "Encher Copo",
	-- 			tunnel = "proserver",
	-- 			service = "foodjuice"
	-- 		}
	-- 	}
	-- })

	-- AddCircleZone("BurgershotBurger",vec3(-1191.44,-904.0,14.06),0.2,{
	-- 	name = "BurgershotBurger",
	-- 	heading = 0.0,
	-- 	useZ = true
	-- },{
	-- 	Distance = 1.0,
	-- 	options = {
	-- 		{
	-- 			event = "inventory:MakeProducts",
	-- 			label = "Montar Lanche",
	-- 			tunnel = "proserver",
	-- 			service = "foodburger"
	-- 		}
	-- 	}
	-- })

	-- AddCircleZone("BurgershotBox",vec3(-1196.24,-903.72,13.95),0.2,{
	-- 	name = "BurgershotBox",
	-- 	heading = 0.0,
	-- 	useZ = true
	-- },{
	-- 	Distance = 1.25,
	-- 	options = {
	-- 		{
	-- 			event = "inventory:MakeProducts",
	-- 			label = "Montar Combo",
	-- 			tunnel = "proserver",
	-- 			service = "foodbox"
	-- 		}
	-- 	}
	-- })

	AddCircleZone("BurgershotJuice",vec3(-1190.76,-904.24,13.99),0.5,{
		name = "BurgershotJuice",
		heading = 3374176,
		useZ = true
	},{
		Distance = 1.25,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Encher Copo",
				tunnel = "proserver",
				service = "foodjuice"
			}
		}
	})

	AddCircleZone("BurgershotBurger",vec3(-1202.09,-897.2,13.99),0.5,{
		name = "BurgershotBurger",
		heading = 3374176,
		useZ = true
	},{
		Distance = 1.0,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Montar Lanche",
				tunnel = "proserver",
				service = "foodburger"
			}
		}
	})

	AddCircleZone("BurgershotBox",vec3(-1197.92,-892.28,13.99),0.5,{
		name = "BurgershotBox",
		heading = 3374176,
		useZ = true
	},{
		Distance = 1.25,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Montar Combo",
				tunnel = "proserver",
				service = "foodbox"
			}
		}
	})

	AddCircleZone("UwuCoffeeJuice",vec3(-586.83,-1061.9,22.26),0.2,{
		name = "UwuCoffeeJuice",
		heading = 0.0,
		useZ = true
	},{
		Distance = 1.25,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Encher Copo",
				tunnel = "proserver",
				service = "foodjuice"
			}
		}
	})

	AddCircleZone("UwuCoffeeBurger",vec3(-590.9,-1056.47,22.39),0.2,{
		name = "UwuCoffeeBurger",
		heading = 0.0,
		useZ = true
	},{
		Distance = 1.0,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Montar Lanche",
				tunnel = "proserver",
				service = "foodburger"
			}
		}
	})

	AddCircleZone("UwuCoffeeBox",vec3(-591.09,-1063.05,22.32),0.2,{
		name = "UwuCoffeeBox",
		heading = 0.0,
		useZ = true
	},{
		Distance = 1.25,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Montar Combo",
				tunnel = "proserver",
				service = "foodbox"
			}
		}
	})

	AddCircleZone("Pdm",vec3(-56.94,-1098.77,26.42),0.75,{
		name = "Pdm",
		heading = 0.0
	},{
		Distance = 2.0,
		options = {
			{
				event = "pdm:Open",
				label = "Abrir",
				tunnel = "shop"
			}
		}
	})

	AddCircleZone("Cemitery",vec3(-1745.57,-205.19,57.37),0.5,{
		name = "Cemitery",
		heading = 0.0
	},{
		Distance = 1.0,
		options = {
			{
				event = "cemitery:initBody",
				label = "Conversar",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("CassinoWheel",vec3(988.37,43.06,71.3),0.5,{
		name = "CassinoWheel",
		heading = 3374176
	},{
		Distance = 1.5,
		options = {
			{
				event = "luckywheel:Target",
				label = "Roda da Fortuna",
				tunnel = "client"
			}
		}
	})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHANDCUFF
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 100
		local Ped = PlayerPedId()
		if LocalPlayer["state"]["Target"] or Sucess then
			TimeDistance = 1
			DisableControlAction(0,18,true)
			DisableControlAction(0,21,true)
			DisableControlAction(0,55,true)
			DisableControlAction(0,76,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,23,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,243,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,102,true)
			DisableControlAction(0,179,true)
			DisableControlAction(0,203,true)
			DisablePlayerFiring(Ped,true)
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function TargetEnable()
	local Ped = PlayerPedId()
	if (not LocalPlayer["state"]["Admin"] and LocalPlayer["state"]["Charizard"]) or LocalPlayer["state"]["Camera"] or LocalPlayer["state"]["Freecam"] or LocalPlayer["state"]["Carry"] or not LocalPlayer["state"]["Active"] or IsPauseMenuActive() or LocalPlayer["state"]["usingPhone"] or not MumbleIsConnected() or LocalPlayer["state"]["Buttons"] or LocalPlayer["state"]["Commands"] or LocalPlayer["state"]["Handcuff"] or Sucess or IsPedInAnyVehicle(Ped) then
		return
	end

	SendNUIMessage({ Action = "Open" })
	LocalPlayer["state"]:set("Target",true,false)

	while LocalPlayer["state"]["Target"] do
		local Hitable,HitCoords,Entitys = RayCastGamePlayCamera()

		if Hitable == 1 then
			local Coords = GetEntityCoords(Ped)

			for Index,v in pairs(Zones) do
				if Zones[Index]:isPointInside(HitCoords) and #(Coords - Zones[Index]["center"]) <= v["targetoptions"]["Distance"] then
					if v["targetoptions"]["shop"] then
						Selected = v["targetoptions"]["shop"]
					end

					SendNUIMessage({ Action = "Valid", data = Zones[Index]["targetoptions"]["options"] })

					Sucess = true
					while Sucess do
						local Ped = PlayerPedId()
						local Coords = GetEntityCoords(Ped)
						local _,RayCoords = RayCastGamePlayCamera()

						if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
							SetCursorLocation(0.5,0.5)
							SetNuiFocus(true,true)
						end

						if not Zones[Index]:isPointInside(RayCoords) or #(Coords - Zones[Index]["center"]) > v["targetoptions"]["Distance"] then
							Sucess = false
						end

						Wait(1)
					end

					SendNUIMessage({ Action = "Left" })
				end
			end

			if GetEntityType(Entitys) ~= 0 then
				--TriggerServerEvent("admin:Doords",GetEntityCoords(Entitys),GetEntityModel(Entitys),GetEntityHeading(Entitys))
				if IsEntityAVehicle(Entitys) then
					local Plate = GetVehicleNumberPlateText(Entitys)
					if #(Coords - HitCoords) <= 1.0 and Plate ~= "PDMSPORT" then
						local Menu = {}
						local Network = nil
						local Combustivel = false
						local Model = GetEntityModel(Entitys)
						SetEntityAsMissionEntity(Entitys,true,true)

						if NetworkGetEntityIsNetworked(Entitys) then
							Network = NetworkGetNetworkIdFromEntity(Entitys)
						end

						Selected = { Plate,vRP.VehicleModel(Entitys),Entitys,Network }

						for _,v in pairs(Fuels) do
							if #(Coords - v) <= 2.5 then
								Combustivel = true
								break
							end
						end

						if not Combustivel then
							if GetSelectedPedWeapon(Ped) == 883325847 then
								Selected[5] = true
								Menu[#Menu + 1] = { event = "engine:Supply", label = "Abastecer", tunnel = "client" }
							else
								if Entity(Entitys)["state"]["Lockpick"] then
									if GetVehicleDoorLockStatus(Entitys) <= 1 then
										for Index,Tyre in pairs(Tyres) do
											local Wheel = GetEntityBoneIndexByName(Entitys,Index)
											if Wheel ~= -1 then
												local CoordsWheel = GetWorldPositionOfEntityBone(Entitys,Wheel)
												if #(Coords - CoordsWheel) <= 1.0 then
													Selected[5] = Tyre
													Menu[#Menu + 1] = { event = "inventory:RemoveTyres", label = "Retirar Pneu", tunnel = "server" }
												end
											end
										end

										Menu[#Menu + 1] = { event = "trunkchest:openTrunk", label = "Abrir Porta-Malas", tunnel = "server" }
										Menu[#Menu + 1] = { event = "player:checkTrunk", label = "Checar Porta-Malas", tunnel = "server" }
									end

									Menu[#Menu + 1] = { event = "garages:Key", label = "Criar Chave Cópia", tunnel = "police" }
									Menu[#Menu + 1] = { event = "inventory:ChangePlate", label = "Trocar Placa", tunnel = "server" }
								else
									if Selected[2] == "stockade" then
										Menu[#Menu + 1] = { event = "inventory:Stockade", label = "Vasculhar", tunnel = "server" }
									end
								end

								if not IsThisModelABike(Model) then
									local Rolling = GetEntityRoll(Entitys)
									if Rolling > 75.0 or Rolling < -75.0 then
										Menu[#Menu + 1] = { event = "player:RollVehicle", label = "Desvirar", tunnel = "server" }
									else
										if GetEntityBoneIndexByName(Entitys,"boot") ~= -1 then
											local Trunk = GetEntityBoneIndexByName(Entitys,"boot")
											local CoordsTrunk = GetWorldPositionOfEntityBone(Entitys,Trunk)
											if #(Coords - CoordsTrunk) <= 1.75 then
												if GetVehicleDoorLockStatus(Entitys) <= 1 then
													Menu[#Menu + 1] = { event = "player:enterTrunk", label = "Entrar no Porta-Malas", tunnel = "client" }
												end

												Menu[#Menu + 1] = { event = "inventory:StealTrunk", label = "Arrombar Porta-Malas", tunnel = "server" }
											end
										end
									end
								end

								if LocalPlayer["state"]["Policia"] then
									Menu[#Menu + 1] = { event = "police:Plate", label = "Verificar Placa", tunnel = "police" }
									Menu[#Menu + 1] = { event = "police:ArrestVehicles", label = "Apreender", tunnel = "police" }
								else
									if #(Coords - Dismantle[Dismantler]) <= 15 then
										Menu[#Menu + 1] = { event = "inventory:Dismantle", label = "Desmanchar", tunnel = "server" }
									end
								end

								Menu[#Menu + 1] = { event = "engine:Vehrify", label = "Verificar", tunnel = "client" }
							end
						else
							Selected[5] = false
							Menu[#Menu + 1] = { event = "engine:Supply", label = "Abastecer", tunnel = "client" }
						end

						SendNUIMessage({ Action = "Valid", data = Menu })

						Sucess = true
						while Sucess do
							local Ped = PlayerPedId()
							local Coords = GetEntityCoords(Ped)
							local _,RayCoords,RayEntity = RayCastGamePlayCamera()

							if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
								SetCursorLocation(0.5,0.5)
								SetNuiFocus(true,true)
							end

							if GetEntityType(RayEntity) == 0 or #(Coords - RayCoords) > 1.0 then
								Sucess = false
							end

							Wait(1)
						end

						SendNUIMessage({ Action = "Left" })
					end
				elseif IsPedAPlayer(Entitys) then
					if #(Coords - HitCoords) <= 2.0 then
						local Index = NetworkGetPlayerIndexFromPed(Entitys)
						local source = GetPlayerServerId(Index)
						local Menu = {}

						Selected = { source }

						if LocalPlayer["state"]["Policia"] then
							Menu[#Menu + 1] = { event = "police:Inspect", label = "Revistar", tunnel = "paramedic" }
							Menu[#Menu + 1] = { event = "police:ArrestItens", label = "Apreender", tunnel = "paramedic" }
							Menu[#Menu + 1] = { event = "police:Preset", label = "Uniforme Presidiário", tunnel = "paramedic" }
						elseif LocalPlayer["state"]["Paramedico"] then
							if GetEntityHealth(Entitys) <= 100 then
								Menu[#Menu + 1] = { event = "paramedic:Revive", label = "Reanimar", tunnel = "paramedic" }
							else
								Menu[#Menu + 1] = { event = "paramedic:Treatment", label = "Tratamento", tunnel = "paramedic" }
								Menu[#Menu + 1] = { event = "paramedic:Bandage", label = "Passar Ataduras", tunnel = "paramedic" }
								Menu[#Menu + 1] = { event = "paramedic:presetBurn", label = "Roupa de Queimadura", tunnel = "paramedic" }
								Menu[#Menu + 1] = { event = "paramedic:presetPlaster", label = "Colocar Gesso", tunnel = "paramedic" }
								Menu[#Menu + 1] = { event = "paramedic:extractBlood", label = "Extrair Sangue", tunnel = "paramedic" }
							end

							Menu[#Menu + 1] = { event = "paramedic:Diagnostic", label = "Informações", tunnel = "paramedic" }
						end

						if IsEntityPlayingAnim(Entitys,"random@mugging3","handsup_standing_base",3) then
							Menu[#Menu + 1] = { event = "player:checkShoes", label = "Roubar Sapatos", tunnel = "paramedic" }
						end

						if GetEntityHealth(Ped) > 100 then
							Menu[#Menu + 1] = { event = "player:Demand", label = "Cobrança", tunnel = "paramedic" }
						end

						if #Menu >= 1 then
							SendNUIMessage({ Action = "Valid", data = Menu })

							Sucess = true
							while Sucess do
								local Ped = PlayerPedId()
								local Coords = GetEntityCoords(Ped)
								local _,RayCoords,RayEntity = RayCastGamePlayCamera()

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(RayEntity) == 0 or #(Coords - RayCoords) > 2.0 then
									Sucess = false
								end

								Wait(1)
							end

							SendNUIMessage({ Action = "Left" })
						end
					end
				else
					for Index,_ in pairs(Models) do
						if DoesEntityExist(Entitys) and Index == GetEntityModel(Entitys) then
							if #(Coords - HitCoords) <= Models[Index]["Distance"] then
								SetEntityAsMissionEntity(Entitys,true,true)

								if not IsEntityAPed(Entitys) then
									FreezeEntityPosition(Entitys,true)
								end

								local Network = nil
								if NetworkGetEntityIsNetworked(Entitys) then
									Network = NetworkGetNetworkIdFromEntity(Entitys)
								end

								Selected = { Entitys,Index,Network,GetEntityCoords(Entitys),IsEntityDead(Entitys) }

								SendNUIMessage({ Action = "Valid", data = Models[Index]["options"] })

								Sucess = true
								while Sucess do
									local Ped = PlayerPedId()
									local Coords = GetEntityCoords(Ped)
									local _,RayCoords,RayEntity = RayCastGamePlayCamera()

									if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
										SetCursorLocation(0.5,0.5)
										SetNuiFocus(true,true)
									end

									if GetEntityType(RayEntity) == 0 or #(Coords - RayCoords) > Models[Index]["Distance"] then
										Sucess = false
									end

									Wait(1)
								end

								SendNUIMessage({ Action = "Left" })
							end
						end
					end
				end
			end
		end

		Wait(1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:ROLLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:RollVehicle")
AddEventHandler("target:RollVehicle",function(Network)
	if NetworkDoesNetworkIdExist(Network) then
		local Vehicle = NetToEnt(Network)
		if DoesEntityExist(Vehicle) then
			SetVehicleOnGroundProperly(Vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function TargetDisable()
	if Sucess or not LocalPlayer["state"]["Target"] then
		return
	end

	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]:set("Target",false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Select",function(Data,Callback)
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]:set("Target",false,false)

	if Data["tunnel"] == "client" then
		TriggerEvent(Data["event"],Selected)
	elseif Data["tunnel"] == "shop" then
		TriggerEvent(Data["event"],Selected,Data["service"])
	elseif Data["tunnel"] == "entity" then
		TriggerEvent(Data["event"],Selected[1],Data["service"])
	elseif Data["tunnel"] == "products" then
		TriggerEvent(Data["event"],Data["service"])
	elseif Data["tunnel"] == "server" then
		TriggerServerEvent(Data["event"],Selected)
	elseif Data["tunnel"] == "police" then
		TriggerServerEvent(Data["event"],Selected,Data["service"])
	elseif Data["tunnel"] == "paramedic" then
		TriggerServerEvent(Data["event"],Selected[1],Data["service"])
	elseif Data["tunnel"] == "proserver" then
		TriggerServerEvent(Data["event"],Data["service"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]:set("Target",false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Debug")
AddEventHandler("target:Debug",function()
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]:set("Target",false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCOORDSFROMCAM
-----------------------------------------------------------------------------------------------------------------------------------------
function GetCoordsFromCam(Distance,Coords)
	local Rotation = GetGameplayCamRot()
	local Adjuste = vec3((math.pi / 180) * Rotation["x"],(math.pi / 180) * Rotation["y"],(math.pi / 180) * Rotation["z"])
	local Direction = vec3(-math.sin(Adjuste[3]) * math.abs(math.cos(Adjuste[1])),math.cos(Adjuste[3]) * math.abs(math.cos(Adjuste[1])),math.sin(Adjuste[1]))

	return vec3(Coords[1] + Direction[1] * Distance, Coords[2] + Direction[2] * Distance, Coords[3] + Direction[3] * Distance)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAYCASTGAMEPLAYCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function RayCastGamePlayCamera()
	local Ped = PlayerPedId()
	local Cam = GetGameplayCamCoord()
	local Cam2 = GetCoordsFromCam(10.0,Cam)
	local Handle = StartExpensiveSynchronousShapeTestLosProbe(Cam,Cam2,-1,Ped,4)
	local _,Hit,Coords,_,Entitys = GetShapeTestResult(Handle)

	return Hit,Coords,Entitys
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddCircleZone(Name,Center,Radius,Options,Target)
	Zones[Name] = CircleZone:Create(Center,Radius,Options)
	Zones[Name]["targetoptions"] = Target
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function RemCircleZone(Name)
	if Zones[Name] then
		Zones[Name]:destroy()
		Zones[Name] = nil
	end

	if Sucess then
		Sucess = false
		SetNuiFocus(false,false)
		SendNUIMessage({ Action = "Close" })
		LocalPlayer["state"]:set("Target",false,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function AddTargetModel(Model,Options)
	for _,v in pairs(Model) do
		Models[v] = Options
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function LabelText(Name,Text)
	if Zones[Name] then
		Zones[Name]["targetoptions"]["options"][1]["label"] = Text
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELOPTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function LabelOptions(Name,Text)
	if Zones[Name] then
		Zones[Name]["targetoptions"]["options"] = Text
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddBoxZone(Name,Center,Length,Width,Options,Target)
	Zones[Name] = BoxZone:Create(Center,Length,Width,Options)
	Zones[Name]["targetoptions"] = Target
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("LabelText",LabelText)
exports("AddBoxZone",AddBoxZone)
exports("LabelOptions",LabelOptions)
exports("RemCircleZone",RemCircleZone)
exports("AddCircleZone",AddCircleZone)
exports("AddTargetModel",AddTargetModel)