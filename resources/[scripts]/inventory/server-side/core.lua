-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("inventory",Creative)
vPLAYER = Tunnel.getInterface("player")
vGARAGE = Tunnel.getInterface("garages")
vCLIENT = Tunnel.getInterface("inventory")
vKEYBOARD = Tunnel.getInterface("keyboard")
vPARAMEDIC = Tunnel.getInterface("paramedic")
vSURVIVAL = Tunnel.getInterface("survival")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Drugs = {}
Drops = {}
Carry = {}
Ammos = {}
Active = {}
Trashs = {}
Armors = {}
Plates = {}
Trunks = {}
Healths = {}
Attachs = {}
Lootsfy = {}
Property = {}
Trashsfy = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {},
	["Luck"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Objects = {
	-- ["3"] = { x = 552.54, y = -198.45, z = 53.75, h = 89.32, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["4"] = { x = 339.75, y = -580.95, z = 73.42, h = 67.19, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["5"] = { x = 696.12, y = -965.69, z = 23.26, h = 271.33, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["6"] = { x = -2235.42, y = 363.52, z = 173.91, h = 23.73, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["7"] = { x = 1382.1, y = -2081.97, z = 51.25, h = 220.16, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["8"] = { x = 589.32, y = -2802.73, z = 5.32, h = 328.01, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["9"] = { x = -453.19, y = -2810.47, z = 6.56, h = 225.82, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["10"] = { x = -1007.18, y = -2836.12, z = 13.20, h = 149.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["11"] = { x = -2018.21, y = -361.03, z = 47.36, h = 324.55, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["12"] = { x = -1727.77, y = 250.26, z = 61.65, h = 24.7, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["13"] = { x = -1089.6, y = 2717.05, z = 18.33, h = 40.52, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["14"] = { x = 321.27, y = 2874.98, z = 42.71, h = 27.62, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["15"] = { x = 1163.47, y = 2722.09, z = 37.26, h = 179.11, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["16"] = { x = 1745.86, y = 3326.69, z = 40.30, h = 115.55, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["17"] = { x = 2013.4, y = 3934.36, z = 31.65, h = 236.38, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["18"] = { x = 2526.3, y = 4191.6, z = 44.53, h = 236.44, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["19"] = { x = 2874.05, y = 4861.57, z = 61.35, h = 87.57, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["20"] = { x = 1985.16, y = 6200.39, z = 41.33, h = 330.21, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["21"] = { x = 1552.97, y = 6610.24, z = 2.12, h = 145.64, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["22"] = { x = -298.32, y = 6392.66, z = 29.87, h = 302.99, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["23"] = { x = -813.88, y = 5384.45, z = 33.77, h = 356.87, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["24"] = { x = -1606.5, y = 5259.26, z = 1.35, h = 114.45, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["25"] = { x = -199.22, y = 3638.8, z = 63.70, h = 39.84, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["26"] = { x = -1487.45, y = 2688.99, z = 2.94, h = 317.89, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["27"] = { x = -3266.12, y = 1139.82, z = 1.91, h = 249.17, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["28"] = { x = 170.71, y = -1070.94, z = 28.5, h = 339.6, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["29"] = { x = 487.23, y = -1093.93, z = 28.71, h = 0.74, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["30"] = { x = 584.63, y = -1419.69, z = 18.52, h = 180.41, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["31"] = { x = 694.07, y = -1453.5, z = 19.03, h = 0.45, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["32"] = { x = 892.49, y = -2490.3, z = 28.88, h = 175.48, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["33"] = { x = 1463.09, y = -2613.91, z = 48.17, h = 76.65, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["34"] = { x = 1877.42, y = -1065.71, z = 80.22, h = 97.79, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["35"] = { x = 2557.67, y = -598.5, z = 64.23, h = 12.71, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["36"] = { x = 2546.8, y = 395.31, z = 107.92, h = 268.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["37"] = { x = 2074.59, y = 1403.29, z = 74.88, h = 300.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["38"] = { x = 2405.44, y = 2903.85, z = 39.67, h = 217.41, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["39"] = { x = 2895.84, y = 3735.4, z = 43.5, h = 289.37, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["40"] = { x = 1677.25, y = 4882.36, z = 46.62, h = 59.7, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["41"] = { x = -437.08, y = 6339.84, z = 12.06, h = 216.59, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["42"] = { x = 431.15, y = 6472.57, z = 28.08, h = 140.5, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["43"] = { x = -2303.74, y = 3389.16, z = 30.56, h = 324.26, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["44"] = { x = -2096.92, y = 3258.17, z = 32.12, h = 239.97, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["45"] = { x = -1773.55, y = 2995.46, z = 32.11, h = 330.02, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["46"] = { x = -2086.61, y = 2816.89, z = 32.27, h = 354.52, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["47"] = { x = -1511.83, y = 1520.27, z = 114.59, h = 255.31, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },

	["48"] = { x = 574.01, y = 132.56, z = 98.48, h = 70.99, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["49"] = { x = 344.79, y = 929.2, z = 202.44, h = 268.09, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["50"] = { x = -123.8, y = 1896.67, z = 196.34, h = 358.95, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["51"] = { x = -1099.85, y = 2703.51, z = 21.99, h = 221.35, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["52"] = { x = -2198.91, y = 4243.21, z = 46.92, h = 128.84, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["53"] = { x = -1487.02, y = 4983.14, z = 62.67, h = 174.11, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["54"] = { x = 1346.49, y = 6396.73, z = 32.42, h = 90.94, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["55"] = { x = 2535.72, y = 4661.39, z = 33.08, h = 316.4, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["56"] = { x = 1155.62, y = -1334.48, z = 33.72, h = 174.97, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["57"] = { x = 1116.06, y = -2498.07, z = 32.37, h = 193.39, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["58"] = { x = 261.06, y = -3135.82, z = 4.8, h = 88.83, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["59"] = { x = -1619.81, y = -1035.0, z = 12.16, h = 50.84, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["60"] = { x = -3420.87, y = 977.0, z = 10.91, h = 226.29, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["61"] = { x = -1909.53, y = 4624.93, z = 56.07, h = 135.57, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["62"] = { x = 894.51, y = 3211.45, z = 38.09, h = 273.04, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["63"] = { x = 1791.71, y = 4602.84, z = 36.69, h = 185.86, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["64"] = { x = 464.8, y = 6462.03, z = 28.76, h = 334.71, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["65"] = { x = 63.22, y = 6323.67, z = 37.87, h = 301.22, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["66"] = { x = -736.64, y = 5594.98, z = 40.66, h = 268.78, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["67"] = { x = 720.76, y = 2330.87, z = 50.76, h = 179.99, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["68"] = { x = 1909.47, y = 611.47, z = 177.41, h = 65.57, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["69"] = { x = 1796.6, y = -1350.06, z = 98.75, h = 61.5, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["70"] = { x = 955.32, y = -3101.26, z = 4.91, h = 266.38, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["71"] = { x = -1306.41, y = -3387.9, z = 12.95, h = 59.92, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["72"] = { x = -1219.66, y = -2079.82, z = 13.16, h = 351.04, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["73"] = { x = -1203.53, y = -1804.25, z = 2.91, h = 245.4, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["74"] = { x = -720.47, y = -399.49, z = 33.9, h = 351.27, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["75"] = { x = -503.39, y = -1438.17, z = 13.16, h = 346.71, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["76"] = { x = 1398.24, y = 2117.57, z = 104.02, h = 131.36, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["77"] = { x = -1811.62, y = 3104.09, z = 31.85, h = 60.36, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["78"] = { x = -1812.86, y = 3101.95, z = 31.85, h = 62.1, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["79"] = { x = -1850.29, y = 3156.66, z = 31.82, h = 150.22, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["80"] = { x = -2052.86, y = 3173.31, z = 31.82, h = 240.03, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["81"] = { x = -2409.94, y = 3355.95, z = 31.83, h = 61.29, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["82"] = { x = -2450.39, y = 2946.63, z = 31.97, h = 330.0, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },

	["83"] = { x = -257.5, y = -966.54, z = 30.22, h = 26.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["84"] = { x = -2682.86, y = 2304.87, z = 20.85, h = 164.19, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["85"] = { x = -1282.33, y = 2559.98, z = 17.4, h = 148.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["86"] = { x = 159.65, y = 3118.8, z = 42.44, h = 16.37, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["87"] = { x = 1061.43, y = 3527.62, z = 33.15, h = 255.93, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["88"] = { x = 2370.22, y = 3156.55, z = 47.21, h = 221.77, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["89"] = { x = 2520.51, y = 2637.83, z = 36.95, h = 314.33, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["90"] = { x = 2572.37, y = 477.44, z = 107.68, h = 269.49, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["91"] = { x = 1223.15, y = -1079.56, z = 37.53, h = 123.38, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["92"] = { x = 1048.49, y = -247.53, z = 68.66, h = 149.33, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["93"] = { x = 499.41, y = -529.38, z = 23.76, h = 262.13, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["94"] = { x = 592.53, y = -2115.87, z = 4.76, h = 100.96, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["95"] = { x = 523.43, y = -2578.67, z = 13.82, h = 318.38, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["96"] = { x = -2.98, y = -1299.67, z = 28.28, h = 359.37, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["97"] = { x = 183.11, y = -1086.93, z = 28.28, h = 348.57, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["98"] = { x = 713.88, y = -850.95, z = 23.3, h = 271.63, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["99"] = { x = -2438.82, y = 2999.82, z = 32.07, h = 194.35, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["100"] = { x = -2440.04, y = 2999.46, z = 32.07, h = 194.41, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["101"] = { x = -2092.59, y = 3113.14, z = 31.82, h = 240.25, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["102"] = { x = -1824.95, y = 3016.0, z = 31.82, h = 329.62, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["103"] = { x = -202.03, y = 3651.99, z = 50.74, h = 192.39, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["104"] = { x = -203.41, y = 3651.71, z = 50.74, h = 192.96, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["105"] = { x = 2007.81, y = 4964.86, z = 40.71, h = 158.28, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["106"] = { x = 1904.26, y = 4930.73, z = 47.97, h = 156.61, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["107"] = { x = 1702.14, y = 4819.3, z = 40.96, h = 97.05, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["108"] = { x = 2030.66, y = 4727.43, z = 40.61, h = 294.35, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["109"] = { x = 2122.12, y = 4784.69, z = 39.98, h = 116.71, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["110"] = { x = 2177.23, y = 2169.39, z = 116.31, h = 229.64, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["111"] = { x = 2395.2, y = 2032.72, z = 90.35, h = 318.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["112"] = { x = 2619.31, y = 1691.36, z = 26.6, h = 270.01, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["113"] = { x = 1454.52, y = -1680.69, z = 65.03, h = 25.31, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["114"] = { x = 1453.05, y = -1681.37, z = 64.96, h = 24.93, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["115"] = { x = 240.42, y = -1864.8, z = 25.82, h = 49.31, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["116"] = { x = -139.01, y = -1995.56, z = 21.81, h = 181.56, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["117"] = { x = -343.54, y = -1333.09, z = 36.31, h = 89.4, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["118"] = { x = -350.99, y = -1333.15, z = 36.31, h = 269.98, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["119"] = { x = -346.45, y = -1337.38, z = 36.31, h = 359.9, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["120"] = { x = -267.45, y = -971.56, z = 30.22, h = 25.86, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["121"] = { x = 594.59, y = 146.52, z = 97.30, h = 70.04, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["122"] = { x = 660.44, y = 268.29, z = 102.04, h = 152.09, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },

	-- ROBBERY CLOTHESHOP
	["123"] = { x = 70.27, y = -1389.11, z = 29.13, h = 90.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["124"] = { x = -706.01, y = -150.49, z = 37.17, h = 28.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["125"] = { x = -167.66, y = -301.67, z = 39.49, h = 161.34, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["126"] = { x = -821.69, y = -1067.22, z = 11.08, h = 31.23, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["127"] = { x = -1186.62, y = -772.55, z = 17.09, h = 215.93, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["128"] = { x = -1446.85, y = -240.38, z = 49.57, h = 316.88, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["129"] = { x = 5.53, y = 6506.07, z = 31.63, h = 222.68, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["130"] = { x = 1699.51, y = 4819.72, z = 41.82, h = 277.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["131"] = { x = 117.83, y = -223.56, z = 54.31, h = 70.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["132"] = { x = 621.58, y = 2765.81, z = 41.84, h = 275.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["133"] = { x = 1200.46, y = 2715.37, z = 37.98, h = 0.24, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["134"] = { x = -3178.48, y = 1044.46, z = 20.62, h = 66.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["135"] = { x = -1102.05, y = 2716.93, z = 18.86, h = 40.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["136"] = { x = 430.72, y = -810.01, z = 29.25, h = 270.35, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY WEAPONSSHOP
	["137"] = { x = 1688.78, y = 3759.13, z = 34.46, h = 47.5, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["138"] = { x = 256.35, y = -47.51, z = 69.7, h = 249.76, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["139"] = { x = 846.13, y = -1036.62, z = 27.95, h = 178.74, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["140"] = { x = -335.18, y = 6083.29, z = 31.21, h = 45.57, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["141"] = { x = -665.98, y = -932.24, z = 21.58, h = 358.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["142"] = { x = -1301.93, y = -391.36, z = 36.45, h = 255.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["143"] = { x = -1122.59, y = 2698.25, z = 18.31, h = 42.82, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["144"] = { x = 2571.67, y = 291.28, z = 108.49, h = 180.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["145"] = { x = 2571.66, y = 291.29, z = 108.49, h = 181.06, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["146"] = { x = 19.57, y = -1103.0, z = 29.55, h = 339.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["147"] = { x = 813.92, y = -2160.34, z = 29.37, h = 179.33, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY BARBERSHOP
	["148"] = { x = -807.9, y = -180.83, z = 37.32, h = 299.3, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["149"] = { x = 139.56, y = -1704.12, z = 29.05, h = 320.25, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["150"] = { x = -1278.11, y = -1116.66, z = 6.75, h = 270.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["151"] = { x = 1928.89, y = 3734.04, z = 32.6, h = 29.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["152"] = { x = 1217.05, y = -473.45, z = 65.96, h = 255.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["153"] = { x = -34.08, y = -157.01, z = 56.83, h = 159.63, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["154"] = { x = -274.5, y = 6225.27, z = 31.45, h = 225.27, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY TATTOOSHOP
	["155"] = { x = 1327.98, y = -1654.78, z = 52.03, h = 218.71, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["156"] = { x = -1149.04, y = -1428.64, z = 4.71, h = 215.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["157"] = { x = 322.01, y = 186.24, z = 103.34, h = 339.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["158"] = { x = -3175.64, y = 1075.54, z = 20.58, h = 65.96, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["159"] = { x = 1866.01, y = 3748.07, z = 32.79, h = 299.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["160"] = { x = -295.51, y = 6199.21, z = 31.24, h = 133.05, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- OTHER OBJECTS
	["9998"] = { x = -584.12, y = -1062.95, z = 22.38, h = 33.14, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 },
	["9999"] = { x = -1188.9, y = -897.82, z = 13.95, h = 130.04, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
Products = {
	["foodjuice"] = {
		{ ["timer"] = 10, ["item"] = "foodjuice", ["itemAmount"] = 1 }
	},
	["foodburger"] = {
		{ ["timer"] = 10, ["item"] = "foodburger", ["itemAmount"] = 1 }
	},
	["foodbox"] = {
		{ ["timer"] = 10, ["need"] = {
			{ ["item"] = "foodburger", ["amount"] = 1 },
			{ ["item"] = "foodjuice", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "foodbox", ["itemAmount"] = 1 }
	},
	["cemitery"] = {
		{ ["timer"] = 10, ["item"] = "dollars2", ["itemAmount"] = 150 }
	},
	["emptybottle"] = {
		{ ["timer"] = 2, ["need"] = "emptybottle", ["needAmount"] = 1, ["item"] = "water", ["itemAmount"] = 1 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
StealPeds = {
	{ ["Item"] = "dollars2", ["Min"] = 150, ["Max"] = 225 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALITENS
-----------------------------------------------------------------------------------------------------------------------------------------
StealItens = {
	{ ["Item"] = "dollars2", ["Min"] = 150, ["Max"] = 225 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOTS
-----------------------------------------------------------------------------------------------------------------------------------------
Loots = {
	["Medic"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "alcohol", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "codeine", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "amphetamine", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "acetone", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "saline", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sulfuric", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "syringe", ["min"] = 2, ["max"] = 4 }
		}
	},
	["Weapons"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "roadsigns", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "techtrash", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sheetmetal", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "explosives", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "aluminum", ["min"] = 6, ["max"] = 8 },
			{ ["item"] = "copper", ["min"] = 6, ["max"] = 8 }
		}
	},
	["Supplies"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "tarp", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "techtrash", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sheetmetal", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "roadsigns", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sulfuric", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "saline", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "alcohol", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "explosives", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "aluminum", ["min"] = 4, ["max"] = 8 },
			{ ["item"] = "copper", ["min"] = 4, ["max"] = 8 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Inventory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		for Index,v in pairs(Inv) do
			if (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
				vRP.RemoveItem(Passport,v["item"],parseInt(v["amount"]),false)
			else
				v["amount"] = parseInt(v["amount"])
				v["name"] = itemName(v["item"])
				v["peso"] = itemWeight(v["item"])
				v["index"] = itemIndex(v["item"])
				v["economy"] = itemEconomy(v["item"])
				v["max"] = itemMaxAmount(v["item"])
				v["type"] = itemType(v["item"])
				v["key"] = v["item"]
				v["slot"] = Index

				local Max = itemMaxAmount(v["item"])
				if not Max then
					Max = "S/L"
				end
				v["max"] = Max
				local Split = splitString(v["item"])
				local Description = itemDescription(v["item"])

				if Description then
					v["desc"] = "<description>"..Description.."</description>"
				else
					if Split[1] == "vehkey" then
					 v["desc"] = "<br><desc>Placa do Veículo: <green>"..Split[2].."</green></desc>"
					end
				end

				if Split[2] then
					if itemCharges(v["item"]) then
						v["charges"] = parseInt(Split[2] * 33)
					end

					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - Split[2])
						v["days"] = itemDurability(v["item"])
					end
				end

				Inventory[Index] = v
			end
		end

		return Inventory,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEND
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Send(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and not exports["hud"]:Wanted(Passport) then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 100

			local Inv = vRP.Inventory(Passport)
			if not Inv[Slot] or not Inv[Slot]["item"] then
				Active[Passport] = nil

				return
			end

			local Item = Inv[Slot]["item"]
			if vRP.CheckDamaged(Item) or itemBlock(Item) then
				Active[Passport] = nil

				return
			end

			local OtherPassport = vRP.Passport(ClosestPed)
			if not vRP.MaxItens(OtherPassport,Item,Amount) then
				if (vRP.InventoryWeight(OtherPassport) + itemWeight(Item) * Amount) <= vRP.GetWeight(OtherPassport) then
					Active[Passport] = os.time() + 3
					Player(source)["state"]["Cancel"] = true
					Player(source)["state"]["Buttons"] = true
					Player(ClosestPed)["state"]["Cancel"] = true
					Player(ClosestPed)["state"]["Buttons"] = true
					vRPC.CreateObjects(source,"mp_safehouselost@","package_dropoff","prop_paper_bag_small",16,28422,0.0,-0.05,0.05,180.0,0.0,0.0)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							vRPC.Destroy(source)
							Active[Passport] = nil
							Player(source)["state"]["Cancel"] = false
							Player(source)["state"]["Buttons"] = false
							Player(ClosestPed)["state"]["Cancel"] = false
							Player(ClosestPed)["state"]["Buttons"] = false

							if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
								vRP.GiveItem(OtherPassport,Item,Amount,true)
								TriggerClientEvent("inventory:Update",source,"Backpack")
								TriggerClientEvent("inventory:Update",ClosestPed,"Backpack")
							end
						end

						Wait(100)
					until not Active[Passport]
				else
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
				end
			else
				TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
			end

			Active[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVER
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Deliver(Work)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = os.time() + 100

		if Work == "Lumberman" then
			if not vRPC.LastVehicle(source,"ratloader") then
				TriggerClientEvent("Notify",source,"Atenção","Precisa utilizar o veículo do <b>Lenhador</b>.","amarelo",5000)
				Active[Passport] = nil

				return false
			end

			if vRP.TakeItem(Passport,"woodlog",5,false,Slot) then
				local Experience = vRP.GetExperience(Passport,"Lumberman")
				local Level = ClassCategory(Experience)
				local Valuation = 150

				if Level == 2 or Level == 3 then
					Valuation = Valuation + 25
				elseif Level == 4 or Level == 5 then
					Valuation = Valuation + 30
				elseif Level == 6 or Level == 7 then
					Valuation = Valuation + 35
				elseif Level == 8 or Level == 9 then
					Valuation = Valuation + 40
				elseif Level == 10 then
					Valuation = Valuation + 50
				end

				if exports["party"]:DoesExist(Passport) then
					local Members = exports["party"]:Room(Passport,source,10)
					if parseInt(#Members) >= 2 then
						Valuation = Valuation + (Valuation * 0.1)
					end
				end

				if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
					Valuation = Valuation + (Valuation * 0.1)
				end

				exports["vrp"]:Payments(source,Passport,"Lenhador",Valuation)
				vRP.GenerateItem(Passport,"dollars",Valuation,true)
				vRP.PutExperience(Passport,"Lumberman",1)
				Active[Passport] = nil

				return true
			end
		elseif Work == "Transporter" then
			if not vRPC.LastVehicle(source,"stockade") then
				TriggerClientEvent("Notify",source,"Atenção","Precisa utilizar o veículo do <b>Transportador</b>.","amarelo",5000)
				Active[Passport] = nil

				return false
			end

			if vRP.TakeItem(Passport,"pouch",1,false,Slot) then
				local Experience = vRP.GetExperience(Passport,"Transporter")
				local Level = ClassCategory(Experience)
				local Valuation = 60

				if Level == 2 or Level == 3 then
					Valuation = Valuation + 15
				elseif Level == 4 or Level == 5 then
					Valuation = Valuation + 25
				elseif Level == 6 or Level == 7 then
					Valuation = Valuation + 35
				elseif Level == 8 or Level == 9 then
					Valuation = Valuation + 45
				elseif Level == 10 then
					Valuation = Valuation + 50
				end

				if exports["party"]:DoesExist(Passport) then
					local Members = exports["party"]:Room(Passport,source,10)
					if parseInt(#Members) >= 2 then
						Valuation = Valuation + (Valuation * 0.1)
					end
				end

				if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
					Valuation = Valuation + (Valuation * 0.1)
				end

				exports["vrp"]:Payments(source,Passport,"Transportador",Valuation)
				vRP.GenerateItem(Passport,"dollars",Valuation,true)
				vRP.PutExperience(Passport,"Transporter",1)
				Active[Passport] = nil

				return true
			end
		elseif Work == "Burgershot" or Work == "UwuCoffee" then
			if vRP.TakeItem(Passport,"foodbox",1,false,Slot) then
				local Experience = vRP.GetExperience(Passport,"Delivery")
				local Level = ClassCategory(Experience)
				local Valuation = 140

				if Level == 2 or Level == 3 then
					Valuation = Valuation + 20
				elseif Level == 4 or Level == 5 then
					Valuation = Valuation + 30
				elseif Level == 6 or Level == 7 then
					Valuation = Valuation + 40
				elseif Level == 8 or Level == 9 then
					Valuation = Valuation + 50
				elseif Level == 10 then
					Valuation = Valuation + 60
				end

				if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
					Valuation = Valuation + (Valuation * 0.1)
				end

				if vRP.TakeItem(Passport,"dollars2",500) then
					Valuation = Valuation + 300
				end

				exports["vrp"]:Payments(source,Passport,"Restaurantes",Valuation)
				vRP.GenerateItem(Passport,"dollars",Valuation,true)
				vRP.PutExperience(Passport,"Delivery",1)
				Active[Passport] = nil

				return true
			end
		elseif Work == "Ballas" or Work == "Families" or Work == "Vagos" or Work == "Aztecas" or Work == "Bloods" then
			vRP.GenerateItem(Passport,"dollars3",100,true)
			Active[Passport] = nil

			return true
		end

		Active[Passport] = nil
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRASH
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Trash(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and not Player(source)["state"]["Handcuff"] and not exports["hud"]:Wanted(Passport) and not vRP.InsideVehicle(source) and GetPlayerRoutingBucket(source) < 900000 then
			if Amount <= 0 then Amount = 1 end

			local Inventory = vRP.Inventory(Passport)
			if not Inventory[Slot] or not Inventory[Slot]["item"] then
				return
			end

			local Split = splitString(Inventory[Slot]["item"],"-")
			local Full = Inventory[Slot]["item"]
			local Item = Split[1]

			if vRP.TakeItem(Passport,Full,Amount,true,Slot) then
				Player(source)["state"]["Buttons"] = true
				Player(source)["state"]["Cancel"] = true

				if not vRP.InsideVehicle(source) then
					vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
					Active[Passport] = os.time() + 100

					SetTimeout(1000,function()
						vRPC.Destroy(source)
						Active[Passport] = nil
					end)
				end

				TriggerClientEvent("inventory:Update",source,"Backpack")
				Player(source)["state"]["Buttons"] = false
				Player(source)["state"]["Cancel"] = false

				exports["megazord"]:Discord("**Passaporte:** "..Passport.."\n**Lixo:** "..Amount.."x "..itemName(Item),13541152)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WATERS
-----------------------------------------------------------------------------------------------------------------------------------------
local Waters = {
	["soap"] = true,
	["scuba"] = true,
	["fishingrod"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Use(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		local Inv = vRP.Inventory(Passport)
		if not Inv[Slot] or not Inv[Slot]["item"] then
			return
		end

		local Split = splitString(Inv[Slot]["item"])
		local Full = Inv[Slot]["item"]
		local Item = Split[1]

		if Player(source)["state"]["Handcuff"] and Item ~= "lockpick" then
			return
		end

		if itemDurability(Full) and vRP.CheckDamaged(Full) then
			TriggerClientEvent("Notify",source,"Aviso","<b>"..itemName(Item).."</b> danificado.","amarelo",5000)

			return
		end

		if Item ~= "rope" then
			if (Waters[Item] and not vCLIENT.Water(source)) or (not Waters[Item] and vCLIENT.Water(source)) then
				return
			end
		end

		if itemType(Full) == "Armamento" and parseInt(Slot) <= 5 and not Player(source)["state"]["Safezone"] then
			if vRP.InsideVehicle(source) and not itemVehicle(Full) then
				return
			end

			if vCLIENT.ReturnWeapon(source) then
				local Check,AmmoClip,Weapon = vCLIENT.StoreWeapon(source)

				if Check then
					local Ammunation = itemAmmo(Weapon)
					if Ammunation then
						if AmmoClip > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end

							Ammos[Passport][Ammunation] = AmmoClip
						else
							if Ammos[Passport] and Ammos[Passport][Ammunation] then
								Ammos[Passport][Ammunation] = nil
							end
						end
					end

					TriggerClientEvent("NotifyItens",source,{ "-",itemIndex(Weapon),1,itemName(Weapon) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
			else
				local Attach = {}
				local AmmoClip = 0
				local Ammunation = itemAmmo(Item)
				if Ammunation then
					if Ammos[Passport] and Ammos[Passport][Ammunation] then
						AmmoClip = Ammos[Passport][Ammunation]
					end
				end

				if vCLIENT.ExistAttachs(source,Item) then
					if Attachs[Passport] and Attachs[Passport][Item] then
						Attach = Attachs[Passport][Item]
					end
				end

				if vCLIENT.TakeWeapon(source,Item,AmmoClip,Attach) then
					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
				end
			end
		elseif itemType(Full) == "Munição" then
			local Check,AmmoClip,Weapon = vCLIENT.InfoWeapon(source,Item)

			if Check then
				if Weapon == "WEAPON_PETROLCAN" then
					if (AmmoClip + Amount) > 4500 then
						Amount = 4500 - AmmoClip
					end
				else
					if (AmmoClip + Amount) > 250 then
						Amount = 250 - AmmoClip
					end
				end

				if Item ~= itemAmmo(Weapon) or Amount <= 0 then
					return
				end

				if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
					if not Ammos[Passport] then
						Ammos[Passport] = {}
					end

					Ammos[Passport][Item] = AmmoClip + Amount

					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),Amount,itemName(Full) })
					TriggerClientEvent("inventory:Update",source,"Backpack")
					vCLIENT.Reloading(source,Weapon,Amount)
				end
			end
		elseif itemType(Full) == "Throwing" then
			if vCLIENT.ReturnWeapon(source) then
				local Check,AmmoClip,Weapon = vCLIENT.StoreWeapon(source)

				if Check then
					local Amunnation = itemAmmo(Weapon)
					if Amunnation then
						if AmmoClip > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end

							Ammos[Passport][Amunnation] = AmmoClip
						else
							if Ammos[Passport] and Ammos[Passport][Amunnation] then
								Ammos[Passport][Amunnation] = nil
							end
						end
					end

					TriggerClientEvent("NotifyItens",source,{ "-",itemIndex(Weapon),1,itemName(Weapon) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
			else
				if vCLIENT.TakeWeapon(source,Item,1,nil,Full) then
					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
				end
			end
		elseif Item == "ATTACH_FLASHLIGHT" or Item == "ATTACH_CROSSHAIR" or Item == "ATTACH_SILENCER" or Item == "ATTACH_MAGAZINE" or Item == "ATTACH_GRIP" then
			local Weapon = vCLIENT.ReturnWeapon(source)
			if Weapon then
				if vCLIENT.CheckAttachs(source,Item,Weapon) then
					if not Attachs[Passport] then
						Attachs[Passport] = {}
					end

					if not Attachs[Passport][Weapon] then
						Attachs[Passport][Weapon] = {}
					end

					if not Attachs[Passport][Weapon][Item] then
						if vRP.TakeItem(Passport,Full,1,false,Slot) then
							TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
							TriggerClientEvent("inventory:Update",source,"Backpack")
							Attachs[Passport][Weapon][Item] = true
							vCLIENT.Attachs(source,Item,Weapon)
						end
					else
						TriggerClientEvent("Notify",source,"Aviso","O armamento já possui um componente equipado.","amarelo",5000)
					end
				else
					TriggerClientEvent("Notify",source,"Aviso","O armamento não possui suporte ao componente.","amarelo",5000)
				end
			end
		elseif Use[Item] then
			Use[Item](source,Passport,Amount,Slot,Full,Item,Split)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Cancel")
AddEventHandler("inventory:Cancel",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Active[Passport] then
			vGARAGE.UpdateHotwired(source,false)
			Player(source)["state"]["Buttons"] = false
			TriggerClientEvent("Progress",source,"Cancelando",1000)

			if Lootsfy[Passport] then
				local Box = Lootsfy[Passport]["Box"]
				local Number = Lootsfy[Passport]["Number"]

				Loots[Box]["Players"][Number][Passport] = os.time()
				Lootsfy[Passport] = nil
			end

			if Trashsfy[Passport] then
				local Number = Trashsfy[Passport]

				Trashs[Number]["Timer"] = os.time()
				Trashsfy[Passport] = nil
			end

			Active[Passport] = nil
		end

		if Carry[Passport] then
			if vRP.Passport(Carry[Passport]) then
				TriggerClientEvent("inventory:Carry",Carry[Passport],nil,"Detach")
				Player(Carry[Passport])["state"]["Carry"] = false
				vRPC.Destroy(Carry[Passport])
			end
	
			Carry[Passport] = nil
		end

		if Player(source)["state"]["Camera"] then
			TriggerClientEvent("inventory:Camera",source)
		end

		vRP.FreezePlayer(source,false)
		vRPC.Destroy(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFYWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.VerifyWeapon(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not vRP.ConsultItem(Passport,Item,1) then
		local Ammunation = itemAmmo(Item)
		if Ammunation and Ammos[Passport] and Ammos[Passport][Ammunation] then
			if Ammo and Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			end

			if Ammos[Passport][Ammunation] > 0 then
				vRP.GenerateItem(Passport,Ammunation,Ammos[Passport][Ammunation])
				Ammos[Passport][Ammunation] = nil
			end
		end

		if Attachs[Passport] and Attachs[Passport][Item] then
			for Component,_ in pairs(Attachs[Passport][Item]) do
				vRP.GenerateItem(Passport,Component,1)
			end

			Attachs[Passport][Item] = nil
		end

		TriggerClientEvent("inventory:Update",source,"Backpack")
		exports["inventory"]:CleanWeapons(Passport,false)

		return false
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXISTWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckExistWeapons(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item and not vRP.ConsultItem(Passport,Item,1) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETHROWING
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveThrowing(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item ~= nil then
		vRP.TakeItem(Passport,Item,1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREVENTWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PreventWeapons(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Ammos[Passport] then
		local Ammunation = itemAmmo(Item)

		if Ammunation and Ammos[Passport][Ammunation] then
			if Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			else
				Ammos[Passport][Ammunation] = nil
				exports["inventory"]:CleanWeapons(Passport,false)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:TRASHER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Trasher")
AddEventHandler("inventory:Trasher",function(Entity)
	local source = source
	local Coords = Entity[4]
	local Number = parseInt(#Trashs + 1)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Coords then
		for Index = 1,#Trashs do
			if #(Trashs[Index]["Coords"] - Coords) <= 0.75 then
				if os.time() <= Trashs[Index]["Timer"] then
					TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Trashs[Index]["Timer"] - os.time().."</b> segundos.","amarelo",5000)
					return
				else
					Number = Index
					break
				end
			end
		end

		Trashsfy[Passport] = Number
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,"Vasculhando",10000)
		vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)
		Trashs[Number] = { ["Coords"] = Coords, ["Timer"] = os.time() + 1800, ["Passport"] = Passport }

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Trashsfy[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if Trashs[Number]["Passport"] == Passport then
					local Experience = vRP.GetExperience(Passport,"Garbageman")
					local Level = ClassCategory(Experience)
					local Valuation = math.random(8,12)

					if Level == 4 or Level == 5 then
						Valuation = Valuation + math.random(2)
					elseif Level == 6 or Level == 7 then
						Valuation = Valuation + math.random(3)
					elseif Level == 8 or Level == 9 or Level == 10 then
						Valuation = Valuation + math.random(4)
					end

					if (vRP.InventoryWeight(Passport) + itemWeight("recyclable") * Valuation) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,"recyclable",Valuation,true)
						vRP.PutExperience(Passport,"Garbageman",1)
						vRP.UpgradeStress(Passport,1)
					else
						TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
						Trashs[Number]["Timer"] = os.time()
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Loot")
AddEventHandler("inventory:Loot",function(Number,Box)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Loots[Box] then
		if not Loots[Box]["Players"][Number] then
			Loots[Box]["Players"][Number] = {}
		end

		if Loots[Box]["Players"][Number][Passport] then
			if os.time() <= Loots[Box]["Players"][Number][Passport] then
				TriggerClientEvent("Notify",source,"Aviso","Aguarde <b>"..Loots[Box]["Players"][Number][Passport] - os.time().."</b> segundos.","amarelo",5000)
				return false
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,"Vasculhando",10000)
		Lootsfy[Passport] = { ["Number"] = Number, ["Box"] = Box }
		Loots[Box]["Players"][Number][Passport] = os.time() + Loots[Box]["Cooldown"]
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Lootsfy[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				local Rand = math.random(#Loots[Box]["List"])
				local Amount = math.random(Loots[Box]["List"][Rand]["min"],Loots[Box]["List"][Rand]["max"])
				local Item = { Loots[Box]["List"][Rand]["item"],Amount }

				if (vRP.InventoryWeight(Passport) + itemWeight(Item[1]) * Item[2]) <= vRP.GetWeight(Passport) then
					vRP.GenerateItem(Passport,Item[1],Item[2],true)
				else
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
					Loots[Box]["Players"][Number][Passport] = os.time()
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CHANGEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:ChangePlate")
AddEventHandler("inventory:ChangePlate",function(Entitys)
	local source = source
	local ConsultItem = {}
	local Plate = Entitys[1]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not Plates[Plate] then
			ConsultItem = vRP.InventoryItemAmount(Passport,"plate")
			if ConsultItem[1] <= 0 then
				TriggerClientEvent("Notify",source,"Atenção","Precisa de <b>1x "..itemName("plate").."</b>.","amarelo",5000)

				return false
			end
		end

		if Plates[Plate] and Passport ~= Plates[Plate][1] then
			return false
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,"Trocando",10000)
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if not Plates[Plate] then
					if vRP.TakeItem(Passport,ConsultItem[2],1,true) then
						local Vehicle = NetworkGetEntityFromNetworkId(Entitys[4])
						if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
							local NewPlate = vRP.GeneratePlate()
							Plates[NewPlate] = { Passport,Plate }
							SetVehicleNumberPlateText(Vehicle,NewPlate)

							if not vRP.PassportPlate(NewPlate) then
								Entity(Vehicle)["state"]:set("Lockpick",Passport,true)
							else
								Entity(Vehicle)["state"]:set("Lockpick",true,true)
							end
						end
					end
				else
					local Vehicle = NetworkGetEntityFromNetworkId(Entitys[4])
					if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
						SetVehicleNumberPlateText(Vehicle,Plates[Plate][2])
					end

					if math.random(100) >= 50 then
						vRP.GenerateItem(Passport,"plate",1,true)
					else
						TriggerClientEvent("Notify",source,"Atenção","Após remove-la a mesma quebrou.","amarelo",5000)
					end

					Plates[Plate] = nil
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:StealTrunk")
AddEventHandler("inventory:StealTrunk",function(Entity)
	local source = source
	local Plate = Entity[1]
	local Model = Entity[2]
	local Network = Entity[4]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not vCLIENT.CheckWeapon(source,"WEAPON_CROWBAR") then
			TriggerClientEvent("Notify",source,"Aviso","<b>Pé de Cabra</b> não encontrado.","amarelo",5000)

			return false
		end

		if not vRP.PassportPlate(Plate) then
			if not Trunks[Plate] or os.time() >= Trunks[Plate] then
				vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
				Active[Passport] = os.time() + 100

				if vRP.Task(source,5,7500) then
					Active[Passport] = os.time() + 20
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,"Vasculhando",20000)
					TriggerClientEvent("player:Residuals",source,"Resíduo de Ferro.")

					local Players = vRPC.Players(source)
					for _,v in pairs(Players) do
						async(function()
							TriggerClientEvent("player:VehicleDoors",v,Network,"open")
						end)
					end

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							vRPC.stopAnim(source,false)
							Player(source)["state"]["Buttons"] = false

							for _,v in pairs(Players) do
								async(function()
									TriggerClientEvent("player:VehicleDoors",v,Network,"close")
								end)
							end

							if not Trunks[Plate] or os.time() >= Trunks[Plate] then
								local Rand = math.random(#StealItens)
								local Amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"])

								if (vRP.InventoryWeight(Passport) + itemWeight(StealItens[Rand]["Item"]) * Amount) <= vRP.GetWeight(Passport) then
									vRP.GenerateItem(Passport,StealItens[Rand]["Item"],Amount,true)
									Trunks[Plate] = os.time() + 3600
									vRP.UpgradeStress(Passport,2)
								else
									TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				else
					TriggerEvent("Wanted",source,Passport,30)
					vRPC.stopAnim(source,false)
					Active[Passport] = nil

					local Coords = vRP.GetEntityCoords(source)
					local Service = vRP.NumPermission("Policia")
					for Passports,Sources in pairs(Service) do
						async(function()
							vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
							TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(Model).." - "..Plate, color = 44 })
						end)
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"Aviso","Veículo protegido pela seguradora.","amarelo",1000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Animals")
AddEventHandler("inventory:Animals",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Entity[5] then
		local MyEntity,Mode = vCLIENT.Animals(source)

		if MyEntity == Entity[1] then
			if vCLIENT.CheckWeapon(source,"WEAPON_SWITCHBLADE") then
				if (vRP.InventoryWeight(Passport) + itemWeight("deer1star")) <= vRP.GetWeight(Passport) then
					Active[Passport] = os.time() + 30
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,"Esfolando",30000)
					vRPC.playAnim(source,false,{"amb@medic@standing@kneel@base","base"},true)
					vRPC.playAnim(source,true,{"anim@gangops@facility@servers@bodysearch@","player_search"},true)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							vRPC.Destroy(source)
							Active[Passport] = nil
							Player(source)["state"]["Buttons"] = false

							vRP.UpgradeStress(Passport,1)
							TriggerEvent("DeletePed",Entity[3])
							vRP.PutExperience(Passport,"Hunting",1)
							vRP.GenerateItem(Passport,Mode..math.random(3).."star",1,true)
						end

						Wait(100)
					until not Active[Passport]
				else
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
				end
			else
				TriggerClientEvent("Notify",source,"Atenção","Você precisa colocar o <b>Canivete</b> em mãos.","amarelo",5000)
			end
		else
			TriggerClientEvent("Notify",source,false,"Esta carcaça animal não é sua.","amarelo",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:StoreObjects")
AddEventHandler("inventory:StoreObjects",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Objects[Number] then
		if (vRP.InventoryWeight(Passport) + itemWeight(Objects[Number]["item"])) <= vRP.GetWeight(Passport) then
			vRP.GiveItem(Passport,Objects[Number]["item"],1,true)
			TriggerClientEvent("objects:Remover",-1,Number)
			Objects[Number] = nil
		else
			TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEPRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:MakeProducts")
AddEventHandler("inventory:MakeProducts",function(Table)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		local Selected = SplitOne(Table)

		if Products[Selected] then
			if Selected == "foodjuice" or Selected == "foodburger" or Selected == "foodbox" then
				if not vRP.HasGroup(Passport,"Restaurantes") then
					return
				end
			end

			if Selected == "cemitery" and not vRP.Task(source,3,7500) then
				TriggerEvent("Wanted",source,Passport,60)

				local Coords = vRP.GetEntityCoords(source)
				local Service = vRP.NumPermission("Policia")
				for Passports,Sources in pairs(Service) do
					async(function()
						vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
						TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Roubo de Pertences", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", color = 16 })
					end)
				end
			end

			local Need = {}
			local Consult = {}
			local Number = math.random(#Products[Selected])

			if Products[Selected][Number]["item"] then
				if vRP.MaxItens(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"]) then
					TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
					return
				end

				if (vRP.InventoryWeight(Passport) + itemWeight(Products[Selected][Number]["item"]) * Products[Selected][Number]["itemAmount"]) > vRP.GetWeight(Passport) then
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
					return
				end
			end

			if Products[Selected][Number]["need"] then
				local NeedLess = Products[Selected][Number]["need"]

				if type(NeedLess) == "table" then
					for Index,v in pairs(NeedLess) do
						Consult = vRP.InventoryItemAmount(Passport,v["item"])
						if Consult[1] < v["amount"] then
							TriggerClientEvent("Notify",source,"Atenção","Necessário possuir <b>"..v["amount"].."x "..itemName(v["item"]).."</b>.","amarelo",5000)
							return
						end

						Need[Index] = { Consult[2],v["amount"] }
					end
				else
					needAmount = Products[Selected][Number]["needAmount"]
					Consult = vRP.InventoryItemAmount(Passport,NeedLess)
					if Consult[1] < needAmount then
						TriggerClientEvent("Notify",source,"Atenção","Necessário possuir <b>"..needAmount.."x "..itemName(NeedLess).."</b>.","amarelo",5000)
						return
					end
				end
			end

			Player(source)["state"]["Buttons"] = true
			Active[Passport] = os.time() + Products[Selected][Number]["timer"]
			TriggerClientEvent("Progress",source,"Produzindo",Products[Selected][Number]["timer"] * 1000)

			if Selected == "foodjuice" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "foodburger" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "foodbox" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "cemitery" then
				vRPC.playAnim(source,false,{"amb@medic@standing@tendtodead@idle_a","idle_a"},true)
			elseif Selected == "emptybottle" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			else
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			end

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					Player(source)["state"]["Buttons"] = false
					vRPC.Destroy(source,"two")
					Active[Passport] = nil

					if Products[Selected][Number]["need"] then
						if type(Products[Selected][Number]["need"]) == "table" then
							for _,v in pairs(Need) do
								vRP.RemoveItem(Passport,v[1],v[2],false)
							end
						else
							vRP.RemoveItem(Passport,Consult[2],needAmount,false)
						end
					end

					if Products[Selected][Number]["item"] then
						vRP.GenerateItem(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"],true)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETYRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:RemoveTyres")
AddEventHandler("inventory:RemoveTyres",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Entity[2] ~= "veto" and Entity[2] ~= "veto2" then
		if not vCLIENT.CheckWeapon(source,"WEAPON_WRENCH") then
			TriggerClientEvent("Notify",source,"Aviso","<b>Chave Inglesa</b> não encontrada.","amarelo",5000)

			return false
		end

		local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
		if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
			if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then
				if vRP.MaxItens(Passport,"tyres",1) then
					TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)

					return false
				end

				if vRP.PassportPlate(Entity[1]) then
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

					if vRP.Task(source,3,5000) then
						Active[Passport] = os.time() + 10
						TriggerClientEvent("Progress",source,"Removendo",10000)

						repeat
							if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
								Active[Passport] = nil

								local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
								if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
									if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then
										local Players = vRPC.Players(source)
										for _,v in pairs(Players) do
											async(function()
												TriggerClientEvent("inventory:explodeTyres",v,Entity[4],Entity[1],Entity[5])
											end)
										end

										vRP.GenerateItem(Passport,"tyres",1,true)
									end
								end
							end

							Wait(100)
						until not Active[Passport]
					end

					Player(source)["state"]["Buttons"] = false
					vRPC.Destroy(source)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DRINK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Drink")
AddEventHandler("inventory:Drink",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_plastic_cup_02",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				vRP.UpgradeThirst(Passport,15)
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:ROLLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:RollVehicle")
AddEventHandler("player:RollVehicle",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 60
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Desvirando",60000)
		vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("target:RollVehicle",v,Entity[4])
					end)
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:BUFFSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("inventory:BuffServer",function(source,Passport,Name,Amount)
	if not Buffs[Name][Passport] then
		Buffs[Name][Passport] = 0
	end

	if os.time() >= Buffs[Name][Passport] then
		Buffs[Name][Passport] = os.time() + Amount
	else
		Buffs[Name][Passport] = Buffs[Name][Passport] + Amount

		if (Buffs[Name][Passport] - os.time()) >= 3600 then
			Buffs[Name][Passport] = os.time() + 3600
		end
	end

	TriggerClientEvent("hud:"..Name,source,Buffs[Name][Passport] - os.time())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Buffs",function(Mode,Passport)
	return Buffs[Mode][Passport]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("SaveServer",function(Silenced)
	local List = vRP.Players()
	for Passport,_ in pairs(List) do
		vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Attachs", Information = json.encode(Attachs[Passport]) })
		vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Ammos", Information = json.encode(Ammos[Passport]) })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Ammos[Passport] and Attachs[Passport] then
		vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Attachs", Information = json.encode(Attachs[Passport]) })
		vRP.Query("playerdata/SetData",{ Passport = Passport, Name = "Ammos", Information = json.encode(Ammos[Passport]) })

		Attachs[Passport] = nil
		Ammos[Passport] = nil
	end

	if Lootsfy[Passport] then
		local Box = Lootsfy[Passport]["Box"]
		local Number = Lootsfy[Passport]["Number"]

		Loots[Box]["Players"][Number][Passport] = os.time()
		Lootsfy[Passport] = nil
	end

	if Trashsfy[Passport] then
		local Number = Trashsfy[Passport]

		Trashs[Number]["Timer"] = os.time()
		Trashsfy[Passport] = nil
	end

	if Active[Passport] then
		Active[Passport] = nil
	end

	if Healths[Passport] then
		Healths[Passport] = nil
	end

	if Armors[Passport] then
		Armors[Passport] = nil
	end

	if Drugs[Passport] then
		Drugs[Passport] = nil
	end

	if Carry[Passport] then
		if vRP.Passport(Carry[Passport]) then
			TriggerClientEvent("inventory:Carry",Carry[Passport],nil,"Detach")
			Player(Carry[Passport])["state"]["Carry"] = false
			vRPC.Destroy(Carry[Passport])
		end

		Carry[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	Ammos[Passport] = vRP.UserData(Passport,"Ammos")
	Attachs[Passport] = vRP.UserData(Passport,"Attachs")

	TriggerClientEvent("objects:Table",source,Objects)
	TriggerClientEvent("inventory:Drops",source,Drops)

	for Name,_ in pairs(Buffs) do
		if Buffs[Name] and Buffs[Name][Passport] and os.time() < Buffs[Name][Passport] then
			TriggerClientEvent("hud:"..Name,source,Buffs[Name][Passport] - os.time())
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("CleanWeapons",function(Passport,Clean)
	local source = vRP.Source(Passport)
	if source then
		if vRP.DoesEntityExist(source) then
			local Ped = GetPlayerPed(source)
			local Weapon = GetSelectedPedWeapon(Ped)

			RemoveWeaponFromPed(Ped,Weapon)
			RemoveAllPedWeapons(Ped,true)
			SetPedAmmo(Ped,Weapon,0)
		end

		if Clean then
			Attachs[Passport] = {}
			Ammos[Passport] = {}
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.StealPeds()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Rand = math.random(#StealPeds)
		local Amount = math.random(StealPeds[Rand]["Min"],StealPeds[Rand]["Max"])

		if vRP.MaxItens(Passport,StealPeds[Rand]["Item"],Amount) then
			TriggerClientEvent("Notify",source,"Aviso","Limite atingido.","amarelo",5000)
			return true
		end

		if (vRP.InventoryWeight(Passport) + itemWeight(StealPeds[Rand]["Item"]) * Amount) <= vRP.GetWeight(Passport) then
			vRP.GenerateItem(Passport,StealPeds[Rand]["Item"],Amount,true)

			if math.random(100) >= 75 and vRP.DoesEntityExist(source) then
				TriggerEvent("Wanted",source,Passport,60)

				local Coords = vRP.GetEntityCoords(source)
				local Service = vRP.NumPermission("Policia")
				for Passports,Sources in pairs(Service) do
					async(function()
						vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
						TriggerClientEvent("NotifyPush",Sources,{ code = 32, title = "Assalto a mão armada", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Ligação Anônima", color = 16 })
					end)
				end
			end
		else
			TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ShotsFired(Vehicle)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Vehicle then
			Vehicle = "Disparos de um veículo"
		else
			Vehicle = "Disparos com arma de fogo"
		end

		if vRP.DoesEntityExist(source) then
			local Coords = vRP.GetEntityCoords(source)
			local Service = vRP.NumPermission("Policia")
			for Passports,Sources in pairs(Service) do
				async(function()
					vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
					TriggerClientEvent("NotifyPush",Sources,{ code = 10, title = Vehicle, x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 6 })
				end)
			end
		end
	end
end