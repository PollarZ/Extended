-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
Use = {
	["bandage"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",5000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.Destroy(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("sounds:Private",source,"bandage",0.5)
							Healths[Passport] = os.time() + 30
							vRP.UpgradeStress(Passport,5)
							vRPC.UpgradeHealth(source,15)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"Atenção","Não pode utilizar de vida cheia.","amarelo",5000)
			end
		else
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.","amarelo",5000)
		end
	end,

	["sulfuric"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRPC.DowngradeHealth(source,100)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chip"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.Secondary(source,"Três primeiros digitos","Três ultimos digitos")
		if Keyboard then
			local Primary = sanitizeString(Keyboard[1],"0123456789",true)
			local Secondary = sanitizeString(Keyboard[2],"0123456789",true)

			if string.len(Primary) == 3 and string.len(Secondary) == 3 then
				if not vRP.UserPhone(Primary.."-"..Secondary) then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.Query("characters/UpdatePhone",{ Phone = Primary.."-"..Secondary, Passport = Passport })
						TriggerEvent("smartphone:updatePhoneNumber",Passport,Primary.."-"..Secondary)
						TriggerClientEvent("Notify",source,false,"Número atualizado.","verde",5000)
					end
				else
					TriggerClientEvent("Notify",source,false,"Número existente.","amarelo",5000)
				end
			else
				TriggerClientEvent("Notify",source,false,"Necessário possuir 6 números.","amarelo",5000)
			end
		end
	end,

	["diagram"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local MaxWeight = 100
		if vRP.UserPremium(Passport) then
			MaxWeight = 125
		end

		if (vRP.GetWeight(Passport) + (5 * Amount)) <= MaxWeight and vRP.TakeItem(Passport,Full,Amount,true,Slot) then
			vRP.SetWeight(Passport,5 * Amount,"+")
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end,

	["analgesic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.Destroy(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,3)
							vRPC.UpgradeHealth(source,8)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"Aviso","Não pode utilizar de vida cheia.","amarelo",5000)
			end
		else
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.","amarelo",5000)
		end
	end,

	["oxy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vPARAMEDIC.Oxycontin(source)
					TriggerClientEvent("Oxycontin",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["vehkey"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Vehicle,Network,Plate = vRPC.VehicleList(source,5)
		if Vehicle then
			if Plate == Split[2] then
				TriggerEvent("garages:LockVehicle",source,Network)
			end
		end
	end,

	["camera"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Camera"] then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end

			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Camera",source,false)
			vRPC.CreateObjects(source,"amb@world_human_paparazzi@male@base","base","prop_pap_camera_01",49,28422)
		end
	end,

	["binoculars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Camera"] then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end

			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Camera",source,true)
			vRPC.CreateObjects(source,"amb@world_human_binoculars@male@enter","enter","prop_binoc_01",49,28422)
		end
	end,

	["suitcase"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"suitcase:"..Split[3],"Item")
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["cupholder"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"cupholder:"..Split[3],"Item")
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["treasurebox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"treasurebox:"..Split[3],"Item",Full)
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["backpackp"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"backpackp:"..Split[3],"Item")
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["backpackm"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"backpackm:"..Split[3],"Item")
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["backpackg"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split and Split[3] then
			TriggerClientEvent("chest:Open",source,"backpackg:"..Split[3],"Item")
			TriggerClientEvent("inventory:Close",source)
		end
	end,

	["newchars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			vRP.UpgradeCharacters(source)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			TriggerClientEvent("Notify",source,"Sucesso","Personagem liberado.","verde",5000)
		end
	end,

	["gemstone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
			vRP.UpgradeGemstone(Passport,Amount,false)
		end
	end,

	["namechange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.Secondary(source,"Nome","Sobrenome")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("Notify",source,"Sucesso","Passaporte atualizado.","verde",5000)
				TriggerClientEvent("inventory:Update",source,"Backpack")
				vRP.UpgradeNames(Passport,Keyboard[1],Keyboard[2])
			end
		end
	end,

	["pokeball"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		vRPC.Destroy(source)
		Active[Passport] = nil
		Player(source)["state"]["Buttons"] = false

		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			local Randomize = math.random(151)
			local NameItem = NumberPokemon(Randomize)

			vRP.GenerateItem(Passport,"pokemon"..NameItem,1)

			local Players = vRPC.Players(source)
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("showme:pressMe",v,source,"<img src='nui://vrp/config/inventory/pokemon"..NameItem..".png'>",5,true)
				end)
			end
		end
	end,

	["soap"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPLAYER.checkSoap(source) ~= nil then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",10000)
			vRPC.playAnim(source,false,{"amb@world_human_bum_wash@male@high@base","base"},true)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("player:Residuals",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["joint"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.CreateObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.WeedTimer(Passport,120)
						vRP.DowngradeThirst(Passport,40)
						vRP.DowngradeHunger(Passport,40)
						vRP.DowngradeStress(Passport,20)
						TriggerClientEvent("Joint",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["metadone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Metadone",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["heroin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Heroin",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["crack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					TriggerClientEvent("Crack",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cocaine"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Cheirando",5000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,120)
					vRP.DowngradeStress(Passport,20)
					TriggerClientEvent("Cocaine",source)
					TriggerClientEvent("Energetic",source,15,1.25)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["meth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] and os.time() < Armors[Passport] then
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Armors[Passport] - os.time().."</b> segundos.","amarelo",5000)
			return
		end

		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",15000)
		vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Methamphetamine",source)
					Armors[Passport] = os.time() + 90
					vRP.ChemicalTimer(Passport,120)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cigarette"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.CreateObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.DowngradeStress(Passport,10)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["vape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 20
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Fumando",20000)
		vRPC.CreateObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","ba_prop_battle_vape_01",49,18905,0.08,-0.00,0.03,-150.0,90.0,-10.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				vRP.DowngradeStress(Passport,20)
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["medkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 then
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",10000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.Destroy(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 60
							vRPC.UpgradeHealth(source,40)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"Aviso","Não pode utilizar de vida cheia.","amarelo",5000)
			end
		else
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Healths[Passport] - os.time().."</b> segundos.","amarelo",5000)
		end
	end,

	["gauze"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPARAMEDIC.Bleeding(source) > 0 then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Passando",3000)
			vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vPARAMEDIC.Bandage(source)
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"Aviso","Nenhum ferimento encontrado.","amarelo",5000)
		end
	end,

	["teddy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end,

	["rose"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
	end,

	["firecracker"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) and not vCLIENT.checkCracker(source) then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Acendendo",3000)
			vRPC.playAnim(source,false,{"anim@mp_fireworks","place_firework_3_box"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.stopAnim(source,false)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("inventory:Firecracker",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["gsrkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",5000)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Informations = vPLAYER.checkSoap(ClosestPed)
						if Informations then
							local Number = 0
							local Message = ""

							for Value,v in pairs(Informations) do
								Number = Number + 1
								Message = Message.."<b>"..Number.."</b>: "..Value.."<br>"
							end

							TriggerClientEvent("Notify",source,"Informações",Message,"verde",10000)
						else
							TriggerClientEvent("Notify",source,"Aviso","Nenhum resultado encontrado.","amarelo",5000)
						end
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["gdtkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			local OtherPassport = vRP.Passport(ClosestPed)
			local Identity = vRP.Identity(OtherPassport)
			if OtherPassport and Identity then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Usando",5000)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local weed = vRP.WeedReturn(OtherPassport)
							local chemical = vRP.ChemicalReturn(OtherPassport)
							local alcohol = vRP.AlcoholReturn(OtherPassport)

							local chemStr = ""
							local alcoholStr = ""
							local weedStr = ""

							if chemical == 0 then
								chemStr = "Nenhum"
							elseif chemical == 1 then
								chemStr = "Baixo"
							elseif chemical == 2 then
								chemStr = "Médio"
							elseif chemical >= 3 then
								chemStr = "Alto"
							end

							if alcohol == 0 then
								alcoholStr = "Nenhum"
							elseif alcohol == 1 then
								alcoholStr = "Baixo"
							elseif alcohol == 2 then
								alcoholStr = "Médio"
							elseif alcohol >= 3 then
								alcoholStr = "Alto"
							end

							if weed == 0 then
								weedStr = "Nenhum"
							elseif weed == 1 then
								weedStr = "Baixo"
							elseif weed == 2 then
								weedStr = "Médio"
							elseif weed >= 3 then
								weedStr = "Alto"
							end

							TriggerClientEvent("Notify",source,"Informações","<b>Químicos:</b> "..chemStr.."<br><b>Álcool:</b> "..alcoholStr.."<br><b>Drogas:</b> "..weedStr,"azul",8000)
						end
					end

					Wait(100)
				until not Active[Passport]
			end
		end
	end,

	["nitro"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Trocando",10000)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.Destroy(source)
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Vehicle = NetworkGetEntityFromNetworkId(Network)
							Entity(Vehicle)["state"]:set("Nitro",2000,true)
						end
					end

					Wait(100)
				until not Active[Passport]

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end
			end
		end
	end,

	["vest"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] and os.time() < Armors[Passport] then
			TriggerClientEvent("Notify",source,"Atenção","Aguarde <b>"..Armors[Passport] - os.time().."</b> segundos.","amarelo",5000)
			return
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Vestindo",10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.Destroy(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					Armors[Passport] = os.time() + 1800
					vRP.SetArmour(source,100)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["GADGET_PARACHUTE"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Usando",3000)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vCLIENT.Parachute(source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["advtoolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vRP.Task(source,5,10000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,"Reparando",15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairBoosts",v,Network,Plate)
									end)
								end

								local Number = parseInt(Split[2]) - 1

								if Number >= 1 then
									vRP.GiveItem(Passport,"advtoolbox-"..Number,1,false)
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.Destroy(source)
			end
		end
	end,

	["toolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vRP.Task(source,5,10000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,"Reparando",15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairBoosts",v,Network,Plate)
									end)
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.Destroy(source)
			end
		end
	end,

	["drift"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local Vehicle,Network,Plate,Model,Class = vRPC.VehicleList(source,4)
			if Vehicle and (Class <= 7 or Class == 9) then
				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"open")
					end)
				end

				if vRP.Task(source,5,50000) then
					Active[Passport] = os.time() + 15
					TriggerClientEvent("Progress",source,"Instalando",15000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Networked = NetworkGetEntityFromNetworkId(Network)
								Entity(Networked)["state"]:set("Drift",true,true)

								if vRP.PassportPlate(Plate) then
									vRP.Query("vehicles/Drift",{ Plate = Plate })
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				end

				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("player:VehicleHood",v,Network,"close")
					end)
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.Destroy(source)
			end
		end
	end,

	["lockpick"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate,Model,Class = vRPC.VehicleList(source,4)
			if Vehicle then
				if Model == "stockade" or Class == 15 or Class == 16 or Class == 19 then
					return
				end

				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				vGARAGE.RegisterDecors(source,Vehicle)
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				local Networked = NetworkGetEntityFromNetworkId(Network)

				if vRP.InsideVehicle(source) then
					vGARAGE.StartHotwired(source)

					if vRP.Task(source,10,10000) then
						if not vRP.PassportPlate(Plate) then
							Entity(Networked)["state"]:set("Lockpick",Passport,true)
							Entity(Networked)["state"]:set("Fuel",100,true)
							Entity(Networked)["state"]:set("Nitro",0,true)
							SetVehicleDoorsLocked(Networked,1)
						else
							if math.random(100) >= 75 then
								SetVehicleDoorsLocked(Networked,1)
							end
						end

						if math.random(100) >= 25 then
							TriggerEvent("Wanted",source,Passport,300)

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

					vGARAGE.StopHotwired(source,Vehicle)
				else
					vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)

					if Dismantle[Plate] then
						if vRP.Task(source,10,10000) then
							Active[Passport] = os.time() + 15
							TriggerClientEvent("dismantle:Dispatch",source)
							TriggerClientEvent("Progress",source,"Roubando",15000)

							repeat
								if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
									Active[Passport] = nil

									SetVehicleDoorsLocked(Networked,1)
									TriggerClientEvent("target:Dismantle",source,Model)
									Entity(Networked)["state"]:set("Lockpick",Passport,true)
								end

								Wait(100)
							until not Active[Passport]
						end
					else
						if vRP.Task(source,10,10000) then
							if not vRP.PassportPlate(Plate) then
								Entity(Networked)["state"]:set("Lockpick",Passport,true)
								Entity(Networked)["state"]:set("Fuel",100,true)
								Entity(Networked)["state"]:set("Nitro",0,true)
								SetVehicleDoorsLocked(Networked,1)
							else
								if math.random(100) >= 75 then
									SetVehicleDoorsLocked(Networked,1)
								end
							end

							if math.random(100) >= 25 then
								TriggerEvent("Wanted",source,Passport,300)

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
					end
				end

				Player(source)["state"]["Buttons"] = false
				Active[Passport] = nil
				vRPC.Destroy(source)

				if math.random(1000) >= 900 then
					vRP.RemoveItem(Passport,Full,1,true)
				end
			else
				local Coords = vRP.GetEntityCoords(source)
				local Name = exports["propertys"]:Proximity(Coords)

				if Name then
					TriggerClientEvent("inventory:Close",source)

					if vRP.HasService(Passport,"Policia") or vRP.Task(source,10,10000) then
						if not Property[Name] then
							local Consult = vRP.Query("propertys/Exist",{ Name = Name })
							if Consult[1] then
								Property[Name] = Consult[1]["Interior"]
							else
								local Interiors = exports["propertys"]:Interiors()
								Property[Name] = Interiors[math.random(#Interiors)]
							end
						end

						if exports["party"]:DoesExist(Passport) then
							local Members = exports["party"]:Room(Passport,source,5)
							for _,v in pairs(Members) do
								if vRP.Passport(v["Source"]) then
									TriggerClientEvent("propertys:Enter",v["Source"],Name,Property[Name])
								end
							end
						else
							TriggerClientEvent("propertys:Enter",source,Name,Property[Name])
						end
					else
						if math.random(100) >= 25 then
							TriggerEvent("Wanted",source,Passport,300)

							local Service = vRP.NumPermission("Policia")
							for Passports,Sources in pairs(Service) do
								async(function()
									vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
									TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Propriedade", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 44 })
								end)
							end
						end
					end

					if math.random(1000) >= 900 then
						vRP.RemoveItem(Passport,Full,1,true)
					end
				end
			end
		else
			if vRP.Task(source,5,2500) then
				Player(source)["state"]["Handcuff"] = false
				Player(source)["state"]["Commands"] = false
				TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
			end

			vRP.RemoveItem(Passport,Full,1,true)
		end
	end,

	["blocksignal"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle and vRP.InsideVehicle(source) then
				if not exports["garages"]:Signal(Plate) then
					vRPC.AnimActive(source)
					vGARAGE.StartHotwired(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)

					if vRP.Task(source,3,10000) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("Notify",source,"Sucesso","<b>Bloqueador de Sinal</b> instalado.","verde",5000)
							TriggerEvent("SignalRemove",Plate)
						end
					end

					Player(source)["state"]["Buttons"] = false
					vGARAGE.StopHotwired(source)
					Active[Passport] = nil
				else
					TriggerClientEvent("Notify",source,"Aviso","<b>Bloqueador de Sinal</b> já instalado.","amarelo",5000)
				end
			end
		end
	end,

	["postit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("postit:initPostit",source)
	end,

	["absolut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hennessy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chandon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["dewars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,30)
					vRP.UpgradeThirst(Passport,10)
					TriggerClientEvent("Drunk",source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["orangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["passionjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.DowngradeStress(Passport,20)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["grapejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["strawberryjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["bananajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["acerolajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["water"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					vRP.UpgradeThirst(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["coffee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.05)
					vRP.UpgradeThirst(Passport,7)
					vRP.UpgradeStress(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["guarananatural"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_food_bs_juice02",49,28422,0.0,-0.01,-0.15,0.0,0.0,0.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sinkalmy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
					vRP.DowngradeStress(Passport,25)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["ritmoneury"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
					vRP.DowngradeStress(Passport,50)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,7)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["energetic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",15000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,30,1.20)
					vRP.UpgradeThirst(Passport,10)
					vRP.UpgradeStress(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["soda"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","ng_proc_sodacan_01b",49,60309,0.0,0.0,-0.04,0.0,0.0,130.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,7)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["fishingrod"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.Fishing(source) then
			Active[Passport] = os.time() + 100
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			if not vRPC.PlayingAnim(source,"amb@world_human_stand_fishing@idle_a","idle_c") then
				vRPC.AnimActive(source)
				vRPC.CreateObjects(source,"amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",49,60309)
			end

			local Experience = vRP.GetExperience(Passport,"Fisherman")
			local Level = ClassCategory(Experience)
			local Velocity = 100000
			local AmountTasks = 5

			if Level == 2 then
				AmountTasks = 5
				Velocity = 90000
			elseif Level == 3 then
				AmountTasks = 5
				Velocity = 85000
			elseif Level == 4 then
				AmountTasks = 4
				Velocity = 80000
			elseif Level == 5 then
				AmountTasks = 4
				Velocity = 75000
			elseif Level == 6 then
				AmountTasks = 4
				Velocity = 70000
			elseif Level == 7 then
				AmountTasks = 3
				Velocity = 65000
			elseif Level == 8 then
				AmountTasks = 3
				Velocity = 60000
			elseif Level == 9 then
				AmountTasks = 3
				Velocity = 55000
			elseif Level == 10 then
				AmountTasks = 2
				Velocity = 50000
			end

			if vRP.Task(source,AmountTasks,Velocity) then
				local List = { "anchovy","catfish","herring","orangeroughy","salmon","sardine","smalltrout","yellowperch" }
				local Random = math.random(#List)
				local Rand = math.random(1000)
				local Selected = List[Random]

				if Rand >= 985 then
					Selected = "treasurebox"
				elseif Rand >= 925 and Rand <= 984 then
					Selected = "smallshark"
				end

				if (vRP.InventoryWeight(Passport) + itemWeight(Selected)) <= vRP.GetWeight(Passport) then
					if vRP.TakeItem(Passport,"worm",1) then
						vRP.PutExperience(Passport,"Fisherman",1)
						vRP.GenerateItem(Passport,Selected,1,true)
					else
						TriggerClientEvent("Notify",source,"Atenção","Precisa de <b>1x "..itemName("worm").."</b>.","amarelo",5000)
					end
				else
					TriggerClientEvent("Notify",source,"Aviso","Mochila cheia.","amarelo",5000)
				end
			end

			Player(source)["state"]["Buttons"] = false
			Active[Passport] = nil
		end
	end,

	["coffeemilk"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,10,1.10)
					vRP.UpgradeThirst(Passport,20)
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzamozzarella"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice1",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzabanana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice2",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzachocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","knjgh_pizzaslice3",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["nigirizushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["calzone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chickenfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cookies"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["onionrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger3"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["ration"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) and not vCLIENT.CheckRation(source) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Colocando",10000)
			vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					vRPC.Destroy(source)
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("inventory:Ration",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["barrier"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.CheckInterior(source) then
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			local Hash = "prop_mp_barrier_02b"
			local Application,Coords,Heading = vRPC.ObjectControlling(source,Hash)
			if Application and not vCLIENT.ObjectExists(source,Coords,Hash) and vRP.TakeItem(Passport,Full,1,true,Slot) then
				local Number = 0

				repeat
					Number = Number + 1
				until not Objects[tostring(Number)]

				Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100, mode = "1" }
				TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
			end

			Player(source)["state"]["Buttons"] = false
		end
	end,

	["medicbag"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.CheckInterior(source) then
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)

			local Hash = "xm_prop_x17_bag_med_01a"
			local Application,Coords,Heading = vRPC.ObjectControlling(source,Hash)
			if Application and not vCLIENT.ObjectExists(source,Coords,Hash) and vRP.TakeItem(Passport,Full,1,true,Slot) then
				local Number = 0

				repeat
					Number = Number + 1
				until not Objects[tostring(Number)]

				Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 50, mode = "2" }
				TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
			end

			Player(source)["state"]["Buttons"] = false
		end
	end,

	["hotdog"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_hotdog_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sandwich"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_sandwich_01",49,18905,0.13,0.05,0.02,-50.0,16.0,60.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tacos"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_taco_01",49,18905,0.16,0.06,0.02,-50.0,220.0,60.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["fries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["friesbacon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkshake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkshakepeanut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cappuccino"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a", "idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["applelove"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,20)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cupcake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source) then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",900)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
					vRP.DowngradeStress(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["donut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_amb_donut",49,28422)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["dismantle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.Dismantle(source) and vRP.TakeItem(Passport,Full,1,true,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
		end
	end,

	["tyres"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if not vCLIENT.CheckWeapon(source,"WEAPON_WRENCH") then
				TriggerClientEvent("Notify",source,"Atenção","<b>Chave Inglesa</b> não encontrada.","amarelo",5000)
				return
			end

			local Vehicle,Tyre,Network,Plate = vCLIENT.Tyres(source)
			if Vehicle then
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"amb@medic@standing@kneel@idle_a","idle_a"},true)
				vRPC.CreateObjects(source,"anim@heists@box_carry@","idle","imp_prop_impexp_tyre_01a",49,28422,-0.02,-0.1,0.2,10.0,0.0,0.0)

				if vRP.Task(source,3,7500) then
					Active[Passport] = os.time() + 10
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,"Colocando",10000)

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							Player(source)["state"]["Buttons"] = false

							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:RepairTyres",v,Network,Tyre,Plate)
									end)
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				end

				vRPC.Destroy(source)
			end
		end
	end,

	["premiumplate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.InsideVehicle(source) then
			TriggerClientEvent("inventory:Close",source)

			local Model = vRPC.VehicleName(source)
			local Vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, Vehicle = Model })
			if Vehicle[1] then
				local Keyboard = vKEYBOARD.Primary(source,"Placa")
				if Keyboard then
					local Plate = sanitizeString(Keyboard[1],"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",true)

					if string.len(Plate) ~= 8 then
						TriggerClientEvent("Notify",source,"Aviso","Nome de definição inválido.","amarelo",5000)
						return
					else
						if vRP.PassportPlate(Plate) then
							TriggerClientEvent("Notify",source,"Aviso","Placa escolhida já existe no sistema.","amarelo",5000)
							return
						else
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								vRP.Query("vehicles/plateVehiclesUpdate",{ Passport = Passport, Vehicle = Model, Plate = string.upper(Plate) })
								TriggerClientEvent("Notify",source,"Sucesso","Placa atualizada.","verde",5000)
							end
						end
					end
				end
			else
				TriggerClientEvent("Notify",source,"Aviso","Modelo de veículo não encontrado.","amarelo",5000)
			end
		end
	end,

	["radio"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("radio:Open",source)
		vRPC.AnimActive(source)
	end,

	["scuba"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("hud:Scuba",source)
	end,

	["handcuff"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			local ClosestPed = vRPC.ClosestPed(source,2)
			if ClosestPed and not vRP.IsEntityVisible(ClosestPed) then
				Player(source)["state"]["Cancel"] = true
				Player(source)["state"]["Buttons"] = true

				if Player(ClosestPed)["state"]["Handcuff"] then
					Player(ClosestPed)["state"]["Handcuff"] = false
					Player(ClosestPed)["state"]["Commands"] = false
					TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"uncuff",0.5)

					vRPC.Destroy(ClosestPed)
					vRPC.Destroy(source)
				else
					if vRP.GetHealth(ClosestPed) > 100 then
						TriggerEvent("inventory:ServerCarry",source,Passport,ClosestPed,true)
						vRPC.playAnim(source,false,{"mp_arrest_paired","cop_p2_back_left"},false)
						vRPC.playAnim(ClosestPed,false,{"mp_arrest_paired","crook_p2_back_left"},false)

						SetTimeout(3500,function()
							TriggerEvent("inventory:ServerCarry",source,Passport)
							TriggerClientEvent("sounds:Private",source,"cuff",0.5)
							TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)

							vRPC.Destroy(ClosestPed)
							vRPC.Destroy(source)
						end)
					else
						TriggerClientEvent("sounds:Private",source,"cuff",0.5)
						TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)
					end

					Player(ClosestPed)["state"]["Handcuff"] = true
					Player(ClosestPed)["state"]["Commands"] = true
					TriggerClientEvent("inventory:Close",ClosestPed)
					TriggerClientEvent("radio:RadioClean",ClosestPed)
				end

				Player(source)["state"]["Cancel"] = false
				Player(source)["state"]["Buttons"] = false
			end
		end
	end,

	["hood"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local OtherSource = vRPC.ClosestPed(source,2)
		if OtherSource and Player(OtherSource)["state"]["Handcuff"] then
			TriggerClientEvent("hud:Hood",OtherSource)
			TriggerClientEvent("inventory:Close",OtherSource)
		end
	end,

	["rope"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if not Carry[Passport] then
				local OtherSource = vRPC.ClosestPed(source,2)
				local OtherPassport = vRP.Passport(OtherSource)
				if OtherSource and not Carry[OtherPassport] and vRP.GetHealth(OtherSource) <= 100 and not vRP.IsEntityVisible(OtherSource) then
					Carry[Passport] = OtherSource
					Player(source)["state"]["Carry"] = true
					Player(OtherSource)["state"]["Carry"] = true
					TriggerClientEvent("inventory:Carry",OtherSource,source,"Attach")
				end
			else
				if vRP.DoesEntityExist(Carry[Passport]) then
					TriggerClientEvent("inventory:Carry",Carry[Passport],source,"Detach")
					Player(Carry[Passport])["state"]["Carry"] = false
				end

				Player(source)["state"]["Carry"] = false
				Carry[Passport] = nil
			end
		end
	end,

	["premium"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.SetPremium(source)
				vRP.SetPermission(Passport,"Premium")
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			if vRP.HasPermission(Passport,"Premium") and vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.UpgradePremium(source)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		end
	end,

	["pager"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed and Player(ClosestPed)["state"]["Handcuff"] then
			local OtherPassport = vRP.Passport(ClosestPed)
			if OtherPassport then
				if vRP.HasService(OtherPassport,"Policia") then
					TriggerEvent("Wanted",source,Passport,600)

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.ServiceLeave(ClosestPed,OtherPassport,"Policia",true)
						TriggerClientEvent("Notify",source,"Sucesso","Todas as comunicações foram retiradas.","verde",5000)
					end
				end

				if vRP.HasService(OtherPassport,"Paramedico") then
					TriggerEvent("Wanted",source,Passport,600)

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.ServiceLeave(ClosestPed,OtherPassport,"Paramedico",true)
						TriggerClientEvent("Notify",source,"Sucesso","Todas as comunicações foram retiradas.","verde",5000)
					end
				end
			end
		end
	end
}