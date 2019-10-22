function kickGui()
	local screenW, screenH = guiGetScreenSize()
	kickWindow = guiCreateGridList((screenW - 235) / 2, (screenH - 116) / 2, 235, 90, false)
	guiSetAlpha(kickWindow, 0.90)
	guiSetProperty(kickWindow, "AlwaysOnTop", "True")
	guiSetVisible(kickWindow,false)

	kwEditBoxReason = guiCreateEdit(10, 27, 215, 25, "", false, kickWindow)
	kwLabel = guiCreateLabel(10, 7, 215, 15, "ENTER KICK REASON", false, kickWindow)
	guiSetFont(kwLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(kwLabel, "center", false)
	kwButton = guiCreateButton(10, 58, 102, 25, "kick", false, kickWindow)

	kwButtonClose = guiCreateButton(122, 58, 102, 25, "close", false, kickWindow)
	addEventHandler("onClientGUIClick",buttonKick,openKickGui,false)
	addEventHandler("onClientGUIClick",kwButtonClose,closeKickGui,false)
	addEventHandler("onClientGUIClick",kwButton,kickPlayer,false)
end
addEventHandler("onClientResourceStart", resourceRoot, kickGui)

function openKickGui()
	if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
		triggerEvent("disableError",localPlayer)
		setElementData(localPlayer,"isGui",true)
		guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
		guiSetVisible(errorWindow,false)
		guiSetVisible(kickWindow,true)
		guiSetVisible(messageWindow,false)
		guiSetVisible(muteWindow,false)
		guiSetVisible(warpWindow,false)
		guiSetVisible(weatherWindow,false)
		guiSetVisible(banWindow,false)
		guiSetVisible(dayzStatsWindow,false)
		guiSetVisible(giveWindow,false)
		guiSetVisible(vehicleWindow,false)
	else
		triggerEvent("enableError",localPlayer)
	end
end

function closeKickGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(kickWindow,false)
	guiSetText(kwEditBoxReason,"")
	setElementData(localPlayer,"isGui",false)
end