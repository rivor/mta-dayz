local sW,sH = guiGetScreenSize();
local theTableMenuScroll = {};
local isInFirePlace = false;
local newbieShow = false;
local newbieHead = "";
local newbieText = "";
local newbieText2 = "";
local newbiePosition = false;

addEvent("showClientMenuItem", true);
addEvent("disableMenu", true);

function createScrollMenuMessage(text, r, g, b, data)
	table.insert(theTableMenuScroll, {text, r, g, b, data});
end

function showClientMenuItem(arg1, arg2, arg3, arg4)
	if getElementData(localPlayer, "logedin") then
		theTableMenuScroll = {};
		setElementData(localPlayer, "usedItem", false);
		numberMenuScroll = 1;
		if (arg1 == "Take") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext1").." "..getLanguageTextClient(arg2), 255, 255, 255, arg2);
			setElementData(localPlayer, "usedItem", true);
		end
		if (arg1 == "stop") then
			disableMenu();
			refreshLoot(false);
		end
		if (arg1 == "Helicrashsite") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("helicrash")..")", 255, 255, 255, "helicrashsite");
			setElementData(localPlayer, "usedItem", true);
		end
		if (arg1 == "Hospitalbox") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("hospitalbox")..")",255,255,255,"hospitalbox")
			setElementData(localPlayer,"usedItem",true)
		end
		if (arg1 == "Vehicle") then
			if (getElementModel(getElementData(source, "parent")) ~= 509) then
				local col = getElementData(arg3, "parent");
				createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..arg2..")", 255, 255, 255, "vehicle");
				setElementData(localPlayer, "usedItem", true);
				if (getElementData(localPlayer, "item9") >= 1) then
					if (getElementData(col, "fuel") < getVehicleMaxFuel(col) and getElementData(localPlayer, "item9") >= 1) then
						createScrollMenuMessage(getLanguageTextClient("menuclienttext3"), 255, 255, 255, "refillgas");
					end
				end
				if (getElementHealth(arg3) <= 999 and getElementData(localPlayer, "toolbelt4") >= 1) then
					createScrollMenuMessage(getLanguageTextClient("menuclienttext4"), 255, 255, 255, "repairvehicle");
					setElementData(localPlayer, "usedItem", true);
				end
				if (getElementData(localPlayer, "toolbelt4") >= 1) then
					if (getElementData(col, "Engine_inVehicle") < getElementData(col, "needengines") and getElementData(localPlayer, "vehiclepart1") >= 1)
						or (getElementData(col, "Rotor_inVehicle") < getElementData(col, "needrotor") and getElementData(localPlayer, "vehiclepart2") >= 1)
						or (getElementData(col, "Tire_inVehicle") < getElementData(col, "needtires") and getElementData(localPlayer, "vehiclepart3") >= 1)
						or (getElementData(col, "Parts_inVehicle") < getElementData(col, "needparts") and getElementData(localPlayer, "vehiclepart4") >= 1)
						or (getElementData(col, "Scrap_inVehicle") < getElementData(col, "needscrap") and getElementData(localPlayer, "vehiclepart5") >= 1) then
						createScrollMenuMessage(getLanguageTextClient("menuclienttext5"), 255, 255, 255, "installparts");
						setElementData(localPlayer, "usedItem", true);
					end
					if (getElementData(col, "Engine_inVehicle") >= 1)
						or (getElementData(col, "Rotor_inVehicle") >= 1)
						or (getElementData(col, "Tire_inVehicle") >= 1)
						or (getElementData(col, "Parts_inVehicle") >= 1)
						or (getElementData(col, "Scrap_inVehicle") >= 1) then
						createScrollMenuMessage(getLanguageTextClient("menuclienttext6"), 255, 255, 255, "removeparts");
						setElementData(localPlayer, "usedItem", true);
					end
				end
			end
		end
		if (arg1 == "Tent") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true);
			if getElementData(getElementData(arg3, "parent"), "tent") then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext14"), 255, 255, 255, "tent");
				return;
			end
		end
		if (arg1 == "safe_code") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext15").." ("..arg2..")", 255, 255, 255, "safe_enter_code");
			setElementData(localPlayer, "usedItem", true);
			if getElementData(getElementData(arg3, "parent"), "safe") then
				if (getElementData(localPlayer,"item7") >= 1) then
					createScrollMenuMessage(getLanguageTextClient("menuclienttext16").." "..getLanguageTextClient("item7"), 255, 255, 255, "safe_c4");
				end
			end
		end
		if (arg1 == "safe_open") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext12").." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true);
			if getElementData(getElementData(arg3, "parent"), "safe") then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext17"), 255, 255, 255, "safe_change_code");
				createScrollMenuMessage(getLanguageTextClient("menuclienttext18"), 255, 255, 255, "safe_remove");
				return;
			end
		end
		if (arg1 == "safe_raided") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext12").." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true);
		end
		if (arg1 == "airdrop") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..arg2..")", 255, 255, 255, "vehicle");
			setElementData(localPlayer, "usedItem", true);
		end
		if (arg1 == "mine") then
			if (getElementData(localPlayer, "toolbelt4") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext36").." ("..arg2..")", 255, 255, 255, "detonate_mine");
				setElementData(localPlayer, "usedItem", true);
			end
		end
		if (arg1 == "Player") then
			if (arg2 and getElementType(arg2) == "Player" and arg2 ~= localPlayer) then
				if (getElementData(arg2, "bleeding") and getElementData(arg2, "bleeding") >= 1 and getElementData(localPlayer, "medicine5") and getElementData(localPlayer, "medicine5") >= 1) then
					createScrollMenuMessage(getLanguageTextClient("menuclienttext19").." "..getLanguageTextClient("medicine5"), 255, 255, 255, "givebandage");
					setElementData(localPlayer, "usedItem", true);
				end
				if (getElementData(arg2, "blood") and getElementData(arg2, "blood") <= 5000 and getElementData(localPlayer, "medicine7") and getElementData(localPlayer, "medicine7") >= 1) then
					createScrollMenuMessage(getLanguageTextClient("menuclienttext19").." "..getLanguageTextClient("medicine7"), 255, 255, 255, "giveblood");
					setElementData(localPlayer, "usedItem", true);
				end
			end
		end
		if (arg1 == "Dead") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2").." ("..(getLanguageTextClient(arg2) or arg2)..")", 255, 255, 255, "dead");
			createScrollMenuMessage(getLanguageTextClient("menuclienttext20"), 255, 255, 255, "deadreason");
			setElementData(localPlayer, "usedItem", true);
			if (getElementData(localPlayer, "weapon27") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext21"), 255, 255, 255, "burybody");
				setElementData(localPlayer, "usedItem", true);
			end
		end
		if (arg1 == "Fire Place") then
			if (getElementData(localPlayer,"fooditem11") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext22").." "..getLanguageTextClient("fooditem11"), 255, 255, 255, "fireplace");
				setElementData(localPlayer, "usedItem", true);
			end
		end
		if (arg1 == "patrol") then
			if (getElementData(localPlayer,"item10") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext23").." "..getLanguageTextClient("item10"), 255, 255, 255, "patrolstation");
				setElementData(localPlayer, "usedItem", "patrolstation");
			end 
		end
		if (arg1 == "Wirefence") then
			if (getElementData(localPlayer,"toolbelt4") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext24").." "..getLanguageTextClient("item2"), 255, 255, 255, "wirefence");
				setElementData(localPlayer, "usedItem", "wirefence");
			end 
		end
		if (arg1 == "Bottle") then
			if (getElementData(localPlayer,"fooditem2") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("menuclienttext23").." "..getLanguageTextClient("fooditem2"), 255, 255, 255, "bottle");
				setElementData(localPlayer, "usedItem", true);
			end   
		end
		if (arg1 == "Gear") then
			createScrollMenuMessage(getLanguageTextClient("menuclienttext2"), 255, 255, 255, "itemloot");
			setElementData(localPlayer, "usedItem", "itemloot");
		end
		numberMenuScroll = 1;
	end
end
addEventHandler("showClientMenuItem", localPlayer, showClientMenuItem)

function startScrollMenu(key, keyState, arg)
	if getElementData(localPlayer, "usedItem") then
		if (keyState == "down") then
			if (arg == "up") then
				numberMenuScroll = numberMenuScroll-1;
				if (numberMenuScroll < 1) then
					numberMenuScroll = #theTableMenuScroll;
				end
			elseif (arg == "down") then
				numberMenuScroll = numberMenuScroll+1;
				if (numberMenuScroll > #theTableMenuScroll) then
					numberMenuScroll = 1;
				end
			end
		end
	end
end
bindKey("mouse_wheel_up", "down", startScrollMenu, "up");
bindKey("mouse_wheel_down", "down", startScrollMenu, "down");
bindKey("pgup", "down", startScrollMenu, "up");
bindKey("pgdn", "down", startScrollMenu, "down");

function disableMenu()
	theTableMenuScroll = {};
	setElementData(localPlayer, "usedItem", false);
	setNewbieInfo(false, "", "");
	setNewbieInfo2("");
end
addEventHandler("disableMenu", localPlayer, disableMenu);

function clearScrollMenu()
	theTableMenuScroll = {};
	numberMenuScroll = 1;
	setElementData(localPlayer, "usedItem", false);
end
addEventHandler("clearScrollMenu", localPlayer, clearScrollMenu);

function getPlayerInCol(tab)
	for _,v in ipairs(tab) do
		if (v ~= localPlayer) then
			return true;
		end
	end
	return false;
end

function onPlayerTargetPickup(theElement)
	if (theElement == localPlayer and getElementData(localPlayer, "logedin")) then
		if (getElementData(source, "parent") == localPlayer) then return; end
		local player = getPlayerInCol(getElementsWithinColShape(source, "player"));
		if (player) then
			return;
		end
		if getPedOccupiedVehicle(localPlayer) then
			return;
		end
		isInFirePlace = false;
		if getElementData(source, "player") then
			showClientMenuItem("Player", getElementData(source, "parent"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(false,false,false,source)
			return;
		end
		if getElementData(source, "patrolstation") then
			showClientMenuItem("patrol");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(true, getLanguageTextClient("menuclienttext26"), getLanguageTextClient("menuclienttext30").." 'E' "..getLanguageTextClient("menuclienttext31").." "..getLanguageTextClient("item10").."!", source);
			setNewbieInfo2(getLanguageTextClient("menuclienttext25").." "..getLanguageTextClient("item10"));
			return;
		end
		if getElementData(source, "bottlestation") then
			showClientMenuItem("Bottle Station");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(true, getLanguageTextClient("menuclienttext27"), getLanguageTextClient("menuclienttext30").." 'E' "..getLanguageTextClient("menuclienttext31").." "..getLanguageTextClient("fooditem2").."!", source);
			setNewbieInfo2(getLanguageTextClient("menuclienttext25").." "..getLanguageTextClient("fooditem2"));
			return;
		end
		if getElementData(source, "wirefence") then
			showClientMenuItem("Wirefence");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(true, getLanguageTextClient("item2"), getLanguageTextClient("menuclienttext30").." 'E' "..getLanguageTextClient("menuclienttext32").." "..getLanguageTextClient("item2").."!", source);
			setNewbieInfo2(getLanguageTextClient("menuclienttext25").." "..getLanguageTextClient("toolbelt4"));
			return;
		end 
		if getElementData(source, "fireplace") then
			showClientMenuItem("Fire Place");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(true, getLanguageTextClient("menuclienttext28"),getLanguageTextClient("menuclienttext30").." 'E' "..getLanguageTextClient("menuclienttext33").." "..getLanguageTextClient("fooditem11").."!", source);
			setNewbieInfo2(getLanguageTextClient("menuclienttext25").." "..getLanguageTextClient("fooditem11"));
			isInFirePlace = true;
			return;
		end
		if getElementData(source, "deadman") then
			showClientMenuItem("Dead", getElementData(source, "playername"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getElementData(source,"playername")..")");
			setNewbieInfo(true, getLanguageTextClient("menuclienttext2"), getLanguageTextClient("menuclienttext7"), source);
			return;
		end
		if getElementData(source, "item") then
			showClientMenuItem("Take", getElementData(source, "item"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setNewbieInfo(true, getLanguageTextClient("menuclienttext29"), getLanguageTextClient("menuclienttext30").." 'E' "..getLanguageTextClient("menuclienttext34").."!", source);
			return
		end
		if getElementData(source, "helicrash") then
			showClientMenuItem("Helicrashsite", "helicrashsite");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("helicrash")..")");
			setNewbieInfo(true, getLanguageTextClient("helicrash"), getLanguageTextClient("menuclienttext7"), source);
			return;
		end
		if getElementData(source, "hospitalbox") then
			showClientMenuItem("Hospitalbox", "hospitalbox");
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("hospitalbox")..")");
			setNewbieInfo(true, getLanguageTextClient("hospitalbox"), getLanguageTextClient("menuclienttext7"), source);
			return;
		end
		if (getElementData(source, "vehicle") and getElementModel(getElementData(source, "parent")) ~= 509) then
			if (not getElementData(source, "deadVehicle")) then
				showClientMenuItem("Vehicle", vehicle_name[getElementModel(getElementData(source, "parent"))], getElementData(source, "parent"));
				setElementData(localPlayer, "currentCol", source);
				setElementData(localPlayer, "loot", true);
				setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getVehicleName(getElementData(source, "parent"))..")");
				setNewbieInfo(true, getLanguageTextClient("menuclienttext2"), getLanguageTextClient("menuclienttext7"), source);
				return;
			end
		elseif getElementData(source, "tent") then
			showClientMenuItem("Tent", getLanguageTextClient("item3"), getElementData(source, "parent"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("item3")..")");
			setNewbieInfo(true, getLanguageTextClient("menuclienttext2"), getLanguageTextClient("menuclienttext7"), source);
			return;
		elseif getElementData(source, "safe") then
			local safe_id = getElementData(source,"id");
			local safe_code = getElementData(source,safe_id);
			local player_code = getElementData(localPlayer,safe_id);
			if (not safe_code) then return; end
			setElementData(localPlayer, "safeCol", getElementData(source, "parent"));
			if (safe_code == "raided") then
				showClientMenuItem("safe_raided", getLanguageTextClient("item4"), getElementData(source, "parent"));
				setElementData(localPlayer, "currentCol", source);
				setElementData(localPlayer, "loot", true);
				setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext12").." ("..getLanguageTextClient("item4")..")");
				setNewbieInfo(true, getLanguageTextClient("menuclienttext13"), getLanguageTextClient("menuclienttext8"), source);
			elseif (safe_code ~= player_code) then
				showClientMenuItem("safe_code", getLanguageTextClient("item4"), getElementData(source, "parent"));
				setElementData(localPlayer, "currentCol", nil);
				setElementData(localPlayer, "loot", false);
				setElementData(localPlayer, "lootname", false);
				setNewbieInfo(true, getLanguageTextClient("item4"), getLanguageTextClient("menuclienttext9"), source);
			elseif (safe_code == player_code) then
				showClientMenuItem("safe_open", getLanguageTextClient("item4"), getElementData(source, "parent"));
				setElementData(localPlayer, "currentCol", source);
				setElementData(localPlayer, "loot", true);
				setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext12").." ("..getLanguageTextClient("item4")..")");
				setNewbieInfo(true, getLanguageTextClient("item4"), getLanguageTextClient("menuclienttext8"), source);
			end
			return;
		elseif getElementData(source, "airdrop") then
			showClientMenuItem("airdrop", getLanguageTextClient("menuclienttext11"), getElementData(source, "parent"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("menuclienttext10")..")");
			setNewbieInfo(true, getLanguageTextClient("menuclienttext11"), getLanguageTextClient("menuclienttext10"), source);
			return;
		elseif getElementData(source, "mine") then
			showClientMenuItem("mine", getLanguageTextClient("menuclienttext37"), getElementData(source, "parent"));
			setElementData(localPlayer, "currentCol", source);
			setElementData(localPlayer, "loot", false);
			setElementData(localPlayer, "lootname", "");
			setNewbieInfo(true, getLanguageTextClient("menuclienttext37"), getLanguageTextClient("menuclienttext35"), source);
			setNewbieInfo2(getLanguageTextClient("menuclienttext25").." "..getLanguageTextClient("toolbelt4"));
			return;
		end
		if getElementData(source, "itemloot") then
			showClientMenuItem("Gear");
			setElementData(localPlayer, "loot", true);
			setElementData(localPlayer, "lootname", "Gear");
			setElementData(localPlayer, "currentCol", source);
			setNewbieInfo(true, getLanguageTextClient("menuclienttext2"), getLanguageTextClient("menuclienttext7"), source);
			return;
		end
		showClientMenuItem("stop");
	end 
end
addEventHandler("onClientColShapeHit", root, onPlayerTargetPickup);

function onPlayerTargetPickup(theElement)
	if (theElement == localPlayer) then
		showClientMenuItem("stop");
		setElementData(localPlayer, "loot", false);
		setElementData(localPlayer, "currentCol", false);
		setNewbieInfo(false, "", "");
		isInFirePlace = false;
	end
end
addEventHandler("onClientColShapeLeave", root, onPlayerTargetPickup);

function setNewbieInfo(show, head, text, element)
	newbieShow = show;
	newbieHead = head;
	newbieText = text;
	newbiePosition = element;
end

function setNewbieInfo2(text)
	newbieText2 = text;
end

function getLongestString(table)
	local longest
	for k, v in pairs(table) do
		if not longest or string.len(v[1]) > string.len(longest) then
			longest = v[1]
		end
	end
	return longest
end

function getTableStringHeight(table,scale,font)
	local height = 0;
	for k, v in pairs(table) do
		height = height+dxGetFontHeight(scale,font);
	end
	return height
end

function renderMenu(x1,y1,z1,length,sText,wHeight,bxSpace)
	local length2_string = getLongestString(theTableMenuScroll);
	if not length2_string then return; end
	local length2 = dxGetTextWidth(length2_string, 1, "default-bold");
	dxDrawDayzWindow(x1-length/2-sW*0.01, y1+wHeight+3, sW*0.02+length2+10, getTableStringHeight(theTableMenuScroll,1,"default-bold")+bxSpace, dxServerTheme, false);
	for i,v in pairs(theTableMenuScroll) do
		if (i == numberMenuScroll) then
			sText = v[1].." <";
			r2,g2,b2 = unpack(dxServerTheme3);
			a2 = 180;
		else
			sText = v[1];
			r2,g2,b2 = unpack(dxServerTheme3);
			a2 = 150;
		end
		dxDrawingColorTextMenuScroll(sText, x1-length/2-sW*0.001+2.5, y1+i*bxSpace+wHeight-4, sW*0.02+length2, y1+(i+1)*bxSpace, tocolor(r2,g2,b2,a2), 170, 1, "default-bold", "left", "left");
	end
end

addEventHandler("onClientRender", root, function()
	local boxSpace = dxGetFontHeight(1, "default-bold") + dxGetFontHeight(1, "default-bold") * 0.1;
	local bxSpace = dxGetFontHeight(1, "default-bold");
	local side_margin = 12;
	local text_margin = 0.2;
	local wHeight = 0;
	local veh = getPedOccupiedVehicle(localPlayer);
	if veh then
		disableMenu();
	else
		if not newbieShow then
			if (newbiePosition) then
				local x,y,z = getElementPosition(newbiePosition);
				local x1,y1,z1 = getScreenFromWorldPosition(x, y, z);
				renderMenu(x1,y1,z1,0,"",wHeight,bxSpace)
			end
			return;
		end
		local x,y,z = getElementPosition(newbiePosition);
		local x1,y1,z1 = getScreenFromWorldPosition(x, y, z);
		local length = dxGetTextWidth(newbieText, 1, "default-bold");
		if (type(x1) == "number" and type(y1) == "number" and x1 <= sW and y1 <= sH) then
			if (newbieText2 == "") then
				wHeight = (bxSpace*2)+((side_margin*2)+text_margin);
			else
				wHeight = (bxSpace*3)+((side_margin*2)+text_margin);
			end
			dxDrawDayzWindow(x1-length/2-sW*0.01, y1, sW*0.02+length, wHeight, dxServerTheme);
			dxDrawingColorText(newbieHead, x1-length/2-sW*0.01+15, y1+side_margin+1, x1+length/2+sW*0.01, y1+sH*0.03, tocolor(0, 0, 0, 255), 255, 1.1, "default-bold", "left", "left");
			dxDrawingColorText(newbieHead, x1-length/2-sW*0.01+14, y1+side_margin, x1+length/2+sW*0.01, y1+sH*0.03, tocolor(unpack(dxServerTheme3)), 255, 1.1, "default-bold", "left", "left");
			dxDrawingColorText(newbieText, x1-length/2-sW*0.01+14, y1+side_margin+bxSpace+text_margin, x1+length/2+sW*0.01, y1+sH*0.03, tocolor(unpack(dxServerTheme4)), 0.5, 1, "default-bold", "left", "left");
			if (newbieText2 ~= "") then dxDrawingColorText(newbieText2, x1-length/2-sW*0.01+14, y1+side_margin+(bxSpace*2)+text_margin, x1+length/2+sW*0.01, y1+sH*0.03, tocolor(unpack(dxServerTheme4)), 0.5, 1, "default-bold", "left", "left"); end
			renderMenu(x1,y1,z1,length,"",wHeight,bxSpace);
		end
	end
end);

setTimer(function()
	if isInFirePlace then
		if (getElementData(localPlayer, "temperature") <= 48) then
			setElementData(localPlayer, "temperature", getElementData(localPlayer, "temperature")+0.25);
		end
	end
end, 17000, 0);

unbindKey("mouse3", "both");
function onPlayerPressMiddleMouse(key, keyState)
	if (keyState == "down") then
		if not getElementData(localPlayer, "usedItem") then return; end
		local itemName = getMenuMarkedItem();
		if (itemName == "helicrashsite") then
			local col = getElementData(localPlayer, "currentCol");
			local gearName = getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("helicrash")..")";
			refreshLoot(col, gearName);
			showInventoryManual();
			return;
		end
		if (itemName == "itemloot") then
			local col = getElementData(localPlayer, "currentCol");
			local gearName = "Gear";
			refreshLoot(col, gearName);
			showInventoryManual();
			return;
		end
		if (itemName == "wirefence") then
			local col = getElementData(localPlayer, "currentCol");
			local gearName = "Remove Wirefence";
			triggerServerEvent("removeWirefence", localPlayer, getElementData(col, "parent"));
			disableMenu();
			return;
		end
		if (itemName == "hospitalbox") then
			local col = getElementData(localPlayer, "currentCol");
			local gearName = getLanguageTextClient("menuclienttext2").." ("..getLanguageTextClient("hospitalbox")..")";
			refreshLoot(col, gearName);
			showInventoryManual();
			return;
		end
		if (itemName == "vehicle") then
			local col = getElementData(localPlayer, "currentCol");
			for _,v in ipairs(getElementsByType("vehicle")) do
				if (v == col) then
					local gearName = getLanguageTextClient("menuclienttext2").." ("..(getVehicleName(getElementData(col, "parent")))..")";
				end
			end
			refreshLoot(col, gearName);
			showInventoryManual();
			return;
		end
		if (itemName == "refillgas") then
			local col = getElementData(localPlayer, "currentCol");
			triggerEvent("onClientFillGas", localPlayer, col);
			disableMenu();
			return;
		end
		if (itemName == "repairvehicle") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("repairVehicle", localPlayer, getElementData(col, "parent"));
			disableMenu();
			return;
		end
		if (itemName == "installparts") then
			clearScrollMenu();
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Engine_inVehicle") < getElementData(col, "needengines") and getElementData(localPlayer, "vehiclepart1") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart1"), 255, 255, 255, "installengine");
			end
			if (getElementData(col, "Rotor_inVehicle") < getElementData(col, "needrotor") and getElementData(localPlayer, "vehiclepart2") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart2"), 255, 255, 255, "installrotor");
			end
			if (getElementData(col, "Tire_inVehicle") < getElementData(col, "needtires") and getElementData(localPlayer, "vehiclepart3") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart3"), 255, 255, 255, "installtire");
			end
			if (getElementData(col, "Parts_inVehicle") < getElementData(col, "needparts") and getElementData(localPlayer, "vehiclepart4") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart4"), 255, 255, 255, "installtankparts");
			end
			if (getElementData(col, "Scrap_inVehicle") < getElementData(col, "needscrap") and getElementData(localPlayer, "vehiclepart5") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart5"), 255, 255, 255, "installscrap");
			end
			setElementData(localPlayer, "usedItem", true);
			return;
		end
		if (itemName == "removeparts") then
			clearScrollMenu();
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Engine_inVehicle") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart1"), 255, 255, 255, "removeengine");
			end
			if (getElementData(col, "Rotor_inVehicle") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart2"), 255, 255, 255, "removerotor");
			end
			if (getElementData(col, "Tire_inVehicle") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart3"), 255, 255, 255, "removetire");
			end
			if (getElementData(col, "Parts_inVehicle") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart4"), 255, 255, 255, "removetankparts");
			end
			if (getElementData(col, "Scrap_inVehicle") >= 1) then
				createScrollMenuMessage(getLanguageTextClient("vehiclepart5"), 255, 255, 255, "removescrap");
			end
			setElementData(localPlayer, "usedItem", true);
			return;
		end
		if (itemName == "installengine") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Engine_inVehicle") < getElementData(col, "needengines") and getElementData(localPlayer, "toolbelt4") >= 1) then
				setElementData(localPlayer, "vehiclepart1", (getElementData(localPlayer, "vehiclepart1") or 0) - 1);
				setElementData(col, "Engine_inVehicle", getElementData(col, "Engine_inVehicle") + 1);
				triggerServerEvent("setPlayerUseAnimation",localPlayer);
				startRollMessage(getLanguageTextClient("clientinfotext18").." "..getLanguageTextClient("vehiclepart1").." "..getLanguageTextClient("clientinfotext19"), 40, 160, 40);
				disableMenu();
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end,3000,1);
				return;
			end
		end
		if (itemName == "installrotor") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Rotor_inVehicle") < getElementData(col, "needrotor") and getElementData(localPlayer, "toolbelt4") >= 1) then
				setElementData(localPlayer, "vehiclepart2", (getElementData(localPlayer, "vehiclepart2") or 0) - 1);
				setElementData(col, "Rotor_inVehicle", getElementData(col, "Rotor_inVehicle") + 1);
				triggerServerEvent("setPlayerUseAnimation",localPlayer);
				startRollMessage(getLanguageTextClient("clientinfotext18").." "..getLanguageTextClient("vehiclepart2").." "..getLanguageTextClient("clientinfotext19"), 40, 160, 40);
				disableMenu();
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end,3000,1);
				return;
			end
		end
		if (itemName == "installtire") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Tire_inVehicle") < getElementData(col, "needtires") and getElementData(localPlayer, "toolbelt4") >= 1) then
				setElementData(localPlayer, "vehiclepart3", (getElementData(localPlayer, "vehiclepart3") or 0) - 1);
				setElementData(col, "Tire_inVehicle", getElementData(col, "Tire_inVehicle") + 1);
				triggerServerEvent("setPlayerUseAnimation",localPlayer);
				startRollMessage(getLanguageTextClient("clientinfotext18").." "..getLanguageTextClient("vehiclepart3").." "..getLanguageTextClient("clientinfotext19"), 40, 160, 40);
				disableMenu();
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end,3000,1);
				return;
			end
		end
		if (itemName == "installtankparts") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Parts_inVehicle") < getElementData(col, "needparts") and getElementData(localPlayer, "toolbelt4") >= 1) then
				setElementData(localPlayer, "vehiclepart4", (getElementData(localPlayer, "vehiclepart4") or 0) - 1);
				setElementData(col, "Parts_inVehicle", getElementData(col, "Parts_inVehicle") + 1);
				triggerServerEvent("setPlayerUseAnimation",localPlayer);
				startRollMessage(getLanguageTextClient("clientinfotext18").." "..getLanguageTextClient("vehiclepart4").." "..getLanguageTextClient("clientinfotext19"), 40, 160, 40);
				disableMenu();
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end,3000,1);
				return;
			end
		end
		if (itemName == "installscrap") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Scrap_inVehicle") < getElementData(col, "needscrap") and getElementData(localPlayer, "toolbelt4") >= 1) then
				setElementData(localPlayer, "vehiclepart5", (getElementData(localPlayer, "vehiclepart5") or 0) - 1);
				setElementData(col, "Scrap_inVehicle", getElementData(col, "Scrap_inVehicle") + 1);
				triggerServerEvent("setPlayerUseAnimation",localPlayer);
				startRollMessage(getLanguageTextClient("clientinfotext18").." "..getLanguageTextClient("vehiclepart5").." "..getLanguageTextClient("clientinfotext19"), 40, 160, 40);
				disableMenu();
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end,3000,1);
				return;
			end
		end
		if (itemName == "removeengine") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Engine_inVehicle") == 1 and getElementData(localPlayer, "toolbelt4") >= 1) then
				if ((getElementCurrentSlots(localPlayer)+getItemSlots("vehiclepart1")) <= getElementMaxSlots(localPlayer)) then
					local col = getElementData(localPlayer, "currentCol");
					setElementData(localPlayer, "vehiclepart1", (getElementData(localPlayer, "vehiclepart1") or 0) + 1);
					setElementData(col, "Engine_inVehicle", getElementData(col, "Engine_inVehicle") - 1);
					triggerServerEvent("setPlayerUseAnimation",localPlayer);
					startRollMessage(getLanguageTextClient("clientinfotext20").." "..getLanguageTextClient("vehiclepart1").." "..getLanguageTextClient("clientinfotext21"), 40, 160, 40);
					disableMenu();
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end,3000,1);
					return;
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
				end
			end
		end
		if (itemName == "removerotor") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Rotor_inVehicle") == 1 and getElementData(localPlayer, "toolbelt4") >= 1) then
				if ((getElementCurrentSlots(localPlayer)+getItemSlots("vehiclepart2")) <= getElementMaxSlots(localPlayer)) then
					local col = getElementData(localPlayer, "currentCol");
					setElementData(localPlayer, "vehiclepart2", getElementData(localPlayer, "vehiclepart2") + 1);
					setElementData(col, "Rotor_inVehicle", getElementData(col, "Rotor_inVehicle") - 1);
					triggerServerEvent("setPlayerUseAnimation",localPlayer);
					startRollMessage(getLanguageTextClient("clientinfotext20").." "..getLanguageTextClient("vehiclepart2").." "..getLanguageTextClient("clientinfotext21"), 40, 160, 40);
					disableMenu();
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end,3000,1);
					return;
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
				end
			end
		end
		if (itemName == "removetire") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Tire_inVehicle") >= 1 and getElementData(localPlayer, "toolbelt4") >= 1) then
				if ((getElementCurrentSlots(localPlayer)+getItemSlots("vehiclepart3")) <= getElementMaxSlots(localPlayer)) then
					local col = getElementData(localPlayer, "currentCol");
					setElementData(localPlayer, "vehiclepart3", (getElementData(localPlayer, "vehiclepart3") or 0) + 1);
					setElementData(col, "Tire_inVehicle", getElementData(col, "Tire_inVehicle") - 1);
					triggerServerEvent("setPlayerUseAnimation",localPlayer);
					startRollMessage(getLanguageTextClient("clientinfotext20").." "..getLanguageTextClient("vehiclepart3").." "..getLanguageTextClient("clientinfotext21"), 40, 160, 40);
					disableMenu();
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end,3000,1);
					return;
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
				end
			end
		end
		if (itemName == "removetankparts") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Parts_inVehicle") == 1 and getElementData(localPlayer, "toolbelt4") >= 1) then
				if ((getElementCurrentSlots(localPlayer)+getItemSlots("vehiclepart4")) <= getElementMaxSlots(localPlayer)) then
					local col = getElementData(localPlayer, "currentCol");
					setElementData(localPlayer, "vehiclepart4", getElementData(localPlayer, "vehiclepart4") + 1);
					setElementData(col, "Parts_inVehicle", getElementData(col, "Parts_inVehicle") - 1);
					triggerServerEvent("setPlayerUseAnimation",localPlayer);
					startRollMessage(getLanguageTextClient("clientinfotext20").." "..getLanguageTextClient("vehiclepart4").." "..getLanguageTextClient("clientinfotext21"), 40, 160, 40);
					disableMenu();
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end,3000,1);
					return;
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
				end
			end
		end
		if (itemName == "removescrap") then
			local col = getElementData(localPlayer, "currentCol");
			if (getElementData(col, "Scrap_inVehicle") == 1 and getElementData(localPlayer, "toolbelt4") >= 1) then
				if ((getElementCurrentSlots(localPlayer)+getItemSlots("vehiclepart5")) <= getElementMaxSlots(localPlayer)) then
					local col = getElementData(localPlayer, "currentCol");
					setElementData(localPlayer, "vehiclepart5", getElementData(localPlayer, "vehiclepart5") + 1);
					setElementData(col, "Scrap_inVehicle", getElementData(col, "Scrap_inVehicle") - 1);
					triggerServerEvent("setPlayerUseAnimation",localPlayer);
					startRollMessage(getLanguageTextClient("clientinfotext20").." "..getLanguageTextClient("vehiclepart5").." "..getLanguageTextClient("clientinfotext21"), 40, 160, 40);
					disableMenu();
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end,3000,1);
					return;
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
				end
			end
		end
		if (itemName == "burybody") then
			if (getElementData(localPlayer, "weapon27") >= 1) then
				triggerServerEvent("onPlayerBuryBody", localPlayer);
				disableMenu();
				return;
			end
		end
		if (itemName == "tent") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("removeTent", localPlayer, getElementData(col, "parent"),localPlayer);
			disableMenu();
			return;
		end
		if (itemName == "safe_enter_code") then
			local col = getElementData(localPlayer, "safeCol");
			showCodeEdit("enter",getElementData(col, "parent"))
			disableMenu();
			return;
		end
		if (itemName == "safe_c4") then
			local col = getElementData(localPlayer, "safeCol");
			triggerServerEvent("onPlayerPlaceC4", localPlayer,localPlayer,getElementData(col, "parent"));
			disableMenu();
			return;
		end
		if (itemName == "safe_change_code") then
			local col = getElementData(localPlayer, "safeCol");
			showCodeEdit("change",getElementData(col, "parent"))
			disableMenu();
			return;
		end
		if (itemName == "safe_remove") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("removeSafe", localPlayer, getElementData(col, "parent"),localPlayer);
			disableMenu();
			return;
		end
		if (itemName == "detonate_mine") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("removeMine", localPlayer, col);
			disableMenu();
			return;
		end
		if (itemName == "fireplace") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("addPlayerCookMeat", localPlayer);
			disableMenu();
			return;
		end
		if (itemName == "givebandage" or itemName == "giveblood") then
			local col = getElementData(localPlayer, "currentCol");
			triggerServerEvent("onPlayerGiveMedicObject", localPlayer, itemName, getElementData(col, "parent"));
			disableMenu();
			return;
		end
		if (itemName == "dead") then
			local col = getElementData(localPlayer, "currentCol");
			local gearName = getLanguageTextClient("menuclienttext2").." ("..getElementData(col, "playername")..")";
			refreshLoot(col, gearName);
			showInventoryManual();
			return;
		end
		if (itemName == "deadreason") then
			local col = getElementData(localPlayer, "currentCol");
			local dtype,t1,t2,t3,t4,t5,t6,t7,t8 = unpack(getElementData(col, "deadreason"));
			if (dtype == "player") then
				outputChatBox(t1.." "..getLanguageTextClient(t2).." "..getLanguageTextClient(t4)..". "..getLanguageTextClient(t5).." "..t6..":"..t7.." "..getLanguageTextClient(t8), 255, 255, 255, true);
			elseif (dtype == "other") then
				outputChatBox(getLanguageTextClient(t1).." "..t2..":"..t3.." "..getLanguageTextClient(t4), 255, 255, 255, true);
			end
			return;
		end
		if (itemName == "patrolstation") then
			setElementData(localPlayer, "item10", getElementData(localPlayer, "item10") - 1);
			setElementData(localPlayer, "item9", getElementData(localPlayer, "item9") + 1);
			triggerServerEvent("setPlayerUseAnimation",localPlayer);
			startRollMessage(getLanguageTextClient("clientinfotext4").." "..getLanguageTextClient("item10").."!", 40, 160, 40);
			setElementData(localPlayer,"isInAction",true);
			local sound = playSound("sounds/refuel.ogg",false);
			setTimer(function()
				setElementData(localPlayer,"isInAction",false);
				stopSound(sound);
			end, 3000, 1);
			disableMenu();
			return;
		end
		if (itemName == "bottlestation") then
			setElementData(localPlayer, "fooditem2", getElementData(localPlayer, "fooditem2") - 1);
			setElementData(localPlayer, "Water Bottle", getElementData(localPlayer, "Water Bottle") + 1);
			triggerServerEvent("setPlayerUseAnimation",localPlayer);
			startRollMessage(getLanguageTextClient("clientinfotext4").." "..getLanguageTextClient("fooditem2").."!", 40, 160, 40);
			disableMenu();
			return;
		end
		if isToolbeltItem(itemName) then
			local col = getElementData(localPlayer, "currentCol");
			if (#getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1) then return; end
			local x,y,z = getElementPosition(localPlayer)
			if (pcount ~= nil and pcount < getTickCount()) then
				pcount = getTickCount() + 2000;
				x,y,z = getElementPosition(localPlayer);
				startRollMessage("clientinfotext22", 160, 40, 40);
				return false;
			elseif (pcount == nil) then
				pcount = getTickCount() + 2000;
				x,y,z = getElementPosition(localPlayer);
				return false;
			end
			local x1,y1,z1 = getElementPosition(localPlayer);
			if (x1 ~= x or y1 ~= y or z1 ~= z) then
				pcount = nil;
				return false;
			end
			pcount = nil;
			triggerServerEvent("onPlayerTakeItemFromGround", localPlayer, itemName, col);
			disableMenu();
			return;
		end     
		if ((getElementCurrentSlots(localPlayer) + getItemSlots(itemName)) <= getElementMaxSlots(localPlayer)) then
			local col = getElementData(localPlayer, "currentCol");
			if (#getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1) then return; end
			local x,y,z = getElementPosition(localPlayer);
			if (pcount ~= nil and pcount < getTickCount()) then
				pcount = getTickCount() + 2000;
				x,y,z = getElementPosition(localPlayer);
				startRollMessage("clientinfotext22", 160, 40, 40);
				return false;
			elseif (pcount == nil) then
				pcount = getTickCount() + 2000;
				x,y,z = getElementPosition(localPlayer);
				return false;
			end
			local x1,y1,z1 = getElementPosition(localPlayer);
			if (x1 ~= x or y1 ~= y or z1 ~= z) then
				pcount = nil;
				return false;
			end
			pcount = nil;
			triggerServerEvent("onPlayerTakeItemFromGround", localPlayer, itemName, col);
			disableMenu();
		else
			startRollMessage("clientinfotext16", 160, 40, 40);
		end
	end
end 
bindKey("mouse3", "down", onPlayerPressMiddleMouse);
bindKey("mouse5", "down", onPlayerPressMiddleMouse);
bindKey("e", "down", onPlayerPressMiddleMouse);

function getMenuMarkedItem()
	for i,v in pairs(theTableMenuScroll) do
		if (i == numberMenuScroll) then
			return v[5];
		end
	end
end