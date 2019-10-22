function gui()
	local screenW, screenH = guiGetScreenSize()
	window = guiCreateWindow((screenW - 616) / 2, (screenH - 518) / 2, 616, 518, "MTA DayZ Admin Panel by kaasis", false)
	guiWindowSetMovable(window,false)
	guiWindowSetSizable(window, false)
	guiSetAlpha(window, 0.85)

	guiSetVisible(window,false)

	tabpanelAdmin = guiCreateTabPanel(10, 26, 596, 482, false, window)

	tabPlayers = guiCreateTab("Players", tabpanelAdmin)

	gridlistPlayers1 = guiCreateGridList(10, 10, 119, 438, false, tabPlayers)
	guiGridListAddColumn(gridlistPlayers1, "Players", 0.7)
	guiGridListAddRow(gridlistPlayers1)
	guiGridListSetItemText(gridlistPlayers1, 0, 1, "player1", false, false)

	hiddenGridlist = guiCreateGridList(10, 10, 119, 438, false, tabPlayers)
	guiSetProperty(hiddenGridlist, "AlwaysOnTop", "True")
	guiSetAlpha(hiddenGridlist, 0.00)
	guiSetVisible(hiddenGridlist,false)

	buttonDutyMode = guiCreateButton(138, 16, 89, 15, "Duty Mode", false, tabPlayers)
	guiSetFont(buttonDutyMode, "default-bold-small")
	labelDutyText = guiCreateLabel(237, 16, 22, 15, "OFF", false, tabPlayers)
	guiSetFont(labelDutyText, "default-small")
	guiLabelSetColor(labelDutyText, 252, 0, 0)
	guiLabelSetVerticalAlign(labelDutyText, "center")

	labelPlayer = guiCreateLabel(144, 50, 272, 14, "Player:", false, tabPlayers)
	guiSetFont(labelPlayer, "default-bold-small")
	guiLabelSetColor(labelPlayer, 252, 0, 0)

	labelName = guiCreateLabel(154, 71, 262, 13, "Name: N/A", false, tabPlayers)
	labelIP = guiCreateLabel(154, 90, 262, 16, "IP: N/A", false, tabPlayers)
	labelSerial = guiCreateLabel(154, 109, 262, 18, "Serial: N/A", false, tabPlayers)
	labelUsername = guiCreateLabel(154, 128, 262, 17, "Account Name: N/A", false, tabPlayers)
	labelCountry = guiCreateLabel(154, 147, 262, 15, "Version: N/A", false, tabPlayers)

	labelGame = guiCreateLabel(144, 168, 272, 16, "Game:", false, tabPlayers)
	guiSetFont(labelGame, "default-bold-small")
	guiLabelSetColor(labelGame, 252, 0, 0)

	labelBlood = guiCreateLabel(154, 189, 262, 15, "Blood: N/A", false, tabPlayers)
	labelMurders = guiCreateLabel(154, 208, 262, 21, "Murders: N/A", false, tabPlayers)
	labelBanditsKilled = guiCreateLabel(154, 227, 262, 19, "Bandits Killed: N/A", false, tabPlayers)
	labelZombiesKilled = guiCreateLabel(154, 246, 262, 18, "Zombies Killed: N/A", false, tabPlayers)
	labelHeadshots = guiCreateLabel(154, 265, 262, 18, "Headshots: N/A", false, tabPlayers)
	labelTemperature = guiCreateLabel(154, 284, 262, 17, "Temperature: N/A", false, tabPlayers)
	labelHumanity = guiCreateLabel(154, 304, 262, 15, "Humanity: N/A", false, tabPlayers)
	labelBackPackSlots = guiCreateLabel(154, 323, 262, 16, "Backpack Slots: N/A", false, tabPlayers)
	labelSkin = guiCreateLabel(154, 342, 262, 17, "Skin: N/A", false, tabPlayers)
	labelArea = guiCreateLabel(154, 361, 262, 17, "Area: Unknown", false, tabPlayers)

	labelVehicleHealth = guiCreateLabel(154, 422, 263, 16, "Vehicle Health: 0%", false, tabPlayers)
	labelVehicleName = guiCreateLabel(154, 403, 263, 14, "Vehicle: N/A", false, tabPlayers)
	labelVehicle = guiCreateLabel(144, 382, 273, 14, "Vehicle:", false, tabPlayers)
	guiSetFont(labelVehicle, "default-bold-small")
	guiLabelSetColor(labelVehicle, 252, 0, 0)

	buttonReportMessages = guiCreateButton(465, 10, 119, 15, "report messages", false, tabPlayers)
	guiSetFont(buttonReportMessages, "default-bold-small")
	guiSetEnabled(buttonReportMessages,false)

	buttonKick = guiCreateButton(423, 54, 72, 17, "kick", false, tabPlayers)
	buttonBan = guiCreateButton(499, 54, 72, 17, "ban", false, tabPlayers)
	buttonMute = guiCreateButton(423, 75, 72, 17, "mute", false, tabPlayers)
	buttonFreeze = guiCreateButton(499, 75, 72, 17, "freeze", false, tabPlayers)

	buttonSpectate = guiCreateButton(423, 101, 148, 18, "spectate", false, tabPlayers)
	guiSetEnabled(buttonSpectate,false)

	buttonWarpTo = guiCreateButton(423, 128, 148, 18, "warp to player", false, tabPlayers)
	buttonWarpPlayerTo = guiCreateButton(423, 151, 148, 18, "warp player to..", false, tabPlayers)
	buttonSetDayzStats = guiCreateButton(423, 177, 148, 18, "set dayz stats", false, tabPlayers)
	buttonChangeWeather = guiCreateButton(423, 200, 148, 18, "change weather", false, tabPlayers)
	buttonKill = guiCreateButton(423, 223, 148, 18, "kill player", false, tabPlayers)

	buttonItems = guiCreateButton(423, 246, 72, 17, "items", false, tabPlayers)
	buttonVehicles = guiCreateButton(499, 246, 72, 17, "vehicles", false, tabPlayers)

	buttonGlobalMessage = guiCreateButton(424, 342, 148, 18, "send global message", false, tabPlayers)

	buttonFix = guiCreateButton(424, 379, 148, 18, "Fix", false, tabPlayers)
	guiSetFont(buttonFix, "default-bold-small")
	buttonDestroy = guiCreateButton(424, 400, 148, 18, "Destroy", false, tabPlayers)
	guiSetFont(buttonDestroy, "default-bold-small")
	buttonBlow = guiCreateButton(424, 421, 148, 18, "Blow", false, tabPlayers)
	guiSetFont(buttonBlow, "default-bold-small")

	tabBans = guiCreateTab("Bans", tabpanelAdmin)
	guiSetEnabled(tabBans, false)

	gridlistBans = guiCreateGridList(10, 10, 592, 401, false, tabBans)
	guiGridListAddColumn(gridlistBans, "Name", 0.2)
	guiGridListAddColumn(gridlistBans, "IP", 0.2)
	guiGridListAddColumn(gridlistBans, "Serial", 0.2)
	guiGridListAddColumn(gridlistBans, "By", 0.2)
	guiGridListAddColumn(gridlistBans, "Reason", 0.2)
	buttonBanIP = guiCreateButton(10, 421, 81, 22, "Ban IP", false, tabBans)
	buttonBanSerial = guiCreateButton(95, 421, 81, 22, "Ban Serial", false, tabBans)
	buttonUnbanSerial = guiCreateButton(406, 421, 104, 22, "Unban Serial", false, tabBans)
	buttonUnbanIP = guiCreateButton(298, 421, 104, 22, "Unban IP", false, tabBans)
	buttonUnban = guiCreateButton(190, 421, 104, 22, "Unban", false, tabBans)
	buttonRefresh = guiCreateButton(525, 421, 77, 22, "Refresh", false, tabBans)

	tabSuperAdmin = guiCreateTab("SuperAdmin", tabpanelAdmin)
	guiSetEnabled(tabSuperAdmin, false)

	function getGridListInfo()
		local item = guiGridListGetSelectedItem(gridlistPlayers1)
		if (guiGridListGetSelectedItem(gridlistPlayers1) ~= -1) then
			local selectedPlayer = getPlayerFromName(guiGridListGetItemText(gridlistPlayers1,item,1))
			triggerServerEvent("getPlayerInfo",localPlayer,selectedPlayer)
			function getPlayerInfoCallBack(playerName,playerSerial,playerIP,playerVersion,playerAccount,isMuted)
				guiSetText(labelName,"Name: "..string.gsub(playerName, "#%x%x%x%x%x%x", ""))
				guiSetText(labelIP,"IP: "..playerIP)
				guiSetText(labelSerial,"Serial: "..playerSerial)
				guiSetText(labelUsername,"Account Name: "..playerAccount)
				guiSetText(labelCountry,"Version: "..playerVersion)

				guiSetText(labelBlood,"Blood: "..getElementData(selectedPlayer,"blood") or 0)
				guiSetText(labelMurders,"Murders: "..getElementData(selectedPlayer,"murders") or 0)
				guiSetText(labelBanditsKilled,"Bandits Killed: "..getElementData(selectedPlayer,"banditskilled") or 0)
				guiSetText(labelZombiesKilled,"Zombies Killed: "..getElementData(selectedPlayer,"zombieskilled") or 0)
				guiSetText(labelHeadshots,"Headshots: "..getElementData(selectedPlayer,"headshots") or 0)
				guiSetText(labelTemperature,"Temperature: "..getElementData(selectedPlayer,"temperature") or 0)
				guiSetText(labelHumanity,"Humanity: "..getElementData(selectedPlayer,"humanity") or 0)
				guiSetText(labelBackPackSlots,"Backpack Slots: "..getElementData(selectedPlayer,"MAX_Slots") or 0)
				
				guiSetText(labelSkin,"Skin: "..getElementModel(selectedPlayer))
				local x, y, z = getElementPosition(selectedPlayer)
				local location = getZoneName(x,y,z)
				local city = getZoneName(x,y,z,true)
				guiSetText(labelArea,"Area: "..location.." ("..city..")")

				local driving, vehicle = isPedDrivingVehicle(selectedPlayer)
				if driving then
					local health = getElementHealth(vehicle) - 250;
					local currentHealth = health / 750 * 100;
					guiSetText(labelVehicleName,"Vehicle: "..getVehicleName(vehicle))
					guiSetText(labelVehicleHealth,"Vehicle Health: "..currentHealth.."%")
				else
					guiSetText(labelVehicleName,"Vehicle: Foot")
				end

				if isElementFrozen(selectedPlayer) then
					guiSetText(buttonFreeze,"unfreeze")
				else
					guiSetText(buttonFreeze,"freeze")
				end
				if isMuted then
					unMuteText()
				else
					muteText()
				end
			end
			addEvent("getPlayerInfoCallBack",true)
			addEventHandler("getPlayerInfoCallBack",root,getPlayerInfoCallBack)
		else
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

			if not isEventHandlerAdded("onClientGUIClick",buttonMute,openMuteGui) then
				addEventHandler("onClientGUIClick",buttonMute,openMuteGui,false)
			end
		end
	end
	addEventHandler("onClientGUIClick", gridlistPlayers1, getGridListInfo, false)

	-- some other function buttons
	addEventHandler("onClientGUIClick",buttonDutyMode,dutyMode,false)
	addEventHandler("onClientGUIClick",buttonFreeze,freeze,false)
	addEventHandler("onClientGUIClick",buttonWarpTo,warpToPlayer,false)
	addEventHandler("onClientGUIClick",buttonKill,killPlayer,false)
	addEventHandler("onClientGUIClick",buttonFix,fixVehicle,false)
	addEventHandler("onClientGUIClick",buttonDestroy,destroyVehicle,false)
	addEventHandler("onClientGUIClick",buttonBlow,blowVehicle,false)
end
addEventHandler("onClientResourceStart", resourceRoot, gui)