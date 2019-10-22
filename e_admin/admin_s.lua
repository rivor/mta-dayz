prefix = "#DF0101[MTAZ]#BDBDBD"
globalMessage_prefix = "#DF0101[Global Admin Message]#BDBDBD"

function hasPermissionEvent(key,keyState)
	account = getAccountName(getPlayerAccount(source))
	getUserSerial = getPlayerSerial(source)
	if isObjectInACLGroup("user."..account,aclGetGroup("Admin")) then
		triggerClientEvent(source,"openGui",source,key,keyState)
	elseif getElementData(source,"admin") then -- You can remove this if you don't want players to access admin panel without being acl admin
		triggerClientEvent(source,"openGui",source,key,keyState)
	end
end
addEvent("hasPermissionEvent",true)
addEventHandler("hasPermissionEvent",root,hasPermissionEvent)

function getPlayerInfo(selectedPlayer)
	local playerName = getPlayerName(selectedPlayer)
	local playerSerial = getPlayerSerial(selectedPlayer)
	local playerIP = getPlayerIP(selectedPlayer)
	local playerVersion = getPlayerVersion(selectedPlayer)
	local playerAccount = getAccountName(getPlayerAccount(selectedPlayer))
	local isMuted = isPlayerMuted(selectedPlayer)
	triggerClientEvent(source,"getPlayerInfoCallBack",source,playerName,playerSerial,playerIP,playerVersion,playerAccount,isMuted)
end
addEvent("getPlayerInfo",true)
addEventHandler("getPlayerInfo",root,getPlayerInfo)

function kickPlayerEvent(selectedPlayer,reason)
	kickPlayer(selectedPlayer,source,reason)
	outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been kicked by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),root,0,0,0,true)
end
addEvent("kickPlayerEvent",true)
addEventHandler("kickPlayerEvent",root,kickPlayerEvent)

function banPlayerEvent(selectedPlayer,reason,typeIP,typeSerial,duration)
	banPlayer(selectedPlayer,typeIP,true,typeSerial,source,reason,tonumber(duration))
	if tonumber(duration) == 3600 then
		local banTime = "1 hour"
		outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been banned by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." ("..banTime..")",root,0,0,0,true)
	elseif tonumber(duration) == 86400 then
		local banTime = "1 day"
		outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been banned by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." ("..banTime..")",root,0,0,0,true)
	elseif tonumber(duration) == 604800 then
		local banTime = "1 week"
		outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been banned by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." ("..banTime..")",root,0,0,0,true)
	elseif tonumber(duration) == 0 then
		local banTime = "Permanent"
		outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been banned by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." ("..banTime..")",root,0,0,0,true)
	end
end
addEvent("banPlayerEvent",true)
addEventHandler("banPlayerEvent",root,banPlayerEvent)

function mutePlayerEvent(selectedPlayer,reason,duration)
	if not isPlayerMuted(selectedPlayer) then
		local duration = tonumber(duration)
		if duration == 300000 then
			setPlayerMuted(selectedPlayer,true)
			outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been muted by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." (5 mins)",root,0,0,0,true)
			local mutedForTime = setTimer(function()
				setPlayerMuted(selectedPlayer,false)
				outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been unmuted by console",root,0,0,0,true)
			end, duration, 1)
		elseif duration == 600000 then
			setPlayerMuted(selectedPlayer,true)
			outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been muted by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." (10 mins)",root,0,0,0,true)
			local mutedForTime = setTimer(function()
				setPlayerMuted(selectedPlayer,false)
				outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been unmuted by console",root,0,0,0,true)
			end, duration, 1)
		elseif duration == 1200000 then
			setPlayerMuted(selectedPlayer,true)
			outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been muted by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." (20 mins)",root,0,0,0,true)
			local mutedForTime = setTimer(function()
				setPlayerMuted(selectedPlayer,false)
				outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been unmuted by console",root,0,0,0,true)
			end, duration, 1)
		elseif duration == 0 then
			setPlayerMuted(selectedPlayer,true)
			outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been muted by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),root,0,0,0,true)
		end
	else
		setPlayerMuted(selectedPlayer,false)
		if isTimer(mutedForTime) then killTimer(mutedForTime) end
		outputChatBox(prefix.." Player "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." has been unmuted by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),root,0,0,0,true)
	end
end
addEvent("mutePlayerEvent",true)
addEventHandler("mutePlayerEvent",root,mutePlayerEvent)

function freezePlayerEvent(selectedPlayer,frozen)
	if frozen then
		setElementFrozen(selectedPlayer,false)
		outputChatBox(prefix.." You are unfreezed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	else
		setElementFrozen(selectedPlayer,true)
		outputChatBox(prefix.." You are freezed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	end
end
addEvent("freezePlayerEvent",true)
addEventHandler("freezePlayerEvent",root,freezePlayerEvent)

function warpToPlayerEvent(selectedPlayer)
	local x,y,z = getElementPosition(selectedPlayer)
	setElementPosition(source,x,y,z,true)
	fadeCamera(source,true)
	outputChatBox(prefix.." You warped to "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", ""),source,0,0,0,true)
	outputChatBox(prefix.." "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." warped to you",selectedPlayer,0,0,0,true)
end
addEvent("warpToPlayerEvent",true)
addEventHandler("warpToPlayerEvent",root,warpToPlayerEvent)

function warpPlayerToPlayerEvent(selectedPlayer1,selectedPlayer2)
	local x,y,z = getElementPosition(selectedPlayer2)
	setElementPosition(selectedPlayer1,x,y,z,true)
	fadeCamera(selectedPlayer1,true)
	outputChatBox(prefix.." You warped to "..string.gsub(getPlayerName(selectedPlayer1), "#%x%x%x%x%x%x", ""),source,0,0,0,true)
	outputChatBox(prefix.." "..string.gsub(getPlayerName(selectedPlayer2), "#%x%x%x%x%x%x", "").." warped to you",selectedPlayer,0,0,0,true)
end
addEvent("warpPlayerToPlayerEvent",true)
addEventHandler("warpPlayerToPlayerEvent",root,warpPlayerToPlayerEvent)

function setDayzStatsEvent(selectedPlayer,data,element)
	if element == "humanity" then
		setElementData(selectedPlayer,element,data)
	elseif element == "zombieskilled" then
		setElementData(selectedPlayer,element,data)
	elseif element == "murders" then
		setElementData(selectedPlayer,element,data)
	end
	outputChatBox(prefix.." You edited "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." dayz stats",source,0,0,0,true)
	outputChatBox(prefix.." Your dayz stats was edited by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
end
addEvent("setDayzStatsEvent",true)
addEventHandler("setDayzStatsEvent",root,setDayzStatsEvent)

function changeWeatherEvent(weather)
	if weather == 1 then
		setWeather(20) -- dark clouds mta dayz style
	elseif weather == 2 then
		setWeather(19) -- sandstorm
	elseif weather == 3 then
		setWeather(8) -- storming (rain)
	end
	outputChatBox(prefix.." Weather has been changed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),root,0,0,0,true)
end
addEvent("changeWeatherEvent",true)
addEventHandler("changeWeatherEvent",root,changeWeatherEvent)

function killPlayerEvent(selectedPlayer)
	setElementData(selectedPlayer,"blood",-100)
	outputChatBox(prefix.." You were killed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You killed "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", ""),source,0,0,0,true)
end
addEvent("killPlayerEvent",true)
addEventHandler("killPlayerEvent",root,killPlayerEvent)

function giveEvent(selectedPlayer,item,quantity)
	setElementData(selectedPlayer,item,getElementData(selectedPlayer,item)+quantity)
	outputChatBox(prefix.." Admin "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." gave you "..quantity.." "..item,selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You gave "..quantity.." "..item.." to "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", ""),source,0,0,0,true)
end
addEvent("giveEvent",true)
addEventHandler("giveEvent",root,giveEvent)

function giveAllEvent(item,quantity)
	for i,p in ipairs(getElementsByType("player")) do
		setElementData(p,item,getElementData(p,item)+quantity)
	end
	outputChatBox(prefix.." Admin "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." gave "..quantity.." "..item.." to everyone",root,0,0,0,true)
end
addEvent("giveAllEvent",true)
addEventHandler("giveAllEvent",root,giveAllEvent)

function vehicleEvent(selectedPlayer,vehID,engine,tire,tankpart,rotor,scrap,fuel,maxslots)
	local x,y,z = getElementPosition(selectedPlayer)
	local rx,ry,rz = getElementRotation(selectedPlayer)
	local veh = createVehicle(vehID,x,y,z,rx,ry,rz);
	local vehCol = createColSphere(x,y,z,2.5);
	attachElements(vehCol,veh);
	setElementData(vehCol,"parent",veh);
	setElementData(veh,"parent",vehCol);
	setElementData(vehCol,"vehicle",true);
	setElementData(veh,"dayzvehicle",0);
	setElementData(vehCol,"MAX_Slots",tonumber(maxslots));
	setElementData(vehCol,"Tire_inVehicle",tire);
	setElementData(vehCol,"Engine_inVehicle",engine);
	setElementData(vehCol,"Parts_inVehicle",tankpart);
	setElementData(vehCol,"Rotor_inVehicle",rotor);
	setElementData(vehCol,"Scrap_inVehicle",scrap);
	setElementData(vehCol,"spawn",{vehID,x,y,z});
	setElementData(vehCol,"fuel",fuel);
    if getElementType(selectedPlayer) == "player" then warpPedIntoVehicle(selectedPlayer, veh) end
    outputChatBox(prefix.." Admin "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", "").." gave you "..getVehicleNameFromModel(vehID),selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You gave "..getVehicleNameFromModel(vehID).." to "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", ""),source,0,0,0,true)
end
addEvent("vehicleEvent",true)
addEventHandler("vehicleEvent",root,vehicleEvent)

function globalMessageEvent(message)
	outputChatBox(globalMessage_prefix.." "..message,root,0,0,0,true)
end
addEvent("globalMessageEvent",true)
addEventHandler("globalMessageEvent",root,globalMessageEvent)

function fixVehicleEvent(selectedPlayer,vehicle)
	fixVehicle(vehicle)
	outputChatBox(prefix.." Your vehicle has been fixed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You fixed "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." vehicle",source,0,0,0,true)
end
addEvent("fixVehicleEvent",true)
addEventHandler("fixVehicleEvent",root,fixVehicleEvent)

function destroyVehicleEvent(selectedPlayer,vehicle)
	destroyElement(vehicle)
	outputChatBox(prefix.." Your vehicle has been destroyed by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You destroyed "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." vehicle",source,0,0,0,true)
end
addEvent("destroyVehicleEvent",true)
addEventHandler("destroyVehicleEvent",root,destroyVehicleEvent)

function blowVehicleEvent(selectedPlayer,vehicle)
	blowVehicle(vehicle)
	outputChatBox(prefix.." Your vehicle blowed up by "..string.gsub(getPlayerName(source), "#%x%x%x%x%x%x", ""),selectedPlayer,0,0,0,true)
	outputChatBox(prefix.." You blowed up "..string.gsub(getPlayerName(selectedPlayer), "#%x%x%x%x%x%x", "").." vehicle",source,0,0,0,true)
end
addEvent("blowVehicleEvent",true)
addEventHandler("blowVehicleEvent",root,blowVehicleEvent)

function updatePlayerListOnNickChange(oldNick,newNick)
	triggerClientEvent(source,"updatePlayerList",source,oldNick,newNick)
end
addEventHandler("onPlayerChangeNick",root,updatePlayerListOnNickChange)

function showDuty(dataName,oldValue)
	if (getElementType(source) == "player" and dataName == "dutyMode") then
		local account = getAccountName(getPlayerAccount(source))
		if isObjectInACLGroup("user."..account,aclGetGroup("Admin")) then
			if (not oldValue) then
				outputChatBox("Admin "..getPlayerName(source).." is now on duty!",root);
			else
				outputChatBox("Admin "..getPlayerName(source).." is now off duty!",root);
			end
		end
	end
end
addEventHandler("onElementDataChange",root,showDuty);