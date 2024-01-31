-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("hud",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
Display = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Hood = false
local Gemstone = 0
local Pause = false
local Road = "Alta Street"
local Crossing = "Alta Street"
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRINCIPAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Health = 999
local Armour = 999
-----------------------------------------------------------------------------------------------------------------------------------------
-- THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
local Thirst = 999
local ThirstTimer = 0
local ThirstAmount = 90000
local ThirstDelay = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
local Hunger = 999
local HungerTimer = 0
local HungerAmount = 90000
local HungerDelay = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
local Stress = 999
local StressTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
local Wanted = 0
local WantedMax = 0
local WantedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
local Reposed = 0
local ReposedMax = 0
local ReposedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
local Luck = 0
local LuckTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
local Dexterity = 0
local DexterityTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
local Rolepass = 60
local RolepassTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()

			if IsPauseMenuActive() then
				if not Pause and Display then
					SendNUIMessage({ name = "Body", payload = false })
					Pause = true
				end
			else
				if Display then
					if Pause then
						SendNUIMessage({ name = "Body", payload = true })
						Pause = false
					end

					local Coords = GetEntityCoords(Ped)
					local Armouring = GetPedArmour(Ped)
					local Healing = GetEntityHealth(Ped) - 100
					local MinRoad,MinCross = GetStreetNameAtCoord(Coords["x"],Coords["y"],Coords["z"])
					local FullRoad = GetStreetNameFromHashKey(MinRoad)
					local FullCross = GetStreetNameFromHashKey(MinCross)

					if GetEntityMaxHealth(Ped) ~= 200 then
						if Health ~= parseInt(Healing * 0.66) then
							Healing = parseInt(Healing * 0.66)

							if Healing > 100 then
								Healing = 100
							end

							SendNUIMessage({ name = "Health", payload = Healing })
							Health = Healing
						end
					else
						if Healing > 100 then
							SetEntityHealth(Ped,200)
							Healing = 100
						end

						if Health ~= Healing then
							SendNUIMessage({ name = "Health", payload = Healing })
							Health = Healing
						end
					end

					if Armour ~= Armouring then
						SendNUIMessage({ name = "Armour", payload = Armouring })
						Armour = Armouring
					end

					if FullRoad ~= "" and Road ~= FullRoad then
						SendNUIMessage({ name = "Road", payload = FullRoad })
						Road = FullRoad
					end

					if FullCross ~= "" and Crossing ~= FullCross then
						SendNUIMessage({ name = "Crossing", payload = FullCross })
						Crossing = FullCross
					end

					SendNUIMessage({ name = "Clock", payload = { GlobalState["Hours"],GlobalState["Minutes"] } })
				end
			end

			if Luck > 0 and LuckTimer <= GetGameTimer() then
				Luck = Luck - 1
				LuckTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Luck", payload = Luck })
			end

			if Dexterity > 0 and DexterityTimer <= GetGameTimer() then
				Dexterity = Dexterity - 1
				DexterityTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Dexterity", payload = Dexterity })
			end

			if Wanted > 0 and WantedTimer <= GetGameTimer() then
				Wanted = Wanted - 1
				WantedTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Wanted", payload = { Wanted,WantedMax } })
			end

			if Reposed > 0 and ReposedTimer <= GetGameTimer() then
				Reposed = Reposed - 1
				ReposedTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Reposed", payload = { Reposed,ReposedMax } })
			end

			if GetEntityHealth(Ped) > 100 then
				if Hunger < 15 and HungerTimer <= GetGameTimer() then
					HungerTimer = GetGameTimer() + 10000
					ApplyDamageToPed(Ped,math.random(2),false)
					TriggerEvent("Notify",false,"Sofrendo com a fome.","fome",2500)
				end

				if Thirst < 15 and ThirstTimer <= GetGameTimer() then
					ThirstTimer = GetGameTimer() + 10000
					ApplyDamageToPed(Ped,math.random(2),false)
					TriggerEvent("Notify",false,"Sofrendo com a sede.","sede",2500)
				end

				if Stress >= 40 and StressTimer <= GetGameTimer() then
					StressTimer = GetGameTimer() + 10000

					AnimpostfxPlay("MenuMGIn")
					SetTimeout(1500,function()
						AnimpostfxStop("MenuMGIn")
					end)
				end

				if Hunger > 0 and HungerDelay <= GetGameTimer() then
					SendNUIMessage({ name = "Hunger", payload = Hunger - 1 })
					HungerDelay = GetGameTimer() + HungerAmount
					vRPS.DowngradeHunger()
					Hunger = Hunger - 1
				end

				if Thirst > 0 and ThirstDelay <= GetGameTimer() then
					SendNUIMessage({ name = "Thirst", payload = Thirst - 1 })
					ThirstDelay = GetGameTimer() + ThirstAmount
					vRPS.DowngradeThirst()
					Thirst = Thirst - 1
				end

				if Rolepass > 0 and RolepassTimer <= GetGameTimer() then
					Rolepass = Rolepass - 1
					RolepassTimer = GetGameTimer() + 60000

					if Rolepass <= 0 then
						vRPS.RolepassPoints()
						Rolepass = 60
					end
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:PASSPORT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Passport",function(Number)
	SendNUIMessage({ name = "Passport", payload = Number })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("Safezone",("player:%s"):format(LocalPlayer["state"]["Player"]),function(Name,Key,Value)
	SendNUIMessage({ name = "Safezone", payload = Value })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOIP
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Voip",function(Number)
	local Target = { "Baixo","Normal","Médio","Alto" }

	SendNUIMessage({ name = "Voip", payload = Target[Number] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOICE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Voice",function(Status)
	SendNUIMessage({ name = "Voice", payload = Status })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Wanted")
AddEventHandler("hud:Wanted",function(Seconds)
	WantedMax = Seconds
	Wanted = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Wanted",function()
	return Wanted > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Reposed")
AddEventHandler("hud:Reposed",function(Seconds)
	ReposedMax = Seconds
	Reposed = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Reposed",function()
	return Reposed > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Active",function(Status)
	SendNUIMessage({ name = "Body", payload = Status })
	Display = Status

	if not Display and IsMinimapRendering() then
		DisplayRadar(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud",function()
	Display = not Display
	SendNUIMessage({ name = "Body", payload = Display })

	if not Display and IsMinimapRendering() then
		DisplayRadar(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress",function(Message,Timer)
	SendNUIMessage({ name = "Progress", payload = Timer - 500 })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Thirst")
AddEventHandler("hud:Thirst",function(Number)
	if Thirst ~= Number then
		SendNUIMessage({ name = "Thirst", payload = Number })
		Thirst = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Hunger")
AddEventHandler("hud:Hunger",function(Number)
	if Hunger ~= Number then
		SendNUIMessage({ name = "Hunger", payload = Number })
		Hunger = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Stress")
AddEventHandler("hud:Stress",function(Number)
	if Stress ~= Number then
		SendNUIMessage({ name = "Stress", payload = Number })
		Stress = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Luck")
AddEventHandler("hud:Luck",function(Seconds)
	Luck = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Dexterity")
AddEventHandler("hud:Dexterity",function(Seconds)
	Dexterity = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ADDGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:AddGemstone")
AddEventHandler("hud:AddGemstone",function(Number)
	Gemstone = Gemstone + Number

	SendNUIMessage({ name = "Gemstone", payload = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveGemstone")
AddEventHandler("hud:RemoveGemstone",function(Number)
	Gemstone = Gemstone - Number

	if Gemstone < 0 then
		Gemstone = 0
	end

	SendNUIMessage({ name = "Gemstone", payload = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:Radio",function(Frequency)
	SendNUIMessage({ name = "Frequency", payload = Frequency })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Health",function()
	Health = 999
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Hunger",function(Value)
	HungerAmount = Value
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Thirst",function(Value)
	ThirstAmount = Value
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Hood")
AddEventHandler("hud:Hood",function()
	if Hood then
		DoScreenFadeIn(0)
		Hood = false
	else
		DoScreenFadeOut(0)
		Hood = true
	end
end)