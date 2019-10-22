function vehicleGui()
	local screenW, screenH = guiGetScreenSize()
	vehicleWindow = guiCreateGridList((screenW - 231) / 2, (screenH - 292) / 2, 231, 288, false)
	guiSetAlpha(vehicleWindow, 0.90)
	guiSetProperty(vehicleWindow, "AlwaysOnTop", "True")
	guiSetVisible(vehicleWindow,false)

	vehicleWindowButtonSpawn = guiCreateButton(7, 258, 102, 23, "spawn vehicle", false, vehicleWindow)
	vehicleWindowButtonClose = guiCreateButton(158, 258, 66, 24, "close", false, vehicleWindow)
	vehicleWindowGridlist = guiCreateGridList(7, 25, 217, 227, false, vehicleWindow)
	guiGridListAddColumn(vehicleWindowGridlist, "Vehicles", 0.85)
	vehicleWindowLabel = guiCreateLabel(7, 5, 217, 15, "VEHICLE SPAWNER MENU", false, vehicleWindow)
	guiSetFont(vehicleWindowLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(vehicleWindowLabel, "center", false)
	guiLabelSetVerticalAlign(vehicleWindowLabel, "center")

	for _,v in ipairs(vehicles) do
		local row = guiGridListAddRow(vehicleWindowGridlist)
		guiGridListSetItemText(vehicleWindowGridlist, row, 1, v[2], false, false)
		guiGridListSetItemData(vehicleWindowGridlist, row, 1, {v[1],v[3],v[4],v[5],v[6],v[7],v[8],v[9]})
	end

	addEventHandler("onClientGUIClick",buttonVehicles,openVehicleGui,false)
	addEventHandler("onClientGUIClick",vehicleWindowButtonClose,closeVehicleGui,false)
	addEventHandler("onClientGUIClick", vehicleWindowButtonSpawn, vehicle, false)
end
addEventHandler("onClientResourceStart", resourceRoot, vehicleGui)

function openVehicleGui()
	if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
		triggerEvent("disableError",localPlayer)
		setElementData(localPlayer,"isGui",true)
		guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
		guiSetVisible(errorWindow,false)
		guiSetVisible(kickWindow,false)
		guiSetVisible(messageWindow,false)
		guiSetVisible(muteWindow,false)
		guiSetVisible(warpWindow,false)
		guiSetVisible(weatherWindow,false)
		guiSetVisible(banWindow,false)
		guiSetVisible(dayzStatsWindow,false)
		guiSetVisible(giveWindow,false)
		guiSetVisible(vehicleWindow,true)
	else
		triggerEvent("enableError",localPlayer)
	end
end

function closeVehicleGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(vehicleWindow,false)
	setElementData(localPlayer,"isGui",false)
end