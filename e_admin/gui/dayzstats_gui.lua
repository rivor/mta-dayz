function dayzStatsGui()
	local screenW, screenH = guiGetScreenSize()
	dayzStatsWindow = guiCreateGridList((screenW - 270) / 2, (screenH - 143) / 2, 270, 143, false)
	guiSetAlpha(dayzStatsWindow, 0.90)
	guiSetProperty(dayzStatsWindow, "AlwaysOnTop", "True")

	guiSetVisible(dayzStatsWindow,false)

	humanityEditBox = guiCreateEdit(65, 27, 165, 25, "2500", false, dayzStatsWindow)
	dayzStatsLabel = guiCreateLabel(10, 6, 250, 15, "SET DAYZ STATS", false, dayzStatsWindow)
	guiSetFont(dayzStatsLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(dayzStatsLabel, "center", false)
	dayzHumanityLabel = guiCreateLabel(10, 27, 55, 25, "Humanity", false, dayzStatsWindow)
	guiLabelSetVerticalAlign(dayzHumanityLabel, "center")
	dayzStatsZombieKillsLabel = guiCreateLabel(10, 56, 55, 25, "zombKills", false, dayzStatsWindow)
	guiLabelSetVerticalAlign(dayzStatsZombieKillsLabel, "center")
	dayzStatsMurdersLabel = guiCreateLabel(10, 85, 55, 25, "Murders", false, dayzStatsWindow)
	guiLabelSetVerticalAlign(dayzStatsMurdersLabel, "center")
	zombieKillsEditBox = guiCreateEdit(65, 56, 165, 25, "0", false, dayzStatsWindow)
	murdersEditBox = guiCreateEdit(65, 85, 165, 25, "0", false, dayzStatsWindow)

	dayzButtonHumanity = guiCreateButton(230, 27, 30, 25, "edit", false, dayzStatsWindow)
	addEventHandler("onClientGUIClick",dayzButtonHumanity,editHumanity,false)

	dayzButtonZombieKills = guiCreateButton(230, 56, 30, 25, "edit", false, dayzStatsWindow)
	addEventHandler("onClientGUIClick",dayzButtonZombieKills,editZombieKills,false)
	
	dayzButtonMurders = guiCreateButton(230, 85, 30, 25, "edit", false, dayzStatsWindow)
	addEventHandler("onClientGUIClick",dayzButtonMurders,editMurders,false)

	dayzButtonClose = guiCreateButton(96, 114, 77, 23, "close", false, dayzStatsWindow)
	addEventHandler("onClientGUIClick",buttonSetDayzStats,openDayzStatsGui,false)
	addEventHandler("onClientGUIClick",dayzButtonClose,closeDayzStatsGui,false)
end
addEventHandler("onClientResourceStart", resourceRoot, dayzStatsGui)

function openDayzStatsGui()
	if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
		triggerEvent("disableError",localPlayer)
		guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
		guiSetVisible(errorWindow,false)
		guiSetVisible(kickWindow,false)
		guiSetVisible(messageWindow,false)
		guiSetVisible(muteWindow,false)
		guiSetVisible(warpWindow,false)
		guiSetVisible(weatherWindow,false)
		guiSetVisible(banWindow,false)
		guiSetVisible(dayzStatsWindow,true)
		guiSetVisible(giveWindow,false)
		guiSetVisible(vehicleWindow,false)
	else
		triggerEvent("enableError",localPlayer)
	end
end

function closeDayzStatsGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(dayzStatsWindow,false)
	guiSetText(humanityEditBox,"2500")
	guiSetText(zombieKillsEditBox,"0")
	guiSetText(murdersEditBox,"0")
	setElementData(localPlayer,"isGui",false)
end