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
Tunnel.bindInterface("doors",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {
	["1"] = { Coords = vec3(1844.99,2604.81,44.63), Hash = 741314661, Disabled = false, Lock = true, Distance = 7, Perm = "Emergencia" },
	["2"] = { Coords = vec3(1818.54,2604.40,44.61), Hash = 741314661, Disabled = false, Lock = true, Distance = 7, Perm = "Emergencia" },
	["3"] = { Coords = vec3(1837.91,2590.25,46.19), Hash = 539686410, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["4"] = { Coords = vec3(1768.54,2498.41,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["5"] = { Coords = vec3(1765.40,2496.59,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["6"] = { Coords = vec3(1762.25,2494.77,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["7"] = { Coords = vec3(1755.96,2491.14,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["8"] = { Coords = vec3(1752.81,2489.33,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["9"] = { Coords = vec3(1749.67,2487.51,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["10"] = { Coords = vec3(1758.07,2475.39,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["11"] = { Coords = vec3(1761.22,2477.20,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["12"] = { Coords = vec3(1764.36,2479.02,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["13"] = { Coords = vec3(1767.51,2480.84,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["14"] = { Coords = vec3(1770.66,2482.65,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["15"] = { Coords = vec3(1773.80,2484.47,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["16"] = { Coords = vec3(1776.95,2486.29,45.88), Hash = 913760512, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },

	["21"] = { Coords = vec3(623.19,0.03,84.52), Hash = -1710789498, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["22"] = { Coords = vec3(621.35,-5.20,84.52), Hash = -634359790, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["23"] = { Coords = vec3(624.31,-7.94,84.52), Hash = -1603817716, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["24"] = { Coords = vec3(625.19,-5.52,84.52), Hash = -1710789498, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["25"] = { Coords = vec3(527.24,-24.39,71.44), Hash = 1808410875, Disabled = false, Lock = true, Distance = 7.0, Perm = "Policia", Other = "26" },
	["26"] = { Coords = vec3(531.60,-21.75,71.49), Hash = 843620952, Disabled = false, Lock = true, Distance = 7.0, Perm = "Policia", Other = "25" },
	["27"] = { Coords = vec3(617.92,-25.20,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["28"] = { Coords = vec3(619.16,-21.79,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["29"] = { Coords = vec3(620.40,-18.39,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["30"] = { Coords = vec3(621.64,-14.98,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["31"] = { Coords = vec3(621.39,-5.21,77.63), Hash = -634359790, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["32"] = { Coords = vec3(617.37,6.64,87.95), Hash = -1710789498, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia", Other = "33" },
	["33"] = { Coords = vec3(614.95,7.52,87.95), Hash = -1710789498, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia", Other = "32" },
	["34"] = { Coords = vec3(616.59,-6.07,99.50), Hash = -404327078, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["35"] = { Coords = vec3(624.30,-0.45,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["36"] = { Coords = vec3(620.57,-10.72,77.64), Hash = 879034500, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },
	["37"] = { Coords = vec3(615.48,-3.05,70.71), Hash = -404327078, Disabled = false, Lock = true, Distance = 1.25, Perm = "Policia" },

	["51"] = { Coords = vec3(1135.90,-1596.04,35.16), Hash = 720452516, Disabled = false, Lock = true, Distance = 7.0, Perm = "Paramedico" },
	["52"] = { Coords = vec3(1141.49,-1596.08,35.25), Hash = 720452516, Disabled = false, Lock = true, Distance = 7.0, Perm = "Paramedico" },

	-- ["101"] = { Coords = vec3(-1182.50,-899.55,13.90), Hash = 547885802, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },
	-- ["102"] = { Coords = vec3(-1191.71,-902.76,13.90), Hash = 547885802, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },
	-- ["103"] = { Coords = vec3(-1199.88,-903.02,13.90), Hash = 1009568243, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },
	-- ["104"] = { Coords = vec3(-1200.19,-901.23,13.90), Hash = 846116471, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },
	-- ["105"] = { Coords = vec3(-1176.60,-895.57,13.90), Hash = 1009568243, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },
	-- ["106"] = { Coords = vec3(-1183.26,-897.05,13.90), Hash = 846116471, Disabled = false, Lock = true, Distance = 1.25, Perm = "Burgershot" },

	["111"] = { Coords = vec3(-600.88,-1055.13,22.71), Hash = 1099436502, Disabled = false, Lock = true, Distance = 1.25, Perm = "UwuCoffee", Other = "112" },
	["112"] = { Coords = vec3(-600.90,-1059.21,21.72), Hash = 522844070, Disabled = false, Lock = true, Distance = 7.0, Perm = "UwuCoffee", Other = "111" },
	["113"] = { Coords = vec3(-587.34,-1051.89,22.41), Hash = -1283712428, Disabled = false, Lock = true, Distance = 1.25, Perm = "UwuCoffee" },

	["999"] = { Coords = vec3(251.85,221.06,101.83), Hash = -1508355822, Disabled = true, Lock = true, Distance = 1.25, Perm = "Admin" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and GlobalState["Doors"][Number] then
		if GlobalState["Doors"][Number]["Perm"] and vRP.HasGroup(Passport,GlobalState["Doors"][Number]["Perm"]) then
			local Doors = GlobalState["Doors"]

			Doors[Number]["Lock"] = not Doors[Number]["Lock"]

			if Doors[Number]["Other"] then
				local Second = Doors[Number]["Other"]
				Doors[Second]["Lock"] = not Doors[Second]["Lock"]
			end

			GlobalState:set("Doors",Doors,true)

			vRPC.playAnim(source,true,{"anim@heists@keycard@","exit"},false)
			Wait(350)
			vRPC.Destroy(source)
		end
	end
end