-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Mask = nil
local Tank = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SCUBAREMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:ScubaRemove")
AddEventHandler("hud:ScubaRemove",function()
	if Mask and DoesEntityExist(Mask) then
		TriggerServerEvent("DeleteObject",ObjToNet(Mask))
		Mask = nil
	end

	if Tank and DoesEntityExist(Tank) then
		TriggerServerEvent("DeleteObject",ObjToNet(Tank))
		Tank = nil
	end

	SetEnableScuba(PlayerPedId(),false)
	SetPedMaxTimeUnderwater(PlayerPedId(),10.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SCUBA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Scuba")
AddEventHandler("hud:Scuba",function()
	if Mask or Tank then
		TriggerEvent("hud:ScubaRemove")
	else
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		local Progression,Network = vRPS.CreateObject("p_s_scuba_tank_s",Coords["x"],Coords["y"],Coords["z"])
		if Progression then
			Tank = LoadNetwork(Network)
			if Tank then
				AttachEntityToEntity(Tank,Ped,GetPedBoneIndex(Ped,24818),-0.28,-0.24,0.0,180.0,90.0,0.0,true,true,false,true,2,true)
				SetModelAsNoLongerNeeded("p_s_scuba_tank_s")
			end
		end

		local Progression,Network = vRPS.CreateObject("p_s_scuba_mask_s",Coords["x"],Coords["y"],Coords["z"])
		if Progression then
			Mask = LoadNetwork(Network)
			if Mask then
				AttachEntityToEntity(Mask,Ped,GetPedBoneIndex(Ped,12844),0.0,0.0,0.0,180.0,90.0,0.0,true,true,false,true,2,true)
				SetModelAsNoLongerNeeded("p_s_scuba_mask_s")
			end
		end

		SetEnableScuba(Ped,true)
		SetPedMaxTimeUnderwater(Ped,9999.0)
	end
end)