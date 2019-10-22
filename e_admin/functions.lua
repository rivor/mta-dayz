function isPedDrivingVehicle(ped)
    assert(isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player"), "Bad argument @ isPedDrivingVehicle [ped/player expected, got " .. tostring(ped) .. "]")
    local isDriving = isPedInVehicle(ped) and getVehicleOccupant(getPedOccupiedVehicle(ped)) == ped
    return isDriving, isDriving and getPedOccupiedVehicle(ped) or nil
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
    local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                return true
                end
            end
        end
    end
    return false
end

function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font,checkBuildings,checkVehicles,checkPeds,checkDummies,seeThroughStuff,ignoreSomeObjectsForCamera,ignoredElement)
				local x, y, z = getPedBonePosition(TheElement,6)
				local x2, y2, z2 = getPedBonePosition(localPlayer,6)
				local distance = distance or 20
				local height = height or 1
                                local checkBuildings = checkBuildings or true
                                local checkVehicles = checkVehicles or false
                                local checkPeds = checkPeds or false
                                local checkObjects = checkObjects or true
                                local checkDummies = checkDummies or true
                                local seeThroughStuff = seeThroughStuff or false
                                local ignoreSomeObjectsForCamera = ignoreSomeObjectsForCamera or false
                                local ignoredElement = ignoredElement or nil
				if (isLineOfSightClear(x, y, z, x2, y2, z2, checkBuildings, checkVehicles, checkPeds , checkObjects,checkDummies,seeThroughStuff,ignoreSomeObjectsForCamera,ignoredElement)) then
					local sx, sy = getScreenFromWorldPosition(x, y, z+height)
					if(sx) and (sy) then
						local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
						if(distanceBetweenPoints < distance) then
							dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center")
			end
		end
	end
end

function guiFunctions()
	guiGridListClear(gridlistPlayers1)
	guiGridListClear(warpWindowGridlist)
	local players = getElementsByType("player")
	for i,p in ipairs(players) do
		local row1 = guiGridListAddRow(gridlistPlayers1)
		guiGridListSetItemText(gridlistPlayers1, row1, 1, getPlayerName(p), false, false)
		local row2 = guiGridListAddRow(warpWindowGridlist)
		guiGridListSetItemText(warpWindowGridlist, row2, 1, getPlayerName(p), false, false)
	end
end
addEvent("playerList",true)
addEventHandler("playerList",root,guiFunctions)

function updatePlayerList(oldNick,newNick)
	local rowCount = guiGridListGetRowCount(gridlistPlayers1)
	for i=0,rowCount do
		if string.find(oldNick,guiGridListGetItemText(gridlistPlayers1,i,1)) then
			guiGridListSetItemText(gridlistPlayers1,i,1,newNick,false,false)
		end
	end

	local rowCount = guiGridListGetRowCount(warpWindowGridlist)
	for i=0,rowCount do
		if string.find(oldNick,guiGridListGetItemText(warpWindowGridlist,i,1)) then
			guiGridListSetItemText(warpWindowGridlist,i,1,newNick,false,false)
		end
	end
end
addEvent("updatePlayerList",true)
addEventHandler("updatePlayerList",root,updatePlayerList)

function muteText()
	guiSetText(buttonMute,"mute")
	if not isEventHandlerAdded("onClientGUIClick",buttonMute,openMuteGui) then
		addEventHandler("onClientGUIClick",buttonMute,openMuteGui,false)
	end
	if isEventHandlerAdded("onClientGUIClick",buttonMute,unMutePlayer) then
		removeEventHandler("onClientGUIClick",buttonMute,unMutePlayer)
	end
end

function unMuteText()
	guiSetText(buttonMute,"unmute")
	if isEventHandlerAdded("onClientGUIClick",buttonMute,openMuteGui) then
		removeEventHandler("onClientGUIClick",buttonMute,openMuteGui)
	end
	if not isEventHandlerAdded("onClientGUIClick",buttonMute,unMutePlayer) then
		addEventHandler("onClientGUIClick",buttonMute,unMutePlayer,false)
	end
end