-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Init = {}
local Objects = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS:TABLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("objects:Table")
AddEventHandler("objects:Table",function(Table)
	Objects = Table

	for Number = 4,122 do
		local Number = tostring(Number)
		local Blip = AddBlipForRadius(Table[Number]["x"],Table[Number]["y"],Table[Number]["z"],10.0)
		SetBlipAlpha(Blip,200)
		SetBlipColour(Blip,85)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS:ADICIONAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("objects:Adicionar")
AddEventHandler("objects:Adicionar",function(Number,Table)
	Objects[Number] = Table
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETLABEL
-----------------------------------------------------------------------------------------------------------------------------------------
function TargetLabel(x,y,z,Number,Item,Mode,Perm)
	if Mode == "1" then
		exports["target"]:AddCircleZone("Objects:"..Number,vec3(x,y,z),0.75,{
			name = "Objects:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.5,
			options = {
				{
					event = "inventory:StoreObjects",
					label = "Guardar",
					tunnel = "server"
				}
			}
		})
	elseif Mode == "2" then
		exports["target"]:AddCircleZone("Objects:"..Number,vec3(x,y,z),0.75,{
			name = "Objects:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.5,
			options = {
				{
					event = "inventory:StoreObjects",
					label = "Guardar",
					tunnel = "server"
				},{
					event = "shops:Medic",
					label = "Abrir",
					tunnel = "client"
				}
			}
		})
	elseif Mode == "Medic" or Mode == "Weapons" or Mode == "Supplies" then
		exports["target"]:AddCircleZone("Objects:"..Number,vec3(x,y,z),0.75,{
			name = "Objects:"..Number,
			heading = 0.0
		},{
			shop = Number,
			Distance = 1.5,
			options = {
				{
					event = "inventory:Loot",
					label = "Abrir",
					tunnel = "police",
					service = Mode
				}
			}
		})
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		for Number,v in pairs(Objects) do
			if #(Coords - vec3(v["x"],v["y"],v["z"])) <= v["Distance"] then
				if not Init[Number] and LoadModel(v["object"]) then
					if v["mode"] then
						TargetLabel(v["x"],v["y"],v["z"],Number,v["item"],v["mode"],v["perm"])
					end

					Init[Number] = CreateObjectNoOffset(v["object"],v["x"],v["y"],v["z"],false,false,false)
					SetEntityHeading(Init[Number],v["h"])
					FreezeEntityPosition(Init[Number],true)
					SetModelAsNoLongerNeeded(v["object"])
				end
			else
				if Init[Number] then
					if v["mode"] then
						exports["target"]:RemCircleZone("Objects:"..Number)
					end

					if DoesEntityExist(Init[Number]) then
						DeleteEntity(Init[Number])
					end

					Init[Number] = nil
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS:REMOVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("objects:Remover")
AddEventHandler("objects:Remover",function(Number)
	Objects[Number] = nil

	if Init[Number] then
		if DoesEntityExist(Init[Number]) then
			DeleteEntity(Init[Number])
		end

		exports["target"]:RemCircleZone("Objects:"..Number)
		Init[Number] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTCONTROLLING
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.ObjectControlling(Model)
	local GroundZ = 0.0
	local Aplication = false
	local ObjectCoords = nil
	local ObjectHeading = 0.0

	if LoadModel(Model) then
		local Progress = true
		local Ped = PlayerPedId()
		local Heading = GetEntityHeading(Ped)
		local Coords = GetOffsetFromEntityInWorldCoords(Ped,0.0,1.0,0.0)
		local NextObject = CreateObjectNoOffset(Model,Coords["x"],Coords["y"],Coords["z"],false,false,false)
		SetEntityHeading(NextObject,Heading)
		SetEntityAlpha(NextObject,175,false)
		PlaceObjectOnGroundProperly(NextObject)
		SetEntityCollision(NextObject,false,false)

		while Progress do
			DrawGraphOutline(NextObject)

			DwText("~g~F~w~  CANCELAR",4,0.015,0.62,0.38,255,255,255,255)
			DwText("~g~E~w~  COLOCAR OBJETO",4,0.015,0.65,0.38,255,255,255,255)
			DwText("~y~PAGE UP~w~  PARA CIMA",4,0.015,0.68,0.38,255,255,255,255)
			DwText("~y~PAGE DOWN~w~  PARA BAIXO",4,0.015,0.71,0.38,255,255,255,255)
			DwText("~y~SCROLL UP~w~  GIRA ESQUERDA",4,0.015,0.74,0.38,255,255,255,255)
			DwText("~y~SCROLL DOWN~w~  GIRA DIREITA",4,0.015,0.77,0.38,255,255,255,255)
			DwText("~y~ARROW UP~w~  PARA LONGE",4,0.015,0.80,0.38,255,255,255,255)
			DwText("~y~ARROW DOWN~w~  PARA PERTO",4,0.015,0.83,0.38,255,255,255,255)
			DwText("~y~ARROW LEFT~w~  PARA ESQUERDA",4,0.015,0.86,0.38,255,255,255,255)
			DwText("~y~ARROW RIGHT~w~  PARA DIREITA",4,0.015,0.89,0.38,255,255,255,255)

			if IsControlJustPressed(1,38) then
				Aplication = true
				Progress = false
			end

			if IsControlJustPressed(0,49) then
				Progress = false
			end

			if IsDisabledControlPressed(1,10) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,0.0,0.0,0.005)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsDisabledControlPressed(1,11) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,0.0,0.0,-0.005)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsDisabledControlPressed(1,172) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,0.0,0.005,0.0)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsDisabledControlPressed(1,173) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,0.0,-0.005,0.0)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsDisabledControlPressed(1,174) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,-0.005,0.0,0.0)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsDisabledControlPressed(1,175) then
				local Coords = GetOffsetFromEntityInWorldCoords(NextObject,0.005,0.0,0.0)
				SetEntityCoordsNoOffset(NextObject,Coords["x"],Coords["y"],Coords["z"],false,false,false)
			end

			if IsControlJustPressed(0,180) then
				local Heading = GetEntityHeading(NextObject)
				SetEntityHeading(NextObject,Heading + 2.5)
			end

			if IsControlJustPressed(0,181) then
				local Heading = GetEntityHeading(NextObject)
				SetEntityHeading(NextObject,Heading - 2.5)
			end

			Wait(1)
		end

		ObjectCoords = GetEntityCoords(NextObject)
		ObjectHeading = GetEntityHeading(NextObject)

		DeleteEntity(NextObject)
	end

	return Aplication,ObjectCoords,ObjectHeading
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function DwText(Text,Font,x,y,Scale,r,g,b,a)
	SetTextFont(Font)
	SetTextScale(Scale,Scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(Text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWGRAPHOUTLINE
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawGraphOutline(Object)
	local Coords = GetEntityCoords(Object)
	local x,y,z = Coords - GetOffsetFromEntityInWorldCoords(Object,2.0,0.0,0.0),Coords - GetOffsetFromEntityInWorldCoords(Object,0.0,2.0,0.0),Coords - GetOffsetFromEntityInWorldCoords(Object,0.0,0.0,2.0)
	local x1,x2,y1,y2,z1,z2 = Coords - x,Coords + x,Coords - y,Coords + y,Coords - z,Coords + z
	DrawLine(x1.x,x1.y,x1.z,x2.x,x2.y,x2.z,255,0,0,255)
	DrawLine(y1.x,y1.y,y1.z,y2.x,y2.y,y2.z,0,0,255,255)
	DrawLine(z1.x,z1.y,z1.z,z2.x,z2.y,z2.z,0,255,0,255)
end