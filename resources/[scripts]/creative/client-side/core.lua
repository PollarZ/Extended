-----------------------------------------------------------------------------------------------------------------------------------------
-- MAPZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetMapZoomDataLevel(0,0.96,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(1,1.6,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(2,8.6,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(3,12.3,0.9,0.08,0.0,0.0)
	SetMapZoomDataLevel(4,22.3,0.9,0.08,0.0,0.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {
	{ 1239.87,-3257.2,7.09,67,62,"Caminhoneiro",0.5 },
	{ 1152.86,-1526.96,34.85,80,38,"Hospital",0.5 },
	{ -247.42,6331.39,32.42,80,38,"Hospital",0.5 },
	{ 55.43,-876.19,30.66,357,62,"Garagem",0.6 },
	{ 598.04,2741.27,42.07,357,62,"Garagem",0.6 },
	{ -136.36,6357.03,31.49,357,62,"Garagem",0.6 },
	{ 275.23,-345.54,45.17,357,62,"Garagem",0.6 },
	{ 596.40,90.65,93.12,357,62,"Garagem",0.6 },
	{ -340.76,265.97,85.67,357,62,"Garagem",0.6 },
	{ -2030.01,-465.97,11.60,357,62,"Garagem",0.6 },
	{ -1184.92,-1510.00,4.64,357,62,"Garagem",0.6 },
	{ 214.02,-808.44,31.01,357,62,"Garagem",0.6 },
	{ -348.88,-874.02,31.31,357,62,"Garagem",0.6 },
	{ 67.74,12.27,69.21,357,62,"Garagem",0.6 },
	{ 361.90,297.81,103.88,357,62,"Garagem",0.6 },
	{ 1035.89,-763.89,57.99,357,62,"Garagem",0.6 },
	{ -796.63,-2022.77,9.16,357,62,"Garagem",0.6 },
	{ 453.27,-1146.76,29.52,357,62,"Garagem",0.6 },
	{ 528.66,-146.3,58.38,357,62,"Garagem",0.6 },
	{ -1159.48,-739.32,19.89,357,62,"Garagem",0.6 },
	{ 101.22,-1073.68,29.38,357,62,"Garagem",0.6 },
	{ 1725.21,4711.77,42.11,357,62,"Garagem",0.6 },
	{ 1624.05,3566.14,35.15,357,62,"Garagem",0.6 },
	{ -73.35,-2004.6,18.27,357,62,"Garagem",0.6 },
	{ 1200.52,-1276.06,35.22,357,62,"Garagem",0.6 },
	{ 640.66,1.15,82.78,60,18,"Departamento Policial",0.6 },
	{ 29.2,-1351.89,29.34,52,36,"Loja de Departamento",0.5 },
	{ 2561.74,385.22,108.61,52,36,"Loja de Departamento",0.5 },
	{ 1160.21,-329.4,69.03,52,36,"Loja de Departamento",0.5 },
	{ -711.99,-919.96,19.01,52,36,"Loja de Departamento",0.5 },
	{ -54.56,-1758.56,29.05,52,36,"Loja de Departamento",0.5 },
	{ 375.87,320.04,103.42,52,36,"Loja de Departamento",0.5 },
	{ -3237.48,1004.72,12.45,52,36,"Loja de Departamento",0.5 },
	{ 1730.64,6409.67,35.0,52,36,"Loja de Departamento",0.5 },
	{ 543.51,2676.85,42.14,52,36,"Loja de Departamento",0.5 },
	{ 1966.53,3737.95,32.18,52,36,"Loja de Departamento",0.5 },
	{ 2684.73,3281.2,55.23,52,36,"Loja de Departamento",0.5 },
	{ 1696.12,4931.56,42.07,52,36,"Loja de Departamento",0.5 },
	{ -1820.18,785.69,137.98,52,36,"Loja de Departamento",0.5 },
	{ 1395.35,3596.6,34.86,52,36,"Loja de Departamento",0.5 },
	{ -2977.14,391.22,15.03,52,36,"Loja de Departamento",0.5 },
	{ -3034.99,590.77,7.8,52,36,"Loja de Departamento",0.5 },
	{ 1144.46,-980.74,46.19,52,36,"Loja de Departamento",0.5 },
	{ 1166.06,2698.17,37.95,52,36,"Loja de Departamento",0.5 },
	{ -1493.12,-385.55,39.87,52,36,"Loja de Departamento",0.5 },
	{ -1228.6,-899.7,12.27,52,36,"Loja de Departamento",0.5 },
	{ -361.85,-132.89,38.67,402,62,"Mecânica",0.7 },
	{ -1142.1,-1987.5,13.16,402,62,"Mecânica",0.7 },
	{ 1178.96,2651.42,37.81,402,62,"Mecânica",0.7 },
	{ 116.95,6615.26,31.85,402,62,"Mecânica",0.7 },
	{ 718.03,-1088.61,22.36,402,62,"Mecânica",0.7 },
	{ -205.64,-1306.65,31.31,402,62,"Mecânica",0.7 },
	{ 1692.27,3760.91,34.69,76,6,"Loja de Armas",0.4 },
	{ 253.8,-50.47,69.94,76,6,"Loja de Armas",0.4 },
	{ 842.54,-1035.25,28.19,76,6,"Loja de Armas",0.4 },
	{ -331.67,6084.86,31.46,76,6,"Loja de Armas",0.4 },
	{ -662.37,-933.58,21.82,76,6,"Loja de Armas",0.4 },
	{ -1304.12,-394.56,36.7,76,6,"Loja de Armas",0.4 },
	{ -1118.98,2699.73,18.55,76,6,"Loja de Armas",0.4 },
	{ 2567.98,292.62,108.73,76,6,"Loja de Armas",0.4 },
	{ -3173.51,1088.35,20.84,76,6,"Loja de Armas",0.4 },
	{ 22.53,-1105.52,29.79,76,6,"Loja de Armas",0.4 },
	{ 810.22,-2158.99,29.62,76,6,"Loja de Armas",0.4 },
	{ -815.12,-184.15,37.57,71,62,"Barbearia",0.5 },
	{ 139.56,-1704.12,29.05,71,62,"Barbearia",0.5 },
	{ -1278.11,-1116.66,6.75,71,62,"Barbearia",0.5 },
	{ 1928.89,3734.04,32.6,71,62,"Barbearia",0.5 },
	{ 1217.05,-473.45,65.96,71,62,"Barbearia",0.5 },
	{ -34.08,-157.01,56.83,71,62,"Barbearia",0.5 },
	{ -274.5,6225.27,31.45,71,62,"Barbearia",0.5 },
	{ 86.06,-1391.64,29.23,366,62,"Loja de Roupas",0.5 },
	{ -719.94,-158.18,37.0,366,62,"Loja de Roupas",0.5 },
	{ -152.79,-306.79,38.67,366,62,"Loja de Roupas",0.5 },
	{ -816.39,-1081.22,11.12,366,62,"Loja de Roupas",0.5 },
	{ -1206.51,-781.5,17.12,366,62,"Loja de Roupas",0.5 },
	{ -1458.26,-229.79,49.2,366,62,"Loja de Roupas",0.5 },
	{ -2.41,6518.29,31.48,366,62,"Loja de Roupas",0.5 },
	{ 1682.59,4819.98,42.04,366,62,"Loja de Roupas",0.5 },
	{ 129.46,-205.18,54.51,366,62,"Loja de Roupas",0.5 },
	{ 618.49,2745.54,42.01,366,62,"Loja de Roupas",0.5 },
	{ 1197.93,2698.21,37.96,366,62,"Loja de Roupas",0.5 },
	{ -3165.74,1061.29,20.84,366,62,"Loja de Roupas",0.5 },
	{ -1093.76,2703.99,19.04,366,62,"Loja de Roupas",0.5 },
	{ 414.86,-807.57,29.34,366,62,"Loja de Roupas",0.5 },
	{ -1728.06,-1050.69,1.71,356,62,"Embarcações",0.6 },
	{ -776.72,-1495.02,2.29,356,62,"Embarcações",0.6 },
	{ -893.97,5687.78,3.29,356,62,"Embarcações",0.6 },
	{ 1509.64,3788.7,33.51,356,62,"Embarcações",0.6 },
	{ 356.42,274.61,103.14,67,62,"Transportador",0.5 },
	{ 1965.2,5179.44,47.9,285,62,"Lenhador",0.5 },
	{ -172.89,6381.32,31.48,403,5,"Farmácia",0.7 },
	{ 1690.07,3581.68,35.62,403,5,"Farmácia",0.7 },
	{ 82.54,-1553.28,29.59,318,62,"Lixeiro",0.6 },
	{ 287.36,2843.6,44.7,318,62,"Lixeiro",0.6 },
	{ -413.97,6171.58,31.48,318,62,"Lixeiro",0.6 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.6 },
	{ 180.07,2793.29,45.65,467,11,"Reciclagem",0.6 },
	{ -195.42,6264.62,31.49,467,11,"Reciclagem",0.6 },
	{ 2953.93,2787.49,41.5,617,62,"Minerador",0.6 },
	{ 1327.98,-1654.78,52.03,75,13,"Loja de Tatuagem",0.5 },
	{ -1149.04,-1428.64,4.71,75,13,"Loja de Tatuagem",0.5 },
	{ 322.01,186.24,103.34,75,13,"Loja de Tatuagem",0.5 },
	{ -3175.64,1075.54,20.58,75,13,"Loja de Tatuagem",0.5 },
	{ 1866.01,3748.07,32.79,75,13,"Loja de Tatuagem",0.5 },
	{ -295.51,6199.21,31.24,75,13,"Loja de Tatuagem",0.5 },
	{ -1177.93,-884.13,13.88,439,62,"Restaurante",0.7 },
	{ -580.86,-1074.29,22.33,439,62,"Restaurante",0.7 },
	{ -70.49,-1104.59,26.12,225,62,"Concessionária",0.6 },
	{ -1896.42,-3032.01,13.93,43,62,"Aviação",0.7 },
	{ -1593.08,5202.9,4.31,141,62,"Caçador",0.7 },
	{ -679.13,5839.52,17.3,141,62,"Caçador",0.7 },
	{ 454.73,-600.83,28.56,513,62,"Motorista",0.5 },
	{ 919.38,-182.83,74.02,198,62,"Taxista",0.5 },
	{ 265.09,-1258.94,29.13,361,35,"Posto de Gasolina",0.4 },
	{ -2097.61,-320.57,13.16,361,35,"Posto de Gasolina",0.4 },
	{ -2555.19,2334.31,33.08,361,35,"Posto de Gasolina",0.4 },
	{ 179.99,6602.84,31.86,361,35,"Posto de Gasolina",0.4 },
	{ 818.92,-1028.65,26.89,361,35,"Posto de Gasolina",0.4 },
	{ 1207.05,-1403.68,36.26,361,35,"Posto de Gasolina",0.4 },
	{ 1181.61,-330.8,69.78,361,35,"Posto de Gasolina",0.4 },
	{ 619.47,270.18,103.26,361,35,"Posto de Gasolina",0.4 },
	{ 2581.01,362.42,108.88,361,35,"Posto de Gasolina",0.4 },
	{ 174.86,-1562.55,29.87,361,35,"Posto de Gasolina",0.4 },
	{ -319.25,-1470.23,30.5,361,35,"Posto de Gasolina",0.4 },
	{ 1786.08,3329.86,40.42,361,35,"Posto de Gasolina",0.4 },
	{ 48.92,2779.59,57.05,361,35,"Posto de Gasolina",0.4 },
	{ 264.98,2607.18,43.99,361,35,"Posto de Gasolina",0.4 },
	{ 1039.9,2671.05,39.53,361,35,"Posto de Gasolina",0.4 },
	{ 1208.52,2659.43,36.9,361,35,"Posto de Gasolina",0.4 },
	{ 2539.8,2594.81,36.96,361,35,"Posto de Gasolina",0.4 },
	{ 2006.21,3774.96,31.4,361,35,"Posto de Gasolina",0.4 },
	{ 1690.1,4927.81,41.23,361,35,"Posto de Gasolina",0.4 },
	{ 1701.73,6416.49,31.77,361,35,"Posto de Gasolina",0.4 },
	{ -91.29,6422.54,30.65,361,35,"Posto de Gasolina",0.4 },
	{ -1797.22,800.56,137.66,361,35,"Posto de Gasolina",0.4 },
	{ -1435.5,-284.68,45.41,361,35,"Posto de Gasolina",0.4 },
	{ -732.64,-939.32,18.22,361,35,"Posto de Gasolina",0.4 },
	{ -524.92,-1216.15,17.33,361,35,"Posto de Gasolina",0.4 },
	{ -69.45,-1758.01,28.55,361,35,"Posto de Gasolina",0.4 },
	{ 280.41,-973.16,29.42,106,31,"Bean Machine",0.5 },
	{ -320.41,-814.58,32.47,106,31,"Bean Machine",0.5 },
	{ -1278.21,-1126.43,6.91,106,31,"Bean Machine",0.5 },
	{ 469.06,-718.27,27.53,106,31,"Bean Machine",0.5 },
	{ -473.8,1114.42,320.23,106,31,"Bean Machine",0.5 },
	{ -851.51,-353.56,38.67,106,31,"Bean Machine",0.5 },
	{ -851.51,-353.56,38.67,106,31,"Bean Machine",0.5 },
	{ -686.61,322.19,83.09,106,31,"Bean Machine",0.5 },
	{ 918.69,50.33,80.9,617,62,"Cassino",0.6 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()

		SetCreateRandomCops(false)
		CancelCurrentPoliceReport()
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetPedInfiniteAmmoClip(PlayerPedId(),false)

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		for Number = 1,22 do
			if Number ~= 14 and Number ~= 16 then
				HideHudComponentThisFrame(Number)
			end
		end

		BlockWeaponWheelThisFrame()
		DisableControlAction(0,37,true)
		DisableControlAction(0,204,true)
		DisableControlAction(0,211,true)
		DisableControlAction(0,349,true)
		DisableControlAction(0,192,true)
		DisableControlAction(0,157,true)
		DisableControlAction(0,158,true)
		DisableControlAction(0,159,true)
		DisableControlAction(0,160,true)
		DisableControlAction(0,161,true)
		DisableControlAction(0,162,true)
		DisableControlAction(0,163,true)
		DisableControlAction(0,164,true)
		DisableControlAction(0,165,true)

		SetVehicleDensityMultiplierThisFrame(0.25)
		SetRandomVehicleDensityMultiplierThisFrame(0.25)
		SetParkedVehicleDensityMultiplierThisFrame(0.25)
		SetScenarioPedDensityMultiplierThisFrame(0.25,0.25)
		SetPedDensityMultiplierThisFrame(0.25)

		local Pid = PlayerId()
		local Ped = PlayerPedId()
		if IsPedArmed(Ped,6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		if IsPedUsingActionMode(Ped) then
			SetPedUsingActionMode(Ped,-1,-1,1)
		end

		if IsPedInAnyVehicle(Ped) then
			DisableControlAction(0,345,true)
		end

		SetPauseMenuActive(false)
		DisablePlayerVehicleRewards(Pid)
		SetPlayerLockonRangeOverride(Pid,0.0)

		SetWeatherTypeNow(GlobalState["Weather"])
		SetWeatherTypePersist(GlobalState["Weather"])
		SetWeatherTypeNowPersist(GlobalState["Weather"])

        if IsPlayerWantedLevelGreater(Pid,0) then
            ClearPlayerWantedLevel(Pid)
        end

		if LocalPlayer["state"]["Active"] then
			NetworkOverrideClockTime(GlobalState["Hours"],GlobalState["Minutes"],00)
		else
			NetworkOverrideClockTime(12,00,00)
		end

		Wait(0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	{ vec3(330.19,-601.21,43.29),vec3(343.65,-581.77,28.8) },
	{ vec3(343.65,-581.77,28.8),vec3(330.19,-601.21,43.29) },

	{ vec3(327.16,-603.53,43.29),vec3(338.97,-583.85,74.16) },
	{ vec3(338.97,-583.85,74.16),vec3(327.16,-603.53,43.29) },

	{ vec3(-741.07,5593.13,41.66),vec3(446.19,5568.79,781.19) },
	{ vec3(446.19,5568.79,781.19),vec3(-741.07,5593.13,41.66) },

	{ vec3(-740.78,5597.04,41.66),vec3(446.37,5575.02,781.19) },
	{ vec3(446.37,5575.02,781.19),vec3(-740.78,5597.04,41.66) },

	{ vec3(-71.05,-801.01,44.23),vec3(-75.0,-824.54,321.29) },
	{ vec3(-75.0,-824.54,321.29),vec3(-71.05,-801.01,44.23) },

	{ vec3(254.06,225.28,101.87),vec3(252.32,220.21,101.67) },
	{ vec3(252.32,220.21,101.67),vec3(254.06,225.28,101.87) },

	{ vec3(1016.89,31.96,70.45),vec3(964.78,58.69,112.56) },
	{ vec3(964.78,58.69,112.56),vec3(1016.89,31.96,70.45) }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)

			for Number = 1,#Teleport do
				if #(Coords - Teleport[Number][1]) <= 1 then
					TimeDistance = 1

					if IsControlJustPressed(1,38) then
						SetEntityCoords(Ped,Teleport[Number][2])
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALPHAS
-----------------------------------------------------------------------------------------------------------------------------------------
local Alphas = {
	{ vec3(-1227.49,4389.84,5.12),200,30,100.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number = 1,#Alphas do
		local Blip = AddBlipForRadius(Alphas[Number][1]["x"],Alphas[Number][1]["y"],Alphas[Number][1]["z"],Alphas[Number][4])
		SetBlipAlpha(Blip,Alphas[Number][2])
		SetBlipColour(Blip,Alphas[Number][3])
	end

	for Number = 1,#Blips do
		local Blip = AddBlipForCoord(Blips[Number][1],Blips[Number][2],Blips[Number][3])
		SetBlipSprite(Blip,Blips[Number][4])
		SetBlipDisplay(Blip,4)
		SetBlipAsShortRange(Blip,true)
		SetBlipColour(Blip,Blips[Number][5])
		SetBlipScale(Blip,Blips[Number][7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Blips[Number][6])
		EndTextCommandSetBlipName(Blip)
	end

	local Tables = {}

	for Number = 1,#Teleport do
		Tables[#Tables + 1] = { Teleport[Number][1],2.5,"E","Porta de Acesso","Pressione para acessar" }
	end

	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ISLAND
-----------------------------------------------------------------------------------------------------------------------------------------
local Island = {
	"h4_islandairstrip",
	"h4_islandairstrip_props",
	"h4_islandx_mansion",
	"h4_islandx_mansion_props",
	"h4_islandx_props",
	"h4_islandxdock",
	"h4_islandxdock_props",
	"h4_islandxdock_props_2",
	"h4_islandxtower",
	"h4_islandx_maindock",
	"h4_islandx_maindock_props",
	"h4_islandx_maindock_props_2",
	"h4_IslandX_Mansion_Vault",
	"h4_islandairstrip_propsb",
	"h4_beach",
	"h4_beach_props",
	"h4_beach_bar_props",
	"h4_islandx_barrack_props",
	"h4_islandx_checkpoint",
	"h4_islandx_checkpoint_props",
	"h4_islandx_Mansion_Office",
	"h4_islandx_Mansion_LockUp_01",
	"h4_islandx_Mansion_LockUp_02",
	"h4_islandx_Mansion_LockUp_03",
	"h4_islandairstrip_hangar_props",
	"h4_IslandX_Mansion_B",
	"h4_islandairstrip_doorsclosed",
	"h4_Underwater_Gate_Closed",
	"h4_mansion_gate_closed",
	"h4_aa_guns",
	"h4_IslandX_Mansion_GuardFence",
	"h4_IslandX_Mansion_Entrance_Fence",
	"h4_IslandX_Mansion_B_Side_Fence",
	"h4_IslandX_Mansion_Lights",
	"h4_islandxcanal_props",
	"h4_beach_props_party",
	"h4_islandX_Terrain_props_06_a",
	"h4_islandX_Terrain_props_06_b",
	"h4_islandX_Terrain_props_06_c",
	"h4_islandX_Terrain_props_05_a",
	"h4_islandX_Terrain_props_05_b",
	"h4_islandX_Terrain_props_05_c",
	"h4_islandX_Terrain_props_05_d",
	"h4_islandX_Terrain_props_05_e",
	"h4_islandX_Terrain_props_05_f",
	"h4_islandx_terrain_01",
	"h4_islandx_terrain_02",
	"h4_islandx_terrain_03",
	"h4_islandx_terrain_04",
	"h4_islandx_terrain_05",
	"h4_islandx_terrain_06",
	"h4_ne_ipl_00",
	"h4_ne_ipl_01",
	"h4_ne_ipl_02",
	"h4_ne_ipl_03",
	"h4_ne_ipl_04",
	"h4_ne_ipl_05",
	"h4_ne_ipl_06",
	"h4_ne_ipl_07",
	"h4_ne_ipl_08",
	"h4_ne_ipl_09",
	"h4_nw_ipl_00",
	"h4_nw_ipl_01",
	"h4_nw_ipl_02",
	"h4_nw_ipl_03",
	"h4_nw_ipl_04",
	"h4_nw_ipl_05",
	"h4_nw_ipl_06",
	"h4_nw_ipl_07",
	"h4_nw_ipl_08",
	"h4_nw_ipl_09",
	"h4_se_ipl_00",
	"h4_se_ipl_01",
	"h4_se_ipl_02",
	"h4_se_ipl_03",
	"h4_se_ipl_04",
	"h4_se_ipl_05",
	"h4_se_ipl_06",
	"h4_se_ipl_07",
	"h4_se_ipl_08",
	"h4_se_ipl_09",
	"h4_sw_ipl_00",
	"h4_sw_ipl_01",
	"h4_sw_ipl_02",
	"h4_sw_ipl_03",
	"h4_sw_ipl_04",
	"h4_sw_ipl_05",
	"h4_sw_ipl_06",
	"h4_sw_ipl_07",
	"h4_sw_ipl_08",
	"h4_sw_ipl_09",
	"h4_islandx_mansion",
	"h4_islandxtower_veg",
	"h4_islandx_sea_mines",
	"h4_islandx",
	"h4_islandx_barrack_hatch",
	"h4_islandxdock_water_hatch",
	"h4_beach_party"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAYO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local CayoPerico = false

	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if #(Coords - vec3(4840.57,-5174.42,2.0)) <= 2000 then
			if not CayoPerico then
				for _,v in pairs(Island) do
					RequestIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",true)
				SetAiGlobalPathNodesType(1)
				SetDeepOceanScaler(0.0)
				LoadGlobalWaterType(1)
				CayoPerico = true
			end
		else
			if CayoPerico then
				for _,v in pairs(Island) do
					RemoveIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",false)
				SetAiGlobalPathNodesType(0)
				SetDeepOceanScaler(1.0)
				LoadGlobalWaterType(0)
				CayoPerico = false
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADRAPPEL
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if IsPedInAnyHeli(Ped) then
			TimeDistance = 1

			local Vehicle = GetVehiclePedIsUsing(Ped)
			if IsControlJustPressed(1,154) and not IsAnyPedRappellingFromHeli(Vehicle) and (GetPedInVehicleSeat(Vehicle,1) == Ped or GetPedInVehicleSeat(Vehicle,2) == Ped) then
				TaskRappelFromHeli(Ped,1)
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local InfoList = {
	{
		["Props"] = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		["Coords"] = vec3(-1150.70,-1520.70,10.60)
	},{
		["Props"] = {
			"csr_beforeMission",
			"csr_inMission"
		},
		["Coords"] = vec3(-47.10,-1115.30,26.50)
	},{
		["Props"] = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		["Coords"] = vec3(-802.30,175.00,72.80)
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(InfoList) do
		local Interior = GetInteriorAtCoords(v["Coords"])
		LoadInterior(Interior)

		if v["Props"] then
			for _,i in pairs(v["Props"]) do
				EnableInteriorProp(Interior,i)
			end
		end

		RefreshInterior(Interior)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for _,Entity in pairs(GetGamePool("CPed")) do
			if (NetworkGetEntityOwner(Entity) == -1 or NetworkGetEntityOwner(Entity) == PlayerId()) and GetPedArmour(Entity) <= 0 and not NetworkGetEntityIsNetworked(Entity) then
				if IsPedInAnyVehicle(Entity) then
					local Vehicle = GetVehiclePedIsUsing(Entity)
					if NetworkGetEntityIsNetworked(Vehicle) then
						TriggerServerEvent("garages:Delete",NetworkGetNetworkIdFromEntity(Vehicle),GetVehicleNumberPlateText(Vehicle))
					else
						DeleteEntity(Vehicle)
					end
				else
					DeleteEntity(Entity)
				end
			end
		end

		for _,Vehicle in pairs(GetGamePool("CVehicle")) do
			if (NetworkGetEntityOwner(Vehicle) == -1 or NetworkGetEntityOwner(Vehicle) == PlayerId()) and not NetworkGetEntityIsNetworked(Vehicle) and GetVehicleNumberPlateText(Vehicle) ~= "PDMSPORT" then
				DeleteEntity(Vehicle)
			end
		end

		Wait(5000)
	end
end)