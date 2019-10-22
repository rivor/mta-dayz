function warpGui()
	local screenW, screenH = guiGetScreenSize()
	warpWindow = guiCreateGridList((screenW - 230) / 2, (screenH - 245) / 2, 230, 245, false)
	guiSetAlpha(warpWindow, 0.90)
    guiSetProperty(warpWindow, "AlwaysOnTop", "True")

    guiSetVisible(warpWindow,false)

	warpWindowGridlist = guiCreateGridList(7, 6, 215, 200, false, warpWindow)
	guiGridListAddColumn(warpWindowGridlist, "Players", 0.9)
	guiGridListAddRow(warpWindowGridlist)   

	warpWindowButtonWarp = guiCreateButton(7, 213, 102, 25, "warp", false, warpWindow)
	warpWindowButtonClose = guiCreateButton(119, 213, 102, 25, "close", false, warpWindow)
	addEventHandler("onClientGUIClick",buttonWarpPlayerTo,openWarpGui,false)
    addEventHandler("onClientGUIClick",warpWindowButtonClose,closeWarpGui,false)
    addEventHandler("onClientGUIClick",warpWindowButtonWarp,warpPlayerToPlayer,false)
end
addEventHandler("onClientResourceStart", resourceRoot, warpGui)

function openWarpGui()
	if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
		triggerEvent("disableError",localPlayer)
		guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
		guiSetVisible(errorWindow,false)
		guiSetVisible(kickWindow,false)
		guiSetVisible(messageWindow,false)
		guiSetVisible(muteWindow,false)
		guiSetVisible(warpWindow,true)
		guiSetVisible(weatherWindow,false)
		guiSetVisible(banWindow,false)
		guiSetVisible(dayzStatsWindow,false)
		guiSetVisible(giveWindow,false)
		guiSetVisible(vehicleWindow,false)
	else
		triggerEvent("enableError",localPlayer)
	end
end

function closeWarpGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
    guiSetVisible(warpWindow,false)
    setElementData(localPlayer,"isGui",false)
end