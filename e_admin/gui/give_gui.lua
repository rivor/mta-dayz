function giveGui()
	local screenW, screenH = guiGetScreenSize()
	giveWindow = guiCreateGridList((screenW - 262) / 2, (screenH - 303) / 2, 262, 303, false)
	guiSetAlpha(giveWindow, 0.90)
	guiSetProperty(giveWindow, "AlwaysOnTop", "True")
	guiSetVisible(giveWindow,false)

	local curText = ""
	giveWindowEditboxQuant = guiCreateEdit(120, 270, 60, 24, "0", false, giveWindow)
	guiEditSetMaxLength(giveWindowEditboxQuant, 5)
	addEventHandler( "onClientGUIChanged",giveWindowEditboxQuant,function()
		local currText = guiGetText(source)
	  	local newText = string.gsub(currText,'[^0-9]','')
		if newText ~= currText then
			guiSetText(source,newText)
		end
	end,false)

	giveWindowCombobox = guiCreateComboBox(10, 10, 150, 180, "Choose Category", false, giveWindow)
	guiComboBoxAddItem(giveWindowCombobox, "Weapons")
	guiComboBoxAddItem(giveWindowCombobox, "Ammo")
	guiComboBoxAddItem(giveWindowCombobox, "Food")
	guiComboBoxAddItem(giveWindowCombobox, "Clothes")
	guiComboBoxAddItem(giveWindowCombobox, "Backpacks")
	guiComboBoxAddItem(giveWindowCombobox, "Vehicle Parts")
	guiComboBoxAddItem(giveWindowCombobox, "Medical Items")
	guiComboBoxAddItem(giveWindowCombobox, "Toolbelt")
	--guiComboBoxAddItem(giveWindowCombobox, "Crafting Items")
	guiComboBoxAddItem(giveWindowCombobox, "Misc")

	giveWindowLabel = guiCreateLabel(160, 12, 92, 15, "GIVE PANEL", false, giveWindow)
	guiSetFont(giveWindowLabel, "default-bold-small")
	guiLabelSetHorizontalAlign(giveWindowLabel, "center", false)
	guiLabelSetVerticalAlign(giveWindowLabel, "center")

	giveWindowGridlist = guiCreateGridList(6, 37, 250, 227, false, giveWindow)
	guiGridListSetSortingEnabled(giveWindowGridlist,false)
	guiGridListAddColumn(giveWindowGridlist, "Items", 0.85)

	addEventHandler("onClientGUIComboBoxAccepted", giveWindowCombobox, function()
		guiGridListClear(giveWindowGridlist)
		local text = guiComboBoxGetItemText(giveWindowCombobox,guiComboBoxGetSelected(giveWindowCombobox))
		for i,item in ipairs(items[text]) do
			local row = guiGridListAddRow(giveWindowGridlist)
			guiGridListSetItemText(giveWindowGridlist, row, 1, item, false, false)
		end
	end)

	giveWindowButtonGive = guiCreateButton(6, 270, 48, 24, "give", false, giveWindow)
	giveWindowButtonGiveAll = guiCreateButton(60, 270, 56, 24, "give all", false, giveWindow)

	giveWindowButtonClose = guiCreateButton(190, 270, 66, 24, "close", false, giveWindow)

	addEventHandler("onClientGUIClick",buttonItems,openGiveGui,false)
	addEventHandler("onClientGUIClick",giveWindowButtonClose,closeGiveGui,false)

	addEventHandler("onClientGUIClick",giveWindowButtonGive,give,false)
	addEventHandler("onClientGUIClick",giveWindowButtonGiveAll,giveAll,false)
end
addEventHandler("onClientResourceStart", resourceRoot, giveGui)

function openGiveGui()
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
		guiSetVisible(giveWindow,true)
		guiSetVisible(vehicleWindow,false)
	else
		triggerEvent("enableError",localPlayer)
	end
end

function closeGiveGui()
	guiSetVisible(hiddenGridlist,false) -- hidden gridlist to dont allow select other players from player list
	guiSetVisible(giveWindow,false)
	guiSetText(giveWindowEditboxQuant,"0")
	setElementData(localPlayer,"isGui",false)
end