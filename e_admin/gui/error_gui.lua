function errorGui()
	local screenW, screenH = guiGetScreenSize()
	errorWindow = guiCreateGridList((screenW - 227) / 2, (screenH - 86) / 2, 227, 66,false)
	guiSetAlpha(errorWindow, 0.90)
	guiSetProperty(errorWindow, "AlwaysOnTop", "True")

	guiSetVisible(errorWindow,false)

	errorWindowError = guiCreateLabel(10, 10, 201, 17, "ERROR - No Player Selected", false, errorWindow)
	guiSetFont(errorWindowError, "default-bold-small")
	guiLabelSetHorizontalAlign(errorWindowError, "center", false)
	guiLabelSetVerticalAlign(errorWindowError, "center")

	errorButtonClose = guiCreateButton(78, 37, 67, 17, "close", false, errorWindow)
	addEventHandler("onClientGUIClick",errorButtonClose,disableError,false)
end
addEventHandler("onClientResourceStart", resourceRoot, errorGui)

function enableError()
	guiSetVisible(errorWindow,true)
	guiSetVisible(kickWindow,false)
	guiSetVisible(messageWindow,false)
	guiSetVisible(muteWindow,false)
	guiSetVisible(warpWindow,false)
	guiSetVisible(weatherWindow,false)
	guiSetVisible(banWindow,false)
	guiSetVisible(dayzStatsWindow,false)
	guiSetVisible(giveWindow,false)
	guiSetVisible(vehicleWindow,false)
end
addEvent("enableError",true)
addEventHandler("enableError",root,enableError)

function disableError()
	guiSetVisible(errorWindow,false)
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
end
addEvent("disableError",true)
addEventHandler("disableError",root,disableError)