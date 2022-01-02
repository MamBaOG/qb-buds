local QBCore = exports["qb-core"]:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        QBCore.Functions.GetPlayerData(function(PlayerData)
	PlayerJob = PlayerData.job
	if PlayerData.job.onduty then
	    if Player.PlayerData.job.name == "bestbuds" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    	onDuty = duty
end)

RegisterNetEvent("qb-buds:DutyBuds")
AddEventHandler("qb-buds:DutyBuds", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-buds:Tray1")
AddEventHandler("qb-buds:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "budstray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "budstray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-buds:shop")
AddEventHandler("qb-buds:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "bestbuds", Config.Items)
end)

RegisterNetEvent("qb-buds:Storage")
AddEventHandler("qb-buds:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "BudsStorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "BudsStorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-buds:ak47")
AddEventHandler("qb-buds:ak47", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientak47', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making AK 47 Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "weed_ak47", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "joint_ak47", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint_ak47"], "add")
                    			QBCore.Functions.Notify("You made a Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:bph")
AddEventHandler("qb-buds:bph", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientbph', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Purple Haze Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "weed_purple-haze", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "joint_bph", 1)					
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint_bph"], "add")
                    			QBCore.Functions.Notify("You made a Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:ogk")
AddEventHandler("qb-buds:ogk", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientogk', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making OG Kush Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "weed_og-kush", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
				        TriggerServerEvent('QBCore:Server:AddItem', "joint_ogk", 1)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint_ogk"], "add")
                    			QBCore.Functions.Notify("You made a Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-buds:ww")
AddEventHandler("qb-buds:ww", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientww', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making White Widow Strain Joint..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "weed_white-widow", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "joint_ww", 1)					
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint_ww"], "add")
                    			QBCore.Functions.Notify("You made a Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)
