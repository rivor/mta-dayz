function banGui()
    local screenW, screenH = guiGetScreenSize()
    banWindow = guiCreateGridList((screenW - 235) / 2, (screenH - 249) / 2, 235, 249, false)
    guiSetAlpha(banWindow, 0.90)
    guiSetProperty(banWindow, "AlwaysOnTop", "True")

    guiSetVisible(banWindow,false)

    banWindowReason = guiCreateEdit(10, 25, 215, 25, "", false, banWindow)
    banWindowLabel = guiCreateLabel(10, 5, 215, 15, "ENTER BAN REASON", false, banWindow)
    guiSetFont(banWindowLabel, "default-bold-small")
    guiLabelSetHorizontalAlign(banWindowLabel, "center", false)
    banWindowGridlistType = guiCreateGridList(10, 54, 215, 63, false, banWindow)

    banWindowTypeLabel = guiCreateLabel(10, 5, 195, 15, "Type:", false, banWindowGridlistType)
    guiSetFont(banWindowTypeLabel, "default-bold-small")
    banWindowTypeIP = guiCreateRadioButton(14, 24, 191, 15, "IP", false, banWindowGridlistType)
    banWindowTypeSerial = guiCreateRadioButton(14, 39, 191, 14, "Serial", false, banWindowGridlistType)
    guiRadioButtonSetSelected(banWindowTypeIP, true)

    banWindowGridlistDuration = guiCreateGridList(10, 121, 215, 92, false, banWindow)

    banWindowDurationLabel = guiCreateLabel(10, 5, 196, 15, "Duration:", false, banWindowGridlistDuration)
    guiSetFont(banWindowDurationLabel, "default-bold-small")
    banWindowDuration1hour = guiCreateRadioButton(14, 24, 192, 15, "1 hour", false, banWindowGridlistDuration)
    banWindowDuration1day = guiCreateRadioButton(14, 39, 192, 15, "1 day", false, banWindowGridlistDuration)
    banWindowDuration1Week = guiCreateRadioButton(14, 54, 192, 15, "1 week", false, banWindowGridlistDuration)
    guiRadioButtonSetSelected(banWindowDuration1hour, true)
    banWindowDurationPermanent = guiCreateRadioButton(14, 69, 192, 15, "Permanent", false, banWindowGridlistDuration)

    banWindowButtonBan = guiCreateButton(10, 218, 105, 25, "ban", false, banWindow)
    banWindowButtonClose = guiCreateButton(120, 218, 105, 25, "close", false, banWindow)
    addEventHandler("onClientGUIClick",buttonBan,openBanGui,false)
    addEventHandler("onClientGUIClick",banWindowButtonClose,closeBanGui,false)
    addEventHandler("onClientGUIClick",banWindowButtonBan,banPlayer,false)
end
addEventHandler("onClientResourceStart", resourceRoot, banGui)

function openBanGui()
    if (guiGridListGetSelectedItem( gridlistPlayers1 ) ~= -1) then
        triggerEvent("disableError",localPlayer)
        guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
        guiSetVisible(errorWindow,false)
        guiSetVisible(kickWindow,false)
        guiSetVisible(messageWindow,false)
        guiSetVisible(muteWindow,false)
        guiSetVisible(warpWindow,false)
        guiSetVisible(weatherWindow,false)
        guiSetVisible(banWindow,true)
        guiSetVisible(dayzStatsWindow,false)
        guiSetVisible(giveWindow,false)
        guiSetVisible(vehicleWindow,false)
    else
        triggerEvent("enableError",localPlayer)
    end
end

function closeBanGui()
    guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
    guiSetVisible(banWindow,false)
    setElementData(localPlayer,"isGui",false)
    guiSetText(banWindowReason,"")
    guiRadioButtonSetSelected(banWindowTypeIP, true)
    guiRadioButtonSetSelected(banWindowDuration1hour, true)
end