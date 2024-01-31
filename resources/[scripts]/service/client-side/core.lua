-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ vec3(625.75,6.62,84.54),"Policia-1",1.25 },
	{ vec3(620.24,10.47,87.97),"Policia-2",1.25 },
	{ vec3(1143.02,-1545.91,35.65),"Paramedico-1",1.5 },
	{ vec3(1128.78,-1534.88,35.3),"Paramedico-2",1.5 },
	{ vec3(1127.6,-1561.6,39.77),"Paramedico-3",1.5 },
	{ vec3(1143.0,-1538.71,39.34),"Paramedico-4",1.5 },
	{ vec3(-254.35,6330.34,32.55),"Paramedico-5",1.5 },
	-- { vec3(-1177.12,-896.91,13.91),"Burgershot",1.25 },
	{ vec3(-1178.22,-896.38,13.95),"Burgershot",1.25 },
	{ vec3(-596.18,-1052.79,22.25),"UwuCoffee",1.25 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number = 1,#List do
		exports["target"]:AddCircleZone("Service:"..List[Number][2],List[Number][1],0.15,{
			name = "Service:"..List[Number][2],
			heading = 0.0,
			useZ = true
		},{
			shop = Number,
			Distance = List[Number][3],
			options = {
				{
					label = "Entrar em Serviço",
					event = "service:Toggle",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Toggle")
AddEventHandler("service:Toggle",function(Service)
	TriggerServerEvent("service:Toggle",List[Service][2])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:LABEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Label")
AddEventHandler("service:Label",function(Service,Text)
	if Service == "Policia" then
		exports["target"]:LabelText("Service:Policia-1",Text)
		exports["target"]:LabelText("Service:Policia-2",Text)
	elseif Service == "Paramedico" then
		exports["target"]:LabelText("Service:Paramedico-1",Text)
		exports["target"]:LabelText("Service:Paramedico-2",Text)
		exports["target"]:LabelText("Service:Paramedico-3",Text)
		exports["target"]:LabelText("Service:Paramedico-4",Text)
		exports["target"]:LabelText("Service:Paramedico-5",Text)
	else
		exports["target"]:LabelText("Service:"..Service,Text)
	end
end)