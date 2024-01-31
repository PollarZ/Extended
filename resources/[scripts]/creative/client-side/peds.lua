-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Spawned = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -- Ballas
		Distance = 50,
		Coords = { 92.37,-1982.12,20.46,320.32 },
		Model = "g_m_y_mexgang_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Families
		Distance = 50,
		Coords = { -154.56,-1643.23,36.85,51.03 },
		Model = "g_m_y_mexgang_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Vagos
		Distance = 50,
		Coords = { 385.07,-2033.65,23.1,65.2 },
		Model = "g_m_y_mexgang_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Aztecas
		Distance = 50,
		Coords = { 513.54,-1801.33,28.51,243.78 },
		Model = "g_m_y_mexgang_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Bloods
		Distance = 50,
		Coords = { 233.37,-1761.44,28.7,138.9 },
		Model = "g_m_y_mexgang_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cassino
		Distance = 25,
		Coords = { 988.37,43.06,71.3,170.08 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Scrap
		Distance = 100,
		Coords = { 3809.16,4489.51,6.39,300.48 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Scrap
		Distance = 100,
		Coords = { -2017.88,3383.98,31.24,45.36 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Desmanche
		Distance = 100,
		Coords = { 778.49,-395.89,33.43,99.22 },
		Model = "g_m_y_salvagoon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Concessionária
		Distance = 25,
		Coords = { -56.94,-1098.77,26.42,25.52 },
		Model = "player_zero",
		anim = { "amb@prop_human_bum_shopping_cart@male@base","base" }
	},{ -- Barman
		Distance = 15,
		Coords = { 987.83,-95.28,74.85,223.94 },
		Model = "g_f_y_lost_01",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},{ -- Bus
		Distance = 50,
		Coords = { 453.47,-602.34,28.59,266.46 },
		Model = "a_m_y_business_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Taxi
		Distance = 50,
		Coords = { 901.97,-167.97,74.07,238.12 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Helicopters
		Distance = 100,
		Coords = { -1896.42,-3032.01,13.93,243.78 },
		Model = "g_m_y_korlieut_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Caminhoneiro
		Distance = 100,
		Coords = { 1239.87,-3257.2,7.09,274.97 },
		Model = "s_m_m_trucker_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Coveiro
		Distance = 100,
		Coords = { -1745.92,-204.83,57.39,320.32 },
		Model = "g_m_m_armboss_01",
		anim = { "timetable@trevor@smoking_meth@base","base" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1136.52,-1557.0,35.03,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 24.51,-1346.75,29.49,272.13 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 2556.77,380.87,108.61,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1164.81,-323.61,69.2,99.22 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -706.16,-914.55,19.21,87.88 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -47.35,-1758.59,29.42,45.36 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 372.7,326.89,103.56,255.12 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -3242.7,1000.05,12.82,357.17 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1728.08,6415.6,35.03,243.78 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 549.09,2670.89,42.16,93.55 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1959.87,3740.44,32.33,300.48 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 2677.65,3279.66,55.23,331.66 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1697.32,4923.46,42.06,323.15 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -1819.52,793.48,138.08,130.4 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1391.62,3605.95,34.98,198.43 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -2966.41,391.52,15.05,82.21 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -3039.42,584.42,7.9,14.18 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1134.32,-983.09,46.4,277.8 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { 1165.32,2710.79,38.15,175.75 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -1486.72,-377.61,40.15,130.4 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Departament Store
		Distance = 15,
		Coords = { -1221.48,-907.93,12.32,31.19 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 1692.27,3760.91,34.69,226.78 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 253.8,-50.47,69.94,65.2 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 842.54,-1035.25,28.19,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { -331.67,6084.86,31.46,223.94 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { -662.37,-933.58,21.82,181.42 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { -1304.12,-394.56,36.7,73.71 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { -1118.98,2699.73,18.55,221.11 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 2567.98,292.62,108.73,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { -3173.51,1088.35,20.84,246.62 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 22.53,-1105.52,29.79,155.91 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Ammu-Nation Store
		Distance = 15,
		Coords = { 810.22,-2158.99,29.62,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Pharmacy Store
		Distance = 30,
		Coords = { -172.89,6381.32,31.48,223.94 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Pharmacy Store
		Distance = 30,
		Coords = { 1690.07,3581.68,35.62,212.6 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Pharmacy Store
		Distance = 15,
		Coords = { 1141.79,-1530.13,35.03,90.71 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Recycling Sell
		Distance = 50,
		Coords = { -428.54,-1728.29,19.78,70.87 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Recycling Sell
		Distance = 50,
		Coords = { 180.07,2793.29,45.65,283.47 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Recycling Sell
		Distance = 50,
		Coords = { -195.42,6264.62,31.49,42.52 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Jewelry
		Distance = 15,
		Coords = { -628.79,-238.7,38.05,311.82 },
		Model = "cs_gurk",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Transporter
		Distance = 20,
		Coords = { 264.74,219.99,101.67,343.0 },
		Model = "ig_casey",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Lenhador
		Distance = 50,
		Coords = { 1961.61,5179.26,47.94,277.8 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Lixeiro
		Distance = 50,
		Coords = { 82.98,-1553.55,29.59,51.03 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Lixeiro
		Distance = 50,
		Coords = { 287.77,2843.9,44.7,121.89 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Lixeiro
		Distance = 50,
		Coords = { -413.97,6171.58,31.48,320.32 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Caçador
		Distance = 10,
		Coords = { -679.13,5839.52,17.32,226.78 },
		Model = "ig_hunter",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Caçador
		Distance = 50,
		Coords = { -1593.08,5202.9,4.31,297.64 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Pescador
		Distance = 30,
		Coords = { -1816.64,-1193.73,14.31,334.49 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market) Praça
		Distance = 25,
		Coords = { 280.59,-970.28,29.42,0.0 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market) Hospital
		Distance = 25,
		Coords = { -686.61,322.19,83.09,164.41 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { -320.41,-814.58,32.47,195.6 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { -1278.21,-1126.43,6.91,141.74 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { 469.06,-718.27,27.53,87.88 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { -473.8,1114.42,320.23,73.71 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { -851.51,-353.56,38.67,201.26 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		for Number = 1,#List do
			local Distance = #(Coords - vec3(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3]))
			if Distance <= List[Number]["Distance"] then
				if not Spawned[Number] and LoadModel(List[Number]["Model"]) then
					Spawned[Number] = CreatePed(4,List[Number]["Model"],List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3] - 1,List[Number]["Coords"][4],false,false)
					SetPedArmour(Spawned[Number],100)
					SetEntityInvincible(Spawned[Number],true)
					FreezeEntityPosition(Spawned[Number],true)
					SetEntityNoCollisionEntity(Spawned[Number],Ped,false)
					SetBlockingOfNonTemporaryEvents(Spawned[Number],true)

					SetModelAsNoLongerNeeded(List[Number]["Model"])

					if List[Number]["Model"] == "s_f_y_casino_01" then
						SetPedDefaultComponentVariation(Spawned[Number])
						SetPedComponentVariation(Spawned[Number],0,3,0,0)
						SetPedComponentVariation(Spawned[Number],1,0,0,0)
						SetPedComponentVariation(Spawned[Number],2,3,0,0)
						SetPedComponentVariation(Spawned[Number],3,0,1,0)
						SetPedComponentVariation(Spawned[Number],4,1,0,0)
						SetPedComponentVariation(Spawned[Number],6,1,0,0)
						SetPedComponentVariation(Spawned[Number],7,1,0,0)
						SetPedComponentVariation(Spawned[Number],8,0,0,0)
						SetPedComponentVariation(Spawned[Number],10,0,0,0)
						SetPedComponentVariation(Spawned[Number],11,0,0,0)
						SetPedPropIndex(Spawned[Number],1,0,0,false)
					end

					if List[Number]["anim"] and LoadAnim(List[Number]["anim"][1]) then
						TaskPlayAnim(Spawned[Number],List[Number]["anim"][1],List[Number]["anim"][2],8.0,8.0,-1,1,1,0,0,0)
					end
				end
			else
				if Spawned[Number] then
					if DoesEntityExist(Spawned[Number]) then
						DeleteEntity(Spawned[Number])
					end

					Spawned[Number] = nil
				end
			end
		end

		Wait(1000)
	end
end)