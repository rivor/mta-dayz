function weatherGui()
	local screenW, screenH = guiGetScreenSize()
	weatherWindow = guiCreateGridList((screenW - 217) / 2, (screenH - 85) / 2, 217, 85, false)
	guiSetAlpha(weatherWindow, 0.90)
	guiSetProperty(weatherWindow, "AlwaysOnTop", "True")

	guiSetVisible(weatherWindow,false)

	kwLabel = guiCreateLabel(10, 7, 194, 15, "CHANGE WEATHER", false, weatherWindow)
	guiSetFont(kwLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(kwLabel, "center", false)
	weatherButtonChange = guiCreateButton(10, 52, 88, 25, "change", false, weatherWindow)

	radioButtonNormal = guiCreateRadioButton(10, 27, 56, 15, "Normal", false, weatherWindow)
	radioButtonSandstorm = guiCreateRadioButton(76, 27, 77, 15, "Sandstorm", false, weatherWindow)
	radioButtonRain = guiCreateRadioButton(163, 27, 41, 15, "Rain", false, weatherWindow)
	guiRadioButtonSetSelected(radioButtonNormal, true)

	weatherButtonClose = guiCreateButton(116, 52, 88, 25, "close", false, weatherWindow)
	addEventHandler("onClientGUIClick",buttonChangeWeather,openWeatherGui,false)
	addEventHandler("onClientGUIClick",weatherButtonClose,closeWeatherGui,false)
	addEventHandler("onClientGUIClick",weatherButtonChange,changeWeather,false)
end
addEventHandler("onClientResourceStart", resourceRoot, weatherGui)

function openWeatherGui()
	triggerEvent("disableError",localPlayer)
	guiSetVisible(hiddenGridlist,true) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(kickWindow,false)
	guiSetVisible(messageWindow,false)
	guiSetVisible(muteWindow,false)
	guiSetVisible(warpWindow,false)
	guiSetVisible(weatherWindow,true)
	guiSetVisible(banWindow,false)
	guiSetVisible(dayzStatsWindow,false)
	guiSetVisible(giveWindow,false)
	guiSetVisible(vehicleWindow,false)
end

function closeWeatherGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(weatherWindow,false)
	setElementData(localPlayer,"isGui",false)
	guiRadioButtonSetSelected(radioButtonNormal, true)
end