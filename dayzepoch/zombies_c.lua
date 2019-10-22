local myZombies = {};
local distanceTable = {
	[0] = 1.3,
	[1] = 5,
	[2] = 5,
	[3] = 10,
	[4] = 20,
	[5] = 40
};

addEvent("Zomb_Jump", true);
addEvent("Zomb_Punch", true);
addEvent("Zomb_STFU", true);
addEvent("Zomb_Moan", true);
addEvent("Spawn_Placement", true);

function table.getn(table)
	return #table;
end

addEventHandler("onClientPlayerWasted", localPlayer, function()
	setTimer(Zomb_release, 4000, 1);
end);

function Zomb_release()
	for k,ped in pairs(myZombies) do
		if isElement(ped) then
			if (getElementData(ped, "zombie") == true) then
				setElementData(ped, "target", nil);
				setElementData(ped, "status", "idle");
				table.remove(myZombies, k);
			end
		end
	end
end

addEventHandler("onClientPedWasted", root, function(killer, weapon, bodypart)
	if (getElementData(source, "zombie") == true) and (getElementData(source, "status") ~= "dead") then
		setElementData(source, "target", nil);
		setElementData(source, "status", "dead");
	end
end);

function zombie_check()
	if (getElementData(localPlayer, "zombie") ~= true) and not isPedDead(localPlayer) then
		local zombies = getElementsByType("ped", root, true);
		local Px,Py,Pz = getElementPosition(localPlayer);
		local stealth = 0;
		if isPedDucked(localPlayer) then
			Pz = Pz-1;
			stealth = 5;
		end
		for theKey,theZomb in ipairs(zombies) do
			if isElement(theZomb) then
				local Zx,Zy,Zz = getElementPosition(theZomb);
				local number = tonumber(getElementData(localPlayer, "visibly"))+tonumber(getElementData(localPlayer, "volume"));
				if (number > 5) then number = 5; end
				local realnumb = number-stealth;
				if realnumb < 0 then realnumb = 0; end
				local distance = distanceTable[realnumb];
				if (getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz) <= distance) then
					if getElementData(theZomb, "zombie") then
						if (getElementData(theZomb, "status") == "idle") then
							local isclear = isLineOfSightClear(Px, Py, Pz+1, Zx, Zy, Zz+1, true, false, false, true, false, false, false);
							if isclear then
								setElementData(theZomb, "status", "chasing");
								setElementData(theZomb, "target", localPlayer);
								table.insert(myZombies, theZomb);
								table.remove(zombies, theKey);
								zombieradiusalert(theZomb);
							end
						elseif (getElementData(theZomb, "status") == "chasing") and (getElementData(theZomb, "target") == nil) then
							local isclear = isLineOfSightClear(Px, Py, Pz+1, Zx, Zy, Zz+1, true, false, false, true, false, false, false);
							if isclear then
								setElementData(theZomb, "target", localPlayer);
								isthere = "no";
								for _,ped in pairs(myZombies) do
									if (ped == theZomb) then
										isthere = "yes";
									end
								end
								if (isthere == "no") then
									table.insert(myZombies, theZomb);
									table.remove(zombies, theKey);
								end
							end
						elseif (getElementData(theZomb, "target") == localPlayer) then
							local isclear = isLineOfSightClear(Px, Py, Pz+1, Zx, Zy, Zz+1, true, false, false, true, false, false, false);
							if not isclear then
								setElementData(theZomb, "target", nil);
								triggerServerEvent("onZombieLostPlayer", theZomb, oldPx, oldPy, oldPz);
							end
						end
					end
				end
			end
		end
	end
	for k,ped in pairs(myZombies) do
		if not isElement(ped) then
			table.remove(myZombies, k);
		end
	end
	oldPx,oldPy,oldPz = getElementPosition(localPlayer);
end

function zombie_aggro_check()
	if (getElementData(localPlayer, "zombie") ~= true) and not isPedDead(localPlayer) then
		local zombies = getElementsByType("ped", root, true);
		for theKey,theZomb in ipairs(zombies) do
			if isElement(theZomb) then
				if getElementData(theZomb, "zombie") then
					local status = getElementData(theZomb, "status");
					local target = getElementData(theZomb, "target");
					if status == "chasing" and isElement(target) then
						local Px,Py,Pz = getElementPosition(target);
						local Zx,Zy,Zz = getElementPosition(theZomb);
						if isPedDucked(target) then
							local Pz = Pz-1;
						end
						local number = tonumber(getElementData(target, "visibly"))+tonumber(getElementData(target, "volume"));
						if (number > 3) then number = 3; end
						local distance = distanceTable[number];
						if (getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz) > distance) then
							setElementData(theZomb, "status", "idle");
							setElementData(theZomb, "target", nil);
							triggerServerEvent("onZombieLostPlayer", theZomb, oldPx, oldPy, oldPz);
						end
					end
				end
			end
		end
	end
end

addEventHandler("onClientResourceStart", resourceRoot, function()
	setTimer(clientsetup, 1234, 1);
	MainClientTimer1 = setTimer(zombie_check, 1000, 0);
	MainClientTimer2 = setTimer(zombie_aggro_check, 1000, 0);
end);

function clientsetup()
	for _,theZomb in ipairs(getElementsByType("ped")) do
		if isElement(theZomb) then
			if getElementData(theZomb, "zombie") then
				setPedVoice(theZomb, "PED_TYPE_DISABLED");
			end
		end
	end
end

addEventHandler("onClientElementDataChange", root, function(dataName)
	if (getElementType(source) == "ped" and dataName == "status") then
		local thestatus = getElementData(source, "status");
		if (thestatus == "idle") or (thestatus == "dead") then		
			for k,ped in pairs(myZombies) do
				if (ped == source and getElementData(ped, "zombie")) then
					setElementData(ped, "target", nil);
					table.remove(myZombies, k);
					setElementData(localPlayer, "dangercount", tonumber(table.getn(myZombies)));
				end
			end
		end
	end
end);

addEventHandler("Zomb_Jump", root, function(ped)
	if isElement(ped) then
		setPedControlState(ped, "jump", true);
		setTimer(function(ped) if isElement(ped) then setPedControlState(ped, "jump", false); end end, 800, 1, ped);
	end
end);

addEventHandler("Zomb_Punch", root, function(ped)
	if isElement(ped) then
		setPedControlState(ped, "fire", true);
		setTimer(function(ped) if isElement(ped) then setPedControlState(ped, "fire", false); end end, 800, 1, ped);
	end
end);

addEventHandler("Zomb_STFU", root, function(ped)
	if isElement(ped) then
		setPedVoice(ped, "PED_TYPE_DISABLED");
	end
end);

addEventHandler("Zomb_Moan", root, function(ped, randnum)
	if isElement(ped) then
		local Zx,Zy,Zz = getElementPosition(ped);
		local sound = playSound3D("sounds/zombies/mgroan"..randnum..".ogg", Zx, Zy, Zz, false);
		setSoundMaxDistance(sound, 20);
	end
end);

addEventHandler("onClientPedWasted", root, function(killer, weapon, bodypart)
	if (getElementType(source) == "ped") then
		if (getElementData(source, "zombie") == true) then
			setElementCollisionsEnabled(source, false);
		end
	end
end);

function zombieradiusalert(theElement)
	local Px,Py,Pz = getElementPosition(theElement);
	for _,theZomb in ipairs(getElementsByType("ped")) do
		if isElement(theZomb) then
			if getElementData(theZomb, "zombie") then
				if (getElementData(theZomb, "status") == "idle") then
					local Zx,Zy,Zz = getElementPosition(theZomb);
					if (getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz) < 10) and not isPedDead(localPlayer) then
						isthere = "no";
						for _,ped in pairs(myZombies) do
							if (ped == theZomb) then
								isthere = "yes";
							end
						end
						if (isthere == "no" and not getElementData(localPlayer, "zombie")) then
							if (getElementType(theElement) == "ped") then
								local isclear = isLineOfSightClear(Px, Py, Pz, Zx, Zy, Zz, true, false, false, true, false, false, false);
								if isclear then
									setElementData(theZomb, "status", "chasing");
									setElementData(theZomb, "target", localPlayer);
									table.insert(myZombies, theZomb);
								end
							else
								setElementData(theZomb, "status", "chasing");
								setElementData(theZomb, "target", localPlayer);
								table.insert(myZombies, theZomb);
							end
						end
					end
				end
			end
		end
	end
end

addEventHandler("Spawn_Placement", root, function(xcoord, ycoord)
	local x,y,z = getElementPosition(localPlayer)
	local posx = x+xcoord;
	local posy = y+ycoord;
	local gz = getGroundPosition(posx, posy, z+500);
	triggerServerEvent("onZombieSpawn", localPlayer, posx, posy, gz+1);
end);