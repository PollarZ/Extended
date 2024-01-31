-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("warehouse")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {}
local Warehouse = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["1"] = vec3(-73.22,-1196.77,28.04),
	["2"] = vec3(-78.68,-1204.43,27.97),
	["3"] = vec3(-67.0,-1199.19,28.13),
	["4"] = vec3(-71.27,-1206.54,28.19),
	["5"] = vec3(-61.39,-1204.81,28.49),
	["6"] = vec3(-65.98,-1211.89,28.68),
	["7"] = vec3(-56.07,-1210.14,28.91),
	["8"] = vec3(-52.67,-1216.35,29.05),
	["9"] = vec3(-56.33,-1229.24,29.14),
	["10"] = vec3(-66.91,-1226.51,29.21),
	["11"] = vec3(-60.68,-1233.92,29.39),
	["12"] = vec3(-72.63,-1233.64,29.26),
	["13"] = vec3(-65.89,-1239.52,29.41),
	["14"] = vec3(-73.68,-1243.3,29.41),
	["15"] = vec3(-44.24,-1235.62,29.56),
	["16"] = vec3(-44.24,-1241.99,29.66),
	["17"] = vec3(-44.24,-1252.43,29.5),
	["18"] = vec3(-173.66,-1266.16,33.03),
	["19"] = vec3(-193.95,-1284.36,31.78),
	["20"] = vec3(-193.95,-1290.25,31.67),
	["21"] = vec3(-151.93,-1302.82,31.73),
	["22"] = vec3(903.21,3585.91,33.69),
	["23"] = vec3(914.43,3562.7,34.03),
	["24"] = vec3(914.41,3567.32,34.07),
	["25"] = vec3(433.65,3572.82,33.56),
	["26"] = vec3(379.73,3583.41,33.63),
	["27"] = vec3(185.8,2786.48,46.36),
	["28"] = vec3(641.81,2791.68,42.41),
	["29"] = vec3(619.13,2784.21,43.8),
	["30"] = vec3(588.43,2782.03,43.8),
	["31"] = vec3(583.3,2781.66,43.8),
	["32"] = vec3(1695.75,6431.22,33.05),
	["33"] = vec3(178.55,6391.83,32.03),
	["34"] = vec3(175.07,6398.44,32.19),
	["35"] = vec3(147.24,6366.87,31.98),
	["36"] = vec3(108.69,6326.42,31.79),
	["37"] = vec3(96.68,6329.3,31.88),
	["38"] = vec3(93.78,6335.18,31.87),
	["39"] = vec3(-246.44,6068.8,32.73),
	["40"] = vec3(-161.67,6189.07,31.71),
	["41"] = vec3(44.29,6304.33,31.63),
	["42"] = vec3(-353.83,6066.04,31.66),
	["43"] = vec3(-273.71,6147.9,31.59),
	["44"] = vec3(-214.8,6250.35,31.61),
	["45"] = vec3(-218.83,6246.34,31.69),
	["46"] = vec3(-236.9,6228.29,31.65),
	["47"] = vec3(-192.36,6266.37,31.73),
	["48"] = vec3(-199.14,6260.43,31.75),
	["49"] = vec3(-51.77,6395.36,31.75),
	["50"] = vec3(31.03,6448.01,31.62),
	["51"] = vec3(37.67,6454.65,31.61),
	["52"] = vec3(44.26,6461.24,31.71),
	["53"] = vec3(55.45,6472.43,31.62),
	["54"] = vec3(57.01,6479.79,31.7),
	["55"] = vec3(5.05,6465.64,31.53),
	["56"] = vec3(-5.57,6490.69,31.58),
	["57"] = vec3(-26.73,6461.94,31.67),
	["58"] = vec3(-42.3,6417.63,31.72),
	["59"] = vec3(-35.58,6424.36,31.64),
	["60"] = vec3(-58.68,6502.11,31.57),
	["61"] = vec3(-84.6,6498.26,31.7),
	["62"] = vec3(-92.22,6469.76,31.7),
	["63"] = vec3(-437.56,6148.08,31.72),
	["64"] = vec3(-427.96,6161.7,31.74),
	["65"] = vec3(-1128.43,2691.44,18.89),
	["66"] = vec3(2704.04,3457.89,55.79),
	["67"] = vec3(2695.52,3461.45,56.43),
	["68"] = vec3(2685.94,3465.45,56.41),
	["69"] = vec3(2682.54,3507.37,53.54),
	["70"] = vec3(637.2,250.84,103.39),
	["71"] = vec3(639.39,254.62,103.4),
	["72"] = vec3(335.73,360.64,106.9),
	["73"] = vec3(323.26,363.72,105.57),
	["74"] = vec3(307.28,359.58,105.59),
	["75"] = vec3(299.97,361.35,105.7),
	["76"] = vec3(231.04,381.6,106.59),
	["77"] = vec3(237.12,379.49,106.39),
	["78"] = vec3(252.33,373.93,105.57),
	["79"] = vec3(168.82,307.92,112.53),
	["80"] = vec3(177.87,309.07,105.38),
	["81"] = vec3(197.6,306.66,105.64),
	["82"] = vec3(287.82,310.74,105.84),
	["83"] = vec3(353.13,329.49,104.33),
	["84"] = vec3(356.56,328.55,104.19),
	["85"] = vec3(141.91,-379.83,43.84),
	["86"] = vec3(74.58,-351.57,42.99),
	["87"] = vec3(1.5,-437.17,40.11),
	["88"] = vec3(-413.83,-2699.82,6.57),
	["89"] = vec3(-416.75,-2762.84,6.58),
	["90"] = vec3(-457.2,-2753.8,6.59),
	["91"] = vec3(-214.18,-2536.38,6.59),
	["92"] = vec3(-219.99,-2456.81,6.62),
	["93"] = vec3(-164.98,-2464.98,6.64),
	["94"] = vec3(-34.77,-2553.1,6.66),
	["95"] = vec3(-20.18,-2640.26,6.66),
	["96"] = vec3(42.44,-2633.32,6.65),
	["97"] = vec3(-174.4,-2581.27,6.58),
	["98"] = vec3(262.95,-2506.91,6.93),
	["99"] = vec3(348.74,-2651.6,6.72),
	["100"] = vec3(528.85,-2731.95,6.67),
	["101"] = vec3(567.81,-2754.45,6.69),
	["102"] = vec3(1685.74,-1680.03,113.15),
	["103"] = vec3(684.65,-2742.02,6.64),
	["104"] = vec3(806.16,-3183.39,6.53),
	["105"] = vec3(917.5,-3240.26,6.53),
	["106"] = vec3(485.4,-3383.96,6.68),
	["107"] = vec3(467.5,-3205.72,6.68),
	["108"] = vec3(467.5,-3205.72,10.0),
	["109"] = vec3(503.68,-3120.88,10.0),
	["110"] = vec3(503.69,-3120.88,6.67),
	["111"] = vec3(630.18,-2999.04,6.5),
	["112"] = vec3(163.09,-3337.07,6.57),
	["113"] = vec3(283.25,-2859.33,6.53),
	["114"] = vec3(236.03,-3111.69,6.38),
	["115"] = vec3(305.5,-3121.48,6.42),
	["116"] = vec3(268.82,-3248.59,6.41),
	["117"] = vec3(557.01,-2328.27,6.44),
	["118"] = vec3(-1962.75,-3032.8,14.55),
	["119"] = vec3(-1922.68,-2963.08,14.53),
	["120"] = vec3(-861.34,-2708.52,14.42),
	["121"] = vec3(-808.74,-2756.78,14.61),
	["122"] = vec3(-1875.77,-2983.21,14.59),
	["123"] = vec3(-1093.63,-2403.03,14.6),
	["124"] = vec3(-630.11,-2350.43,14.44),
	["125"] = vec3(-775.44,-2632.05,14.58),
	["126"] = vec3(-729.89,-2535.11,14.43),
	["127"] = vec3(-1108.7,-3431.62,14.55),
	["128"] = vec3(-1154.63,-3530.73,14.42),
	["129"] = vec3(-1697.0,-3180.83,14.56),
	["130"] = vec3(-1549.99,-3268.85,14.53),
	["131"] = vec3(-1499.72,-3286.45,14.53),
	["132"] = vec3(-1450.06,-3272.06,14.54),
	["133"] = vec3(-1442.42,-3305.0,14.54),
	["134"] = vec3(-1412.51,-3346.55,14.56),
	["135"] = vec3(-1380.5,-3379.12,14.56),
	["136"] = vec3(-939.68,159.23,66.63),
	["137"] = vec3(-976.17,389.33,75.36),
	["138"] = vec3(-471.24,-864.37,24.34),
	["139"] = vec3(-514.4,-1019.39,24.07),
	["140"] = vec3(-513.99,-1039.1,23.86),
	["141"] = vec3(-509.12,-1001.62,24.05),
	["142"] = vec3(-580.04,-1589.49,27.38),
	["143"] = vec3(-653.0,-1753.2,25.29),
	["144"] = vec3(-657.99,-1705.43,25.48),
	["145"] = vec3(903.84,-1576.77,31.43),
	["146"] = vec3(984.02,-1531.26,31.44),
	["147"] = vec3(1074.79,-2450.86,29.71),
	["148"] = vec3(1116.72,-2383.28,31.33),
	["149"] = vec3(967.28,-2251.47,31.15),
	["150"] = vec3(801.15,-2116.89,29.98),
	["151"] = vec3(729.07,-1974.09,29.89),
	["152"] = vec3(966.14,-1933.5,31.68),
	["153"] = vec3(1062.33,-1847.75,37.9),
	["154"] = vec3(1236.69,-1928.55,39.11),
	["155"] = vec3(1138.61,-2046.21,31.63),
	["156"] = vec3(1141.22,-2141.71,31.58),
	["157"] = vec3(1171.8,-2267.07,31.07),
	["158"] = vec3(742.69,1312.89,360.49),
	["159"] = vec3(-380.65,405.09,110.72),
	["160"] = vec3(-841.95,5400.91,35.19),
	["161"] = vec3(-468.03,5357.32,81.38),
	["162"] = vec3(-489.7,5326.92,81.06),
	["163"] = vec3(-567.08,5252.97,71.08),
	["164"] = vec3(35.79,6548.94,32.07),
	["165"] = vec3(121.81,6405.49,31.88),
	["166"] = vec3(2832.87,4572.18,47.19),
	["167"] = vec3(2916.63,4367.83,51.02),
	["168"] = vec3(304.9,2820.58,43.87),
	["169"] = vec3(597.52,2928.63,41.46),
	["170"] = vec3(2669.93,1612.75,24.97),
	["171"] = vec3(2669.93,1600.67,25.0),
	["172"] = vec3(2748.39,1454.11,25.1),
	["173"] = vec3(2601.11,2804.73,34.34),
	["174"] = vec3(2569.17,2720.66,43.53),
	["175"] = vec3(2663.63,2890.95,37.47),
	["176"] = vec3(2832.87,2800.02,58.0),
	["177"] = vec3(2746.34,2787.67,36.02),
	["178"] = vec3(2707.58,2776.49,38.36),
	["179"] = vec3(-229.36,-1117.95,23.61),
	["180"] = vec3(-169.18,-1026.67,27.85),
	["181"] = vec3(-96.98,-1013.21,27.88),
	["182"] = vec3(23.38,-619.61,35.58),
	["183"] = vec3(23.4,-619.59,32.2),
	["184"] = vec3(491.34,-507.02,28.76),
	["185"] = vec3(491.33,-507.01,25.38),
	["186"] = vec3(569.99,-401.86,25.29),
	["187"] = vec3(511.52,-1074.93,29.3),
	["188"] = vec3(510.59,-1013.78,28.5),
	["189"] = vec3(704.66,-1545.38,10.2),
	["190"] = vec3(690.09,-1555.92,10.36),
	["191"] = vec3(971.05,-1143.69,25.78),
	["192"] = vec3(940.96,-1171.46,26.45),
	["193"] = vec3(-1283.27,-3341.79,14.59),
	["194"] = vec3(-1299.9,-3408.15,14.6),
	["195"] = vec3(-1747.4,-2790.21,14.55),
	["196"] = vec3(-1754.3,-2799.47,14.54),
	["197"] = vec3(-1767.52,-2822.36,14.55),
	["198"] = vec3(-964.72,-2834.69,14.49),
	["199"] = vec3(-1244.82,-2098.7,14.55),
	["200"] = vec3(-304.05,-1179.79,23.97),
	["201"] = vec3(-350.34,-1570.06,25.88),
	["202"] = vec3(-355.15,-1513.05,28.36),
	["203"] = vec3(597.32,-1880.25,25.65),
	["204"] = vec3(535.84,-1868.45,25.98),
	["205"] = vec3(427.67,-1965.33,23.96),
	["206"] = vec3(849.03,2383.96,54.77),
	["207"] = vec3(823.96,2365.27,52.88),
	["208"] = vec3(1218.15,2398.52,66.68),
	["209"] = vec3(1128.63,2125.25,56.13),
	["210"] = vec3(-2015.75,559.15,108.96),
	["211"] = vec3(2473.83,1571.75,33.37),
	["212"] = vec3(1431.7,-1682.75,65.2),
	["213"] = vec3(1430.15,-2317.23,67.51),
	["214"] = vec3(1620.63,-2259.33,107.1),
	["215"] = vec3(1623.14,-2363.44,93.83),
	["216"] = vec3(1499.53,-2518.84,56.44),
	["217"] = vec3(1348.33,-2134.05,55.6),
	["218"] = vec3(1890.12,-1019.19,79.06),
	["219"] = vec3(1577.64,-1685.8,88.79),
	["220"] = vec3(1622.56,-1879.28,104.96),
	["221"] = vec3(1515.62,-2137.04,77.27),
	["222"] = vec3(1519.15,-1752.31,79.29),
	["223"] = vec3(-1717.95,2954.65,33.44),
	["224"] = vec3(-1735.11,2962.85,33.44),
	["225"] = vec3(-1776.78,2973.94,33.44),
	["226"] = vec3(-2385.41,3298.9,33.56),
	["227"] = vec3(-2389.6,3286.8,33.6),
	["228"] = vec3(-2173.06,3256.12,33.46),
	["229"] = vec3(-2007.05,3407.1,31.9)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Blips")
AddEventHandler("propertys:Blips",function()
	if json.encode(Blips) ~= "[]" then
		for _,v in pairs(Blips) do
			if DoesBlipExist(v) then
				RemoveBlip(v)
			end
		end

		Blips = {}
	else
		for Name,v in pairs(List) do
			Blips[Name] = AddBlipForCoord(v["x"],v["y"],v["z"])
			SetBlipSprite(Blips[Name],50)
			SetBlipAsShortRange(Blips[Name],true)
			SetBlipColour(Blips[Name],GlobalState["Warehouses"][Name] and 35 or 43)
			SetBlipScale(Blips[Name],0.4)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Index,v in pairs(List) do
		exports["target"]:AddCircleZone("Warehouse:"..Index,v,1.0,{
			name = "Warehouse:"..Index,
			heading = 0.0,
			useZ = true
		},{
			shop = Index,
			Distance = 1.5,
			options = {
				{
					event = "warehouse:Open",
					label = "Abrir",
					tunnel = "shop"
				},{
					event = "warehouse:Password",
					label = "Trocar Senha",
					tunnel = "server"
				},{
					event = "warehouse:Transfer",
					label = "Transferir",
					tunnel = "server"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("warehouse:Open",function(Number)
	if not exports["hud"]:Wanted() and vSERVER.Warehouse(Number) then
		Warehouse = Number
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "Open" })
		TriggerEvent("sounds:Private","chest",0.35)
		vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ action = "Close" })
	SetNuiFocus(false,false)
	Warehouse = ""
	vRP.Destroy()

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"],Warehouse)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"],Warehouse)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"],Warehouse)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local Inventory,Warehouse,invPeso,invMaxpeso,warehousePeso,warehouseMaxpeso = vSERVER.Request(Warehouse)
	if Inventory then
		Callback({ myInventory = Inventory, myWarehouse = Warehouse, invPeso = invPeso, invMaxpeso = invMaxpeso, warehousePeso = warehousePeso, warehouseMaxpeso = warehouseMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("warehouse:Update")
AddEventHandler("warehouse:Update",function()
	SendNUIMessage({ action = "Request" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:WEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("warehouse:Weight")
AddEventHandler("warehouse:Weight",function(invPeso,invMaxpeso,warehousePeso,warehouseMaxpeso)
	SendNUIMessage({ action = "updateWeight", invPeso = invPeso, invMaxpeso = invMaxpeso, warehousePeso = warehousePeso, warehouseMaxpeso = warehouseMaxpeso })
end)