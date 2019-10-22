function muteGui()
	local screenW, screenH = guiGetScreenSize()
	muteWindow = guiCreateGridList((screenW - 235) / 2, (screenH - 173) / 2, 235, 173, false)
	guiSetAlpha(muteWindow, 0.90)
    guiSetProperty(muteWindow, "AlwaysOnTop", "True")

    guiSetVisible(muteWindow,false)

	muteWindowEditBox = guiCreateEdit(10, 26, 215, 25, "", false, muteWindow)
	muteWindowLabel = guiCreateLabel(10, 6, 215, 15, "ENTER MUTE REASON", false, muteWindow)
	guiSetFont(muteWindowLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(muteWindowLabel, "center", false)
	muteGridlist = guiCreateGridList(10, 55, 214, 80, false, muteWindow)

	mute5mins = guiCreateRadioButton(10, 7, 194, 15, "5 Minutes", false, muteGridlist)
	guiSetEnabled(mute5mins,false)
	mute10mins = guiCreateRadioButton(10, 22, 194, 15, "10 Minutes", false, muteGridlist)
	guiSetEnabled(mute10mins,false)
	mute20mins = guiCreateRadioButton(10, 37, 194, 15, "20 Minutes", false, muteGridlist)
	guiSetEnabled(mute20mins,false)
	muteUntilReconnect = guiCreateRadioButton(10, 57, 194, 15, "Until Reconnect", false, muteGridlist)
	guiRadioButtonSetSelected(muteUntilReconnect, true)

	muteButtonMute = guiCreateButton(10, 140, 102, 25, "mute", false, muteWindow)
	muteButtonClose = guiCreateButton(122, 140, 102, 25, "close", false, muteWindow)
	addEventHandler("onClientGUIClick",buttonMute,openMuteGui,false)
    addEventHandler("onClientGUIClick",muteButtonClose,closeMuteGui,false)
    addEventHandler("onClientGUIClick",muteButtonMute,mutePlayer,false)
end
addEventHandler("onClientResourceStart", resourceRoot, muteGui)

function openMuteGui()
	if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
		triggerEvent("disableError",localPlayer)
		guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
		guiSetVisible(errorWindow,false)
		guiSetVisible(kickWindow,false)
		guiSetVisible(messageWindow,false)
		guiSetVisible(muteWindow,true)
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

function closeMuteGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
    guiSetVisible(muteWindow,false)
    setElementData(localPlayer,"isGui",false)
    guiRadioButtonSetSelected(muteUntilReconnect, true)
    guiSetText(muteWindowEditBox,"")
end