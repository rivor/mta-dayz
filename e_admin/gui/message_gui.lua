function messageGui()
	local screenW, screenH = guiGetScreenSize()
	messageWindow = guiCreateGridList((screenW - 235) / 2, (screenH - 116) / 2, 235, 90, false)
	guiSetAlpha(messageWindow, 0.90)
	guiSetProperty(messageWindow, "AlwaysOnTop", "True")
	guiSetVisible(messageWindow,false)

	mwEditBoxMessage = guiCreateEdit(10, 27, 215, 25, "", false, messageWindow)
	mwLabel = guiCreateLabel(10, 7, 215, 15, "ENTER GLOBAL MESSAGE", false, messageWindow)
	guiSetFont(mwLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(mwLabel, "center", false)

	mwButton = guiCreateButton(10, 58, 102, 25, "send", false, messageWindow)

	mwButtonClose = guiCreateButton(122, 58, 102, 25, "close", false, messageWindow)
	addEventHandler("onClientGUIClick",buttonGlobalMessage,openMessageGui,false)
	addEventHandler("onClientGUIClick",mwButtonClose,closeMessageGui,false)
	addEventHandler("onClientGUIClick",mwButton,sendGlobalMessage,false)
end
addEventHandler("onClientResourceStart", resourceRoot, messageGui)

function openMessageGui()
	triggerEvent("disableError",localPlayer)
	guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(kickWindow,false)
	guiSetVisible(messageWindow,true)
	guiSetVisible(muteWindow,false)
	guiSetVisible(warpWindow,false)
	guiSetVisible(weatherWindow,false)
	guiSetVisible(banWindow,false)
	guiSetVisible(dayzStatsWindow,false)
	guiSetVisible(giveWindow,false)
	guiSetVisible(vehicleWindow,false)
end

function closeMessageGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(messageWindow,false)
	guiSetText(mwEditBoxMessage,"")
	setElementData(localPlayer,"isGui",false)
end