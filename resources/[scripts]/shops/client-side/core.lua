-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("shops",Creative)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local inventoryShop,inventoryUser,invPeso,invMaxpeso,shopSlots = vSERVER.Request(Data["shop"])
	if inventoryShop then
		Callback({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(Data,Callback)
	vSERVER.functionShops(Data["shop"],Data["item"],Data["amount"],Data["slot"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(Data,Callback)
	TriggerServerEvent("shops:populateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(Data,Callback)
	TriggerServerEvent("shops:updateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Action)
	SendNUIMessage({ Action = Action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ 1136.52,-1557.0,35.03,"Departament",true },
	{ 24.51,-1346.75,29.49,"Departament",true },
	{ 2556.77,380.87,108.61,"Departament",true },
	{ 1164.81,-323.61,69.2,"Departament",true },
	{ -706.16,-914.55,19.21,"Departament",true },
	{ -47.35,-1758.59,29.42,"Departament",true },
	{ 372.7,326.89,103.56,"Departament",true },
	{ -3242.7,1000.05,12.82,"Departament",true },
	{ 1728.08,6415.6,35.03,"Departament",true },
	{ 549.09,2670.89,42.16,"Departament",true },
	{ 1959.87,3740.44,32.33,"Departament",true },
	{ 2677.65,3279.66,55.23,"Departament",true },
	{ 1697.32,4923.46,42.06,"Departament",true },
	{ -1819.52,793.48,138.08,"Departament",true },
	{ 1391.62,3605.95,34.98,"Departament",true },
	{ -2966.41,391.52,15.05,"Departament",true },
	{ -3039.42,584.42,7.9,"Departament",true },
	{ 1134.32,-983.09,46.4,"Departament",true },
	{ 1165.32,2710.79,38.15,"Departament",true },
	{ -1486.72,-377.61,40.15,"Departament",true },
	{ -1221.48,-907.93,12.32,"Departament",true },
	{ 1692.27,3760.91,34.69,"Ammunation",false },
	{ 253.80,-50.47,69.94,"Ammunation",false },
	{ 842.54,-1035.25,28.19,"Ammunation",false },
	{ -331.67,6084.86,31.46,"Ammunation",false },
	{ -662.37,-933.58,21.82,"Ammunation",false },
	{ -1304.12,-394.56,36.7,"Ammunation",false },
	{ -1118.98,2699.73,18.55,"Ammunation",false },
	{ 2567.98,292.62,108.73,"Ammunation",false },
	{ -3173.51,1088.35,20.84,"Ammunation",false },
	{ 22.53,-1105.52,29.79,"Ammunation",false },
	{ 810.22,-2158.99,29.62,"Ammunation",false },
	{ -1816.64,-1193.73,14.31,"Fishing",false },
	{ -1593.08,5202.9,4.31,"Hunting",false },
	{ -679.13,5839.52,17.32,"Hunting2",false },
	{ -172.89,6381.32,31.48,"Pharmacy",false },
	{ 1690.07,3581.68,35.62,"Pharmacy",false },
	{ 1141.79,-1530.13,35.03,"Pharmacy",false },
	{ 1134.78,-1545.15,35.15,"Paramedico",false },
	{ -254.64,6326.95,32.82,"Paramedico",false },
	{ -428.54,-1728.29,19.78,"Recycle",false },
	{ 180.07,2793.29,45.65,"Recycle",false },
	{ -195.42,6264.62,31.49,"Recycle",false },
	{ 609.3,1.81,87.88,"Policia",false },
	{ -628.79,-238.7,38.05,"Miners",false },
	{ 987.83,-95.28,74.85,"Drinks",false },
	{ 280.59,-970.28,29.42,"CoolBeans",false },
	{ -686.61,322.19,83.09,"CoolBeans",false },
	{ -320.41,-814.58,32.47,"CoolBeans",false },
	{ -1278.21,-1126.43,6.91,"CoolBeans",false },
	{ 469.06,-718.27,27.53,"CoolBeans",false },
	{ -473.8,1114.42,320.23,"CoolBeans",false },
	{ -851.51,-353.56,38.67,"CoolBeans",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
local Materials = {
	{
		["Coords"] = vec3(3809.16,4489.51,6.39),
		["Hours"] = 12
	},{
		["Coords"] = vec3(-2017.88,3383.98,31.24),
		["Hours"] = 20
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Open",function(Number)
	if not exports["hud"]:Wanted() and vSERVER.Permission(List[Number][4]) then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open", name = List[Number][4], type = vSERVER.ShopType(List[Number][4]) })

		if List[Number][5] then
			TriggerEvent("sounds:Private","shop",0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Coffee",function()
	SendNUIMessage({ Action = "Open", name = "Coffee", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Soda",function()
	SendNUIMessage({ Action = "Open", name = "Soda", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Donut",function()
	SendNUIMessage({ Action = "Open", name = "Donut", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HAMBURGER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hamburger",function()
	SendNUIMessage({ Action = "Open", name = "Hamburger", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hotdog",function()
	SendNUIMessage({ Action = "Open", name = "Hotdog", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua",function()
	SendNUIMessage({ Action = "Open", name = "Chihuahua", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Water",function()
	SendNUIMessage({ Action = "Open", name = "Water", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CIGARETTE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Cigarette",function()
	SendNUIMessage({ Action = "Open", name = "Cigarette", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEDIC
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Medic",function()
	if not exports["hud"]:Wanted() and vSERVER.Permission("Paramedico") then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open", name = "Paramedico", type = "Buy" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fuel",function()
	SendNUIMessage({ Action = "Open", name = "Fuel", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(List) do
		exports["target"]:AddCircleZone("Shops:"..Number,vec3(v[1],v[2],v[3]),0.50,{
			name = "Shops:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = v[6] or 2.0,
			options = {
				{
					event = "shops:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end

	for Number,v in pairs(Materials) do
		exports["target"]:AddCircleZone("Materials:"..Number,v["Coords"],0.50,{
			name = "Materials:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.25,
			options = {
				{
					event = "shops:Materials",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Materials",function(Number)
	if Materials[Number] then
		if GlobalState["Hours"] == Materials[Number]["Hours"] then
			SetNuiFocus(true,true)
			SendNUIMessage({ Action = "Open", name = "Materials", type = "Buy" })
		else
			TriggerEvent("Notify","Robert Jenkyns","Estou sem mercadoria no momento, volte as <b>"..Materials[Number]["Hours"]..":00 Horas</b> que vou ver se consigo mercadoria.","amarelo",5000)
		end
	end
end)