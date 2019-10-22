local ZombieLimit = 50;
local ZombieStreaming = 0;
local ZombieSpeed = 2;
local moancount = 0;
local moanlimit = 10;
local chaseanim = "fatsprint"; --"Run_Wuzi";
local chaseblock = "fat"; --"ped";
local checkspeed = 100;
local everyZombie = {};
local zombiePedSkins = {
	15,22,56,67,68,69,
	70,92,97,105,107,
	108,126,127,128,129
};
local itemTableZombies = {
	{"toolbelt5", 5},
	{"item1", 5},
	{"weapon21", 0.4},
	{"weapon20", 0.3},
	{"weapon24", 7},
	{"weapon22", 7},
	{"fooditem9", 7},
	{"fooditem7", 7},
	{"weapon18", 0.1},
	{"item10", 5},
	{"item5", 9},
	{"item11", 9},
	{"item12", 9},
	{"weapon26", 0.5},
	{"fooditem6", 5},
	{"backpack4", 6},
	{"medicine6", 7},
	{"weapon23", 0.4},
	{"fooditem8", 6},
	{"item6", 6},
	--{"currency3", 65},
	{"weapon16", 0.5},
	{"weapon19", 0.3},
	{"weapon15", 0.2},
	{"toolbelt3", 3},
	{"medicine4", 6},
	{"item2", 1},
	{"weapon7", 0.4},
	{"backpack3", 0.5},
	{"vehiclepart3", 1},
	{"medicine8", 2},
	{"clothing3", 12},
	{"toolbelt1", 4},
	{"weapon17", 0.5},
	{"toolbelt2", 1},
	{"fooditem3", 5},
	{"fooditem4", 5},
	{"weapon8", 0.2},
	{"fooditem5", 2},
	{"toolbelt8", 3},
	{"weapon27", 0.5}
};

addEvent("onZombieSpawn", true);
addEvent("onZombieLostPlayer", true);
addEvent("onZombieGetsKilled", true);
addEvent("createZomieForPlayer", true);


function table.getn(table)
	return #table;
end

function Zomb_Idle(ped)
	if isElement(ped) then
		if (getElementData(ped, "status") == "idle") and not isPedDead(ped) and getElementData(ped, "zombie") then
			local action = math.random(1, 9);
			if (action < 4) then
				local rdmangle = math.random(1, 359);
				setElementRotation(ped, 0, 0, rdmangle);
				setPedAnimation(ped, "PED", "Player_Sneak", -1, true, true, true);
				setTimer(Zomb_Idle, 7000, 1, ped);
			elseif (action == 7) then
				setPedAnimation(ped, "MEDIC", "cpr", -1, false, true, true);
				setTimer(Zomb_Idle, 4000, 1, ped);
			elseif (action == 8) then
				setPedAnimation(ped);
				setTimer(Zomb_Idle, 4000, 1, ped);
			end
		end
	end
end

function chaseAnim(ped)
	if isElement(ped) then
		setPedAnimation(ped, chaseblock, chaseanim, -1, true, true, true);
	end
end

function Zomb_chase(ped, Zx, Zy, Zz)
	if isElement(ped) then
		if (getElementData(ped, "status") == "chasing") and (getElementData(ped, "zombie") == true) then
			local x,y,z = getElementPosition(ped);
			if ((getElementData(ped, "target") == nil) and getElementData(ped, "Tx") ~= false) then			
				local Px = getElementData(ped, "Tx");
				local Py = getElementData(ped, "Ty");
				local Pz = getElementData(ped, "Tz");
				local Pdistance = getDistanceBetweenPoints3D(Px, Py, Pz, x, y, z );
				if (Pdistance < 1.5) then
					setTimer(setElementData, 2000, 1, ped, "status", "idle");
				end
			end
			if (getDistanceBetweenPoints3D(x, y, z, Zx, Zy, Zz ) < 1.5) then
				if not getElementData(ped, "target") then
					local giveup = math.random(1, 15);
					if (giveup == 1) then
						setElementData(ped, "status", "idle");
					else
						local action = math.random(1, 2);
						if (action == 2) then
							setPedAnimation(ped);
							triggerClientEvent("Zomb_Jump", root, ped);
							setTimer(Zomb_chase, 100, 1, ped, x, y, z);
						else
							setPedAnimation(ped);
							triggerClientEvent("Zomb_Punch", root, ped);
							zmoan(ped);
							setTimer(chaseAnim, 800, 1, ped);
							setTimer(Zomb_chase, 100, 1, ped, x, y, z);
						end
					end
				else 
					local Ptarget = getElementData(ped, "target");
					if isElement(Ptarget) then
						local Px,Py,Pz = getElementPosition(Ptarget);
						local Pdistance = getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz);
						if (Pdistance < 1.5) then
							if ped and isPedDead(Ptarget) then
								setPedAnimation(ped);
								setPedAnimation(ped, "MEDIC", "cpr", -1, false, true, false);
								setTimer(function(ped)
									if (ped) then
										setElementData(ped,"status","idle");
										setElementRotation(ped,0,0,getElementRotation(ped)-180);
									end
								end,10000,1,ped)
								zmoan(ped);
							else
								local action = math.random(1, 6);
								if (action == 3) then
									setPedAnimation(ped);
									triggerClientEvent("Zomb_Jump", root, ped);
									setTimer(Zomb_chase, 100, 1, ped, x, y, z);
								else
									setPedAnimation(ped);
									triggerClientEvent("Zomb_Punch", root, ped);
									zmoan(ped);
									setTimer(chaseAnim, 800, 1, ped);
									setTimer(Zomb_chase, 100, 1, ped, x, y, z);
								end
							end
						else
							setPedAnimation(ped, chaseblock, chaseanim, -1, true, true, true);
							setTimer(Zomb_chase, checkspeed, 1, ped, x, y, z);
						end
					else
						setElementData(ped, "status", "idle");
					end
				end
			else
				setPedAnimation(ped, chaseblock, chaseanim, -1, true, true, true);
				setTimer(Zomb_chase, checkspeed, 1, ped, x, y, z);
			end
		end
	end
end

function setangle()
	for _,ped in ipairs(everyZombie) do
		if isElement(ped) then
			if (getElementData(ped, "status" ) == "chasing") then
				local x,y,z,px,py,pz
				if (getElementData(ped, "target") ~= nil) then
					local ptarget = getElementData(ped, "target");
					if isElement(ptarget) then
						x,y,z = getElementPosition(ptarget);
						px,py,pz = getElementPosition(ped);
					else
						setElementData(ped, "status", "idle");
						x,y,z = getElementPosition(ped);
						px,py,pz = getElementPosition(ped);
					end
					zombangle = (360-math.deg(math.atan2((x-px), (y-py))))%360;
					setElementRotation(ped, 0, 0, zombangle);
				elseif (getElementData(ped, "target") == nil) and (getElementData(ped, "Tx") ~= false) then
					x = getElementData(ped, "Tx");
					y = getElementData(ped, "Ty");
					z = getElementData(ped, "Tz");
					px,py,pz = getElementPosition(ped);
					zombangle = (360-math.deg(math.atan2((x-px), (y-py))))%360;
					setElementRotation(ped, 0, 0, zombangle);
				end
			end
		end
	end
end

addEventHandler("onElementDataChange", root, function(dataName)
	if (getElementType(source) == "ped" and dataName == "status") then
		if (getElementData(source, "zombie") == true) then
			if (isPedDead(source) == false) then
				if (getElementData(source, "status") ==  "chasing") then
					local Zx,Zy,Zz = getElementPosition(source);
					setTimer(Zomb_chase, 1000, 1, source, Zx, Zy, Zz);
					local newtarget = getElementData(source, "target");
					if isElement (newtarget) then
						if (getElementType(newtarget) == "player") then
							setElementSyncer(source, newtarget);
						end
					end
					zmoan(source);
				elseif (getElementData(source, "status") ==  "idle") then
					setTimer(Zomb_Idle, 1000, 1, source);
				elseif (getElementData(source, "status") ==  "throatslashing") then
					local tx,ty,tz = getElementPosition(source);
					local ptarget = getElementData(source, "target");
					if isElement(ptarget) then
						local vx,vy,vz = getElementPosition(ptarget);
						if (getDistanceBetweenPoints3D(tx, ty, tz, vx, vy, vz) < .8) then
							zmoan(source);
							setPedAnimation(source, "knife", "KILL_Knife_Player", -1, false, false, true);
							setPedAnimation(ptarget, "knife", "KILL_Knife_Ped_Damage", -1, false, false, true);
							setTimer(Playerthroatbitten, 2300, 1, ptarget, source);
							setTimer(function(source) if (isElement(source)) then setElementData(source, "status", "idle"); end end, 5000, 1, source);
						else
							setElementData(source, "status", "idle");
						end
					else
						setElementData(source, "status", "idle");
					end
				end
			elseif (getElementData(source, "status") ==  "dead") then
				setTimer(Zomb_delete, 10000, 1, source);
			end
		end
	end
end)


addEventHandler("onResourceStart", root, function(startedResource)
	newZombieLimit = 50;
	if (newZombieLimit ~= false) then
		if (newZombieLimit > ZombieLimit) then 
			newZombieLimit = ZombieLimit;
		end
	else
		newZombieLimit = ZombieLimit;
	end
	WoodTimer = setTimer(WoodSetup, 2000, 1);
	if (startedResource == getThisResource()) then
		for _,thep in ipairs(getElementsByType("player")) do
			setElementData(thep, "dangercount", 0);
		end	
		for _,playerValue in ipairs(getAlivePlayers()) do
			setElementData(playerValue, "alreadyspawned", true);
		end
		if (ZombieSpeed == 2) then
			MainTimer1 = setTimer(setangle, 200, 0);
		else
			MainTimer1 = setTimer(setangle, 400, 0);
		end
		MainTimer3 = setTimer(clearFarZombies, 3000, 0);
		if (ZombieStreaming == 1) then
			MainTimer2 = setTimer(SpawnZombie, 2500, 0);
		elseif (ZombieStreaming == 2) then
			MainTimer2 = setTimer(SpawnpointZombie, 2500, 0);
		end
	end
end);

addEventHandler("onPlayerJoin", root, function()
	setElementData(source, "dangercount", 0);
end);

function WoodSetup()
	for _,colValue in ipairs(getElementsByType("colshape")) do
		if (getElementData(colValue, "purpose" ) == "zombiewood") then
			destroyElement(colValue);
		end
	end	
	for _,objectValue in ipairs(getElementsByType("object")) do
		if (getElementData(objectValue, "purpose") == "zombiewood") then
			setElementDimension(objectValue, 26);
			local x,y,z = getElementPosition(objectValue);
			local thecol = createColSphere(x, y, z, 1.6 );
			setElementData(thecol, "purpose", "zombiewood" );
			setElementParent(thecol, objectValue);
		end
	end	
end

function ReduceMoancount()
	moancount = moancount - 1;
end

function zmoan(zombie)
	if (moancount < moanlimit) then
		moancount = moancount + 1;
		local randnum = math.random(1, 10);
		triggerClientEvent("Zomb_Moan", root, zombie, randnum);
		setTimer(ReduceMoancount, 800, 1);
	end
end

function Zomb_delete(ped)
	if isElement(ped) then
		if (getElementData(ped, "zombie") == true) then
			for theKey,thePed in ipairs(everyZombie) do
				if (ped == thePed) then
					table.remove(everyZombie, theKey);
					break;
				end
			end
			destroyElement(ped);
		end
	end
end

function Zomb_delete_player(ped)
	if isElement(ped) then
		if (getElementData(ped, "zombie") == true) then
			for theKey,thePed in ipairs(everyZombie) do
				if (ped == thePed) then
					table.remove(everyZombie, theKey);
					break;
				end
			end
			local zOwner = getElementData(ped, "owner");
			setElementData(zOwner, "spawnedzombies", getElementData(zOwner, "spawnedzombies") - 1);
			destroyElement(ped);
		end
	end
end

function Playerthroatbitten(player, attacker)
	local Zx, Zy, Zz = getElementPosition(attacker);
	local Px, Py, Pz = getElementPosition(player);
	local distance = getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz);
	if (distance < 1) then
		killPed(player, attacker, weapon, bodypart);
	else
		setPedAnimation(player);
	end
end

function SpawnZombie()
	local pacecount = 0;
	while (pacecount < 5) do
		if (table.getn(everyZombie) + pacecount < newZombieLimit) and (ZombieStreaming == 1) then	
			local xcoord = 0;
			local ycoord = 0;
			local xdirection = math.random(1, 2);
			if (xdirection == 1) then
				xcoord = math.random(15, 40);
			else
				xcoord = math.random(-40, -15);
			end
			local ydirection = math.random(1, 2);
			if (ydirection == 1) then
				ycoord = math.random(15, 40);
			else
				ycoord = math.random(-40, -15);
			end
			local liveplayers = getAlivePlayers();
			if (table.getn(liveplayers) > 0) then
				local lowestcount = 99999;
				local lowestguy = nil;
				for _,thePlayer in ipairs(liveplayers) do
					if isElement(thePlayer) then
						if (getElementData(thePlayer, "dangercount")) and (getElementData(thePlayer, "zombieProof") ~= true) and (getElementData(thePlayer, "alreadyspawned" ) == true) then
							if (getElementData (thePlayer, "dangercount") < lowestcount) then
								local safezone = 0;
								local gx,gy,gz = getElementPosition(thePlayer);
								for _,theradar in ipairs(getElementsByType("radararea")) do
									if (getElementData(theradar, "zombieProof") == true) then
										if isInsideRadarArea(theradar, gx, gy) then
											safezone = 1;
										end
									end
								end
								if (safezone == 0) then
									lowestguy = thePlayer;
									lowestcount = getElementData(thePlayer, "dangercount");
								end
							end
						end
					end
				end
				pacecount = pacecount + 1;
				if isElement(lowestguy) then
					triggerClientEvent("Spawn_Placement", lowestguy, ycoord, xcoord);
				else
					pacecount = pacecount + 1;
				end
			else
				pacecount = pacecount + 1;
			end
		else
			pacecount = pacecount + 1;
		end
	end
end

function clearFarZombies()
	if (newZombieLimit ~= false) then
		local toofarzombies = {};
		for ZombKey,theZomb in ipairs(everyZombie) do
			if isElement(theZomb) then
				if getElementData(theZomb, "zombie") then
					far = 1;
					local Zx,Zy,Zz = getElementPosition(theZomb);
					for _,thePlayer in ipairs(getElementsByType("player")) do
						local Px,Py,Pz = getElementPosition(thePlayer);
						if (getDistanceBetweenPoints3D(Px, Py, Pz, Zx, Zy, Zz) < 100) then
							far = 0;
						end
					end
					if (far == 1) then
						table.insert(toofarzombies, theZomb);
					end
				end
			else
				table.remove(everyZombie, ZombKey);
			end
		end
		if (table.getn(toofarzombies) >= 1) then
			for _,theZomb in ipairs(toofarzombies) do
				if getElementData(theZomb, "zombie") then
					Zomb_delete_player(theZomb);
				end
			end
		end
	end
end

addEventHandler("onPlayerSpawn", root, function()
	if (ZombieStreaming == 1 or ZombieStreaming == 2) then
		local relocatecount = 0;
		for _,theZomb in ipairs(everyZombie) do
			if (relocatecount < 14) then
				if not getElementData(theZomb, "forcedtoexist") then
					if (getElementData(theZomb, "status") == "idle") and not isPedDead(theZomb) and getElementData(theZomb, "zombie") then
						relocatecount = relocatecount + 1;
						Zomb_delete(theZomb);
					end
				end
			end
		end
	end
	if not getElementData(source, "alreadyspawned") then
		setElementData(source, "alreadyspawned", true);
	end
end);

function createZombie(x, y, z, rot, skin)
	if (table.getn(everyZombie) < newZombieLimit) then
		local zomb = createPed(tonumber(skin), tonumber(x), tonumber(y), tonumber(z));
		if isElement(zomb) then
			setElementData(zomb, "zombie", true);
			setElementData(zomb, "forcedtoexist", true);
			setElementRotation(zomb, 0, 0, rot);
			setElementData(zomb, "status", "idle");
			table.insert(everyZombie, zomb);
			triggerClientEvent("Zomb_STFU", root, zomb);
			return zomb;
		end
	end
	return false;
end

function isPedZombie(ped)
	if isElement(ped) then
		if getElementData(ped, "zombie") then
			return true;
		end
	end
	return false;
end

addEventHandler("onZombieLostPlayer", root, function(x, y, z)
	setElementData(source, "Tx", x, false);
	setElementData(source, "Ty", y, false);
	setElementData(source, "Tz", z, false);
end);

addEventHandler("createZomieForPlayer", root, function(x, y, z)
	local zombie = createZombie(x, y, z, math.random(360), zombiePedSkins[math.random(#zombiePedSkins)]);
	setElementData(zombie, "zombie", true);
	setElementData(zombie, "blood", math.random(8000, 12000));
	setElementData(zombie, "owner", client);
	setElementData(client, "spawnedzombies", getElementData(client, "spawnedzombies") + 1);
end);

addEventHandler("onPlayerQuit", root, function()
	for _,v in ipairs(getElementsByType("ped")) do
		if getElementData(v, "zombie") then
			if (getElementData(v, "owner") == source) then
				destroyElement(v);
			end
		end
	end
end);

addEventHandler("onZombieGetsKilled", root, function(killer, headshot, weapon)
	if (killer and getElementType(killer) == "player") then
		if headshot then
			setElementData(killer, "headshots", getElementData(killer, "headshots") + 1);
			setElementData(killer, "stats.headshots", getElementData(killer, "stats.headshots") + 1);
		end
		setElementData(killer, "zombieskilled", getElementData(killer, "zombieskilled") + 1);
		setElementData(killer, "stats.zombieskilled", getElementData(killer, "stats.zombieskilled") + 1);
	end
	local x,y,z = getElementPosition(source);
	local rx,ry,rz = getElementRotation(source);
	local ped = createPed(getElementModel(source),x,y,z,rz);
	local pedCol = createColSphere(x, y, z, 1.5);
	if (headshot) then
		setPedHeadless(ped, true);
	end
	killPed(ped);
	setTimer(function(ped, pedCol)
		if isElement(ped) then destroyElement(ped); end
		if isElement(pedCol) then destroyElement(pedCol); end
	end, (10*60000), 1, ped, pedCol);
	attachElements(pedCol, ped);
	setElementData(pedCol, "parent", ped);
	setElementData(pedCol, "playername", "zombiename");
	setElementData(pedCol, "deadman", true);
	setElementData(pedCol, "MAX_Slots", 8);
	setElementData(ped, "deadzombie", true);
	local time = getRealTime();
	setElementData(pedCol, "deadreason",{"other","deadzombietext",time.hour,time.minute,"clocktext"});
	for _,v in ipairs(itemTableZombies) do
		local value = math.percentChance(v[2]/2.5, 1);
		setElementData(pedCol, v[1], value);
		local ammoData,_ = getWeaponAmmoType(v[1]);
		if (ammoData and value > 0) then
			setElementData(pedCol, ammoData, getMagazineSize(ammoData));
		end
	end
	if (weapon == 33) then
		setElementData(pedCol, "mag9", 1);
	end
	local zOwner = getElementData(source, "owner");
	setElementData(zOwner, "spawnedzombies", getElementData(zOwner, "spawnedzombies") - 1);
	destroyElement(source);
end);