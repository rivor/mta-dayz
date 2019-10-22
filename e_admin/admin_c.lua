setElementData(localPlayer,"dutyMode",false)
defaultBlood = nil;

function main()
	function dutyMode()
		if not getElementData(localPlayer,"dutyMode") then
			setElementData(localPlayer,"dutyMode",true)
			guiSetText(labelDutyText,"ON")
			guiLabelSetColor(labelDutyText, 0, 255, 0)
			SupermanStart()
			defaultBlood = getElementData(localPlayer,"blood")
			dutyInvincibility(true)
			setElementData(localPlayer,"zombie",true)
		else
			setElementData(localPlayer,"dutyMode",false)
			guiSetText(labelDutyText,"OFF")
			guiLabelSetColor(labelDutyText, 255, 0, 0)
			SupermanStop()
			dutyInvincibility(false)
			setElementData(localPlayer,"zombie",false)
		end
	end

	function drawTextOnDuty()
		local players = getElementsByType("player");
		for i,player in ipairs(players) do
			if getElementData(player,"dutyMode") then
				-- shadow
				dxDrawTextOnElement(player,"Duty Mode",0.4,20,0,0,0,255,1.42,"sans")
				-- text
				dxDrawTextOnElement(player,"Duty Mode",0.41,20,255,255,255,255,1.4,"sans")
	  		end
  		end
	end
	addEventHandler("onClientRender",root,drawTextOnDuty)

	function dutyInvincibility(state)
		if state then
			setElementData(localPlayer,"blood",54000)
			setElementData(localPlayer,"brokenbone",false)
			setElementData(localPlayer,"temperature",37)
			setElementData(localPlayer,"bleeding",0)
			setElementData(localPlayer,"pain",false)
			function invincibility()
				setElementData(localPlayer,"blood",54000)
				setElementData(localPlayer,"brokenbone",false)
				setElementData(localPlayer,"temperature",37)
				setElementData(localPlayer,"bleeding",0)
				setElementData(localPlayer,"pain",false)
			end
			addEventHandler("onClientPlayerDamage",localPlayer,invincibility)
			addEventHandler("onClientElementDataChange",localPlayer,invincibility)
		else
			removeEventHandler("onClientPlayerDamage",localPlayer,invincibility)
			removeEventHandler("onClientElementDataChange",localPlayer,invincibility)
			setElementData(localPlayer,"blood",defaultBlood)
		end
	end

	function kickPlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		local reason = guiGetText(kwEditBoxReason)
		if selectedPlayer then
			triggerServerEvent("kickPlayerEvent",localPlayer,selectedPlayer,reason)
		end
	end

	function banPlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		local reason = guiGetText(banWindowReason)
		if selectedPlayer then
			if guiRadioButtonGetSelected(banWindowTypeIP) then
				local typeIP = true
				local typeSerial = false
				if guiRadioButtonGetSelected(banWindowDuration1hour) then
					local duration = 3600
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDuration1day) then
					local duration = 86400
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDuration1Week) then
					local duration = 604800
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDurationPermanent) then
					local duration = 0
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				end
			elseif guiRadioButtonGetSelected(banWindowTypeSerial) then
				local typeIP = false
				local typeSerial = true
				if guiRadioButtonGetSelected(banWindowDuration1hour) then
					local duration = 3600
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDuration1day) then
					local duration = 86400
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDuration1Week) then
					local duration = 604800
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				elseif guiRadioButtonGetSelected(banWindowDurationPermanent) then
					local duration = 0
					triggerServerEvent("banPlayerEvent",localPlayer,selectedPlayer,reason,typeIP,typeSerial,duration)
				end
			end
		end
	end

	function mutePlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		local reason = guiGetText(muteWindowEditBox)
		if selectedPlayer then
			if guiRadioButtonGetSelected(mute5mins) then
				local duration = 300000
				triggerServerEvent("mutePlayerEvent",localPlayer,selectedPlayer,reason,duration)
				closeMuteGui()
				guiSetText(buttonMute,"unmute")
				unMuteText()
			elseif guiRadioButtonGetSelected(mute10mins) then
				local duration = 600000
				triggerServerEvent("mutePlayerEvent",localPlayer,selectedPlayer,reason,duration)
				closeMuteGui()
				guiSetText(buttonMute,"unmute")
				unMuteText()
			elseif guiRadioButtonGetSelected(mute20mins) then
				local duration = 1200000
				triggerServerEvent("mutePlayerEvent",localPlayer,selectedPlayer,reason,duration)
				closeMuteGui()
				guiSetText(buttonMute,"unmute")
				unMuteText()
			elseif guiRadioButtonGetSelected(muteUntilReconnect) then
				local duration = 0
				triggerServerEvent("mutePlayerEvent",localPlayer,selectedPlayer,reason,duration)
				closeMuteGui()
				guiSetText(buttonMute,"unmute")
				unMuteText()
			end
		end
	end

	function unMutePlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		local reason = guiGetText(muteWindowEditBox)
		if selectedPlayer then
			local duration = 0
			triggerServerEvent("mutePlayerEvent",localPlayer,selectedPlayer,reason,duration)
			muteText()
		end
	end

	function freeze()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			if isElementFrozen(selectedPlayer) then
				local frozen = true
				triggerServerEvent("freezePlayerEvent",localPlayer,selectedPlayer,frozen)
				guiSetText(buttonFreeze,"freeze")
			else
				local frozen = false
				triggerServerEvent("freezePlayerEvent",localPlayer,selectedPlayer,frozen)
				guiSetText(buttonFreeze,"unfreeze")
			end
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end

	function warpToPlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			triggerServerEvent("warpToPlayerEvent",localPlayer,selectedPlayer)
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end

	function warpPlayerToPlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer1 = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		local item2 = guiGridListGetSelectedItem(warpWindowGridlist)
		local selectedPlayer2 = getPlayerFromName(guiGridListGetItemText(warpWindowGridlist,item2,1))
		if selectedPlayer1 then
			if selectedPlayer2 then
				triggerServerEvent("warpPlayerToPlayerEvent",localPlayer,selectedPlayer1,selectedPlayer2)
				closeWarpGui()
			end
		end
	end

	function editHumanity()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local data = tonumber(guiGetText(humanityEditBox))
			local element = "humanity"
			triggerServerEvent("setDayzStatsEvent",localPlayer,selectedPlayer,data,element)
		end
	end
	function editZombieKills()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local data = tonumber(guiGetText(zombieKillsEditBox))
			local element = "zombieskilled"
			triggerServerEvent("setDayzStatsEvent",localPlayer,selectedPlayer,data,element)
		end
	end
	function editMurders()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local data = tonumber(guiGetText(murdersEditBox))
			local element = "murders"
			triggerServerEvent("setDayzStatsEvent",localPlayer,selectedPlayer,data,element)
		end
	end

	function changeWeather()
		if guiRadioButtonGetSelected(radioButtonNormal) then
			local weather = 1
			triggerServerEvent("changeWeatherEvent",localPlayer,weather)
			closeWeatherGui()
		elseif guiRadioButtonGetSelected(radioButtonSandstorm) then
			local weather = 2
			triggerServerEvent("changeWeatherEvent",localPlayer,weather)
			closeWeatherGui()
		elseif guiRadioButtonGetSelected(radioButtonRain) then
			local weather = 3
			triggerServerEvent("changeWeatherEvent",localPlayer,weather)
			closeWeatherGui()
		end
	end

	function sendGlobalMessage()
		local message = guiGetText(mwEditBoxMessage)
		triggerServerEvent("globalMessageEvent",localPlayer,message)
		closeMessageGui()
	end

	function killPlayer()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			triggerServerEvent("killPlayerEvent",localPlayer,selectedPlayer)
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end

	function give()
		if (guiGridListGetSelectedItem(giveWindowGridlist) ~= -1) then
			local item = guiGridListGetItemText(giveWindowGridlist,guiGridListGetSelectedItem(giveWindowGridlist))
			local quantity = guiGetText(giveWindowEditboxQuant)
			local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
			if selectedPlayer then
				triggerServerEvent("giveEvent",localPlayer,selectedPlayer,item,quantity)
			end
		end
	end

	function giveAll()
		if (guiGridListGetSelectedItem(giveWindowGridlist) ~= -1) then
			local item = guiGridListGetItemText(giveWindowGridlist,guiGridListGetSelectedItem(giveWindowGridlist))
			local quantity = guiGetText(giveWindowEditboxQuant)
			triggerServerEvent("giveAllEvent",localPlayer,item,quantity)
		end
	end

	function vehicle()
		local item = guiGridListGetItemText(giveWindowGridlist,guiGridListGetSelectedItem(giveWindowGridlist))
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			if (guiGridListGetSelectedItem(vehicleWindowGridlist) ~= -1) then
				local vehID,engine,tire,tankpart,rotor,scrap,fuel,maxslots = unpack(guiGridListGetItemData(vehicleWindowGridlist, guiGridListGetSelectedItem(vehicleWindowGridlist)))
				triggerServerEvent("vehicleEvent",localPlayer,selectedPlayer,vehID,engine,tire,tankpart,rotor,scrap,fuel,maxslots)
				guiSetVisible(vehicleWindow,false)
				guiSetVisible(window,false)
				showCursor(false)
			else
				outputChatBox("#DF0101[DayZ]#BDBDBD Select a vehicle to spawn it",0,0,0,true)
			end
		end
	end

	function fixVehicle()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local driving, vehicle = isPedDrivingVehicle(selectedPlayer)
			if driving then
				triggerServerEvent("fixVehicleEvent",localPlayer,selectedPlayer,vehicle)
			end
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end

	function destroyVehicle()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local driving, vehicle = isPedDrivingVehicle(selectedPlayer)
			if driving then
				triggerServerEvent("destroyVehicleEvent",localPlayer,selectedPlayer,vehicle)
			end
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end

	function blowVehicle()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
		if selectedPlayer then
			local driving, vehicle = isPedDrivingVehicle(selectedPlayer)
			if driving then
				triggerServerEvent("blowVehicleEvent",localPlayer,selectedPlayer,vehicle)
			end
		else
			guiSetVisible(errorWindow,true)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(messageWindow,false)
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, main)

function openGui(key,keyState)
	if (keyState == "down") then
		if (guiGetVisible(window) == false) then
			guiSetVisible(window,true)
			showCursor(true)
			guiSetInputMode("no_binds_when_editing")
			triggerEvent("playerList",root)
		else
			guiSetVisible(window,false)
			showCursor(false)
			guiSetInputMode("allow_binds")
			triggerEvent("disableError",root)

			guiSetVisible(kickWindow,false)
			guiSetVisible(messageWindow,false)
			guiSetVisible(muteWindow,false)
			guiSetVisible(warpWindow,false)
			guiSetVisible(weatherWindow,false)
			guiSetVisible(banWindow,false)
			guiSetVisible(dayzStatsWindow,false)
			guiSetVisible(giveWindow,false)
			guiSetVisible(vehicleWindow,false)

			guiSetText(labelName,"Name: N/A")
			guiSetText(labelIP,"IP: N/A")
			guiSetText(labelSerial,"Serial: N/A")
			guiSetText(labelUsername,"Account Name: N/A")
			guiSetText(labelCountry,"Version: N/A")

			guiSetText(labelBlood,"Blood: N/A")
			guiSetText(labelMurders,"Murders: N/A")
			guiSetText(labelBanditsKilled,"Bandits Killed: N/A")
			guiSetText(labelZombiesKilled,"Zombies Killed: N/A")
			guiSetText(labelHeadshots,"Headshots: N/A")
			guiSetText(labelTemperature,"Temperature: N/A")
			guiSetText(labelHumanity,"Humanity: N/A")
			guiSetText(labelBackPackSlots,"Backpack Slots: N/A")
			guiSetText(labelSkin,"Skin: N/A")
			guiSetText(labelArea,"Area: Unknown")

			guiSetText(labelVehicleName,"Vehicle: N/A")
			guiSetText(labelVehicleHealth,"Vehicle Health: 0%")

			guiSetText(buttonFreeze,"freeze")
			guiSetText(buttonMute,"mute")

			if isEventHandlerAdded("onClientGUIClick",buttonMute,unMutePlayer) then
				removeEventHandler("onClientGUIClick",buttonMute,unMutePlayer)
			end
			if not isEventHandlerAdded("onClientGUIClick",buttonMute,openMuteGui) then
				addEventHandler("onClientGUIClick",buttonMute,openMuteGui,false)
			end
		end
	end
end
addEvent("openGui",true)
addEventHandler("openGui",root,openGui)

function hasPermission(key,keyState)
	if getElementData(localPlayer, "logedin") then
		triggerServerEvent("hasPermissionEvent",localPlayer,key,keyState)
	end
end
bindKey("o", "down", hasPermission)