local itemReplaceTable = {
	["mods/weapons/"] = {
		-- unused 1832,1870,1871,1873
		1869,1872,1874,1875,
		1876,1830,1880,1833,
		1834,1835,1838,1839,
		351,333,1877,1878,
		1879,1881,1882,357,
		348,349
	},
	["mods/skins/"] = {
		12,13,14,285,179,180,288,
		73,27,29,66,210,287
	},
	["mods/skins/zombies/"] = {
		15,22,56,67,68,69,
		70,92,97,105,107,
		108,126,127,128,129
	},
	["mods/items/"] = {
		1247,1213,1241,1577,2601,
		2891,1576,2709,2770,3013,
		2358,3026,2041,2647,2683,
		1271,983,367,1252,3243,
		1575,339,1717,1719,1725,
		1736,1738,1745,1747,1748,
		1749,1750,1751,2105,2106,
	}
};

local disabledWeaponIndexSounds = {
	5,13,33,53,3,4,24,15,76,
	77,26,52,27,23,55,32,73,
	74,21,22,2,3,6,7,8,1,29,
	30,0,14,18,17
}

local emptyWeaponModels = { -- custom weapons that are used to make more weapons
	347,353,355,356,358
}

addEventHandler("onClientResourceStart", resourceRoot, function()
	for i = 346, 358 do
		for _,v in pairs(emptyWeaponModels) do
			if (i == v) then
				local tex = engineLoadTXD("mods/weapons/alpha.txd", i);
				engineImportTXD(tex, i);
				local mod = engineLoadDFF("mods/weapons/alpha.dff", i);
				engineReplaceModel(mod, i);
			end
		end
	end
	for k,_ in pairs(itemReplaceTable) do
		for _,v in ipairs(itemReplaceTable[k]) do
			local txd = engineLoadTXD(k..tostring(v)..".txd", v);
			engineImportTXD(txd, v);
			local dff = engineLoadDFF(k..tostring(v)..".dff", v);
			engineReplaceModel(dff, v);
			if (fileExists(k..tostring(v)..".col")) then
				local col = engineLoadCOL(k..tostring(v)..".col", v);
				engineReplaceCOL(col, v);
			end
		end
	end
	-- standart txd skin textures
	local txd = engineLoadTXD("mods/skins/73_1.txd", v);
	engineImportTXD(txd, 71);
	local dff = engineLoadDFF("mods/skins/73.dff", v);
	engineReplaceModel(dff, 71);
	local txd = engineLoadTXD("mods/skins/73_2.txd", v);
	engineImportTXD(txd, 72);
	local dff = engineLoadDFF("mods/skins/73.dff", v);
	engineReplaceModel(dff, 72);
	local shader_1 = dxCreateShader("scripts/tools/tex_r.fx");
	local texture_1 = dxCreateTexture("images/empty.png");
	dxSetShaderValue(shader_1, "gTexture", texture_1);
	engineApplyShaderToWorldTexture(shader_1, "shad_exp");
	engineApplyShaderToWorldTexture(shader_1, "cameracrosshair");
	engineApplyShaderToWorldTexture(shader_1, "snipercrosshair");
	toggleControl("radar", false);
	setPlayerHudComponentVisible("radar", false);
	setPlayerHudComponentVisible("area_name", false);
	setPlayerHudComponentVisible("breath", false);
	setPlayerHudComponentVisible("clock", false);
	setPlayerHudComponentVisible("money", false);
	setPlayerHudComponentVisible("health", false);
	setPlayerHudComponentVisible("vehicle_name", false);
	setPlayerHudComponentVisible("radio", false);
	setPlayerHudComponentVisible("weapon", false);
	setPlayerHudComponentVisible("ammo", false);
	setPedTargetingMarkerEnabled(false);
	setAmbientSoundEnabled("general", false);
	setAmbientSoundEnabled("gunfire", false);
	for _,v in ipairs(disabledWeaponIndexSounds) do
		setWorldSoundEnabled(5,v,false);
	end
	setWorldSoundEnabled(40,0,false);
	setWorldSoundEnabled(40,1,false);
	setWorldSoundEnabled(40,2,false);
	setWorldSoundEnabled(7,0,false);
	setWorldSoundEnabled(7,1,false);
	setWorldSoundEnabled(8,0,false);
	setWorldSoundEnabled(8,1,false);
	setWorldSoundEnabled(10,0,false);
	setWorldSoundEnabled(10,1,false);
	setWorldSoundEnabled(11,0,false);
	setWorldSoundEnabled(11,1,false);
	setWorldSoundEnabled(12,0,false);
	setWorldSoundEnabled(12,1,false);
	setWorldSoundEnabled(13,0,false);
	setWorldSoundEnabled(13,1,false);
	setWorldSoundEnabled(14,0,false);
	setWorldSoundEnabled(14,1,false);
	setWorldSoundEnabled(15,0,false);
	setWorldSoundEnabled(15,1,false);
	setWorldSoundEnabled(9,0,false);
	setWorldSoundEnabled(9,1,false);
	for _,v in pairs(getElementsByType("object")) do
		engineSetModelLODDistance(getElementModel(v), 500);
	end
end);

local weaponPropertyTable = {
	-- example: {name,damage,recoil,firedelay(in miliseconds),fire_sound,vehicle_damage}

	-- Primary
	{"weapon1",47850,0.7,250,"m107.wav",15},
	{"weapon2",9200,0.5,250,"dmr.wav",13},
	{"weapon3",7800,0.5,150,"cz550.wav",12},
	{"weapon4",7500,0.5,150,"svd.wav",12},
	{"weapon5",5600,0.5,150,"m24.wav",12},
	{"weapon6",4500,0.4,0,"aksgold.wav",12},
	{"weapon7",4276,0.7,100,"winchester1866.wav",10},
	{"weapon8",3900,0.1,1500,"crossbow.mp3",8},
	{"weapon9",3850,0.4,0,"aks74u.wav",9},
	{"weapon10",3600,0.4,0,"ak107.wav",9},
	{"weapon11",3420,0.4,0,"m4a1holo.wav",10},
	{"weapon12",3200,0.45,151,"mk48.wav",8},
	{"weapon13",2800,0.45,125,"rpk.wav",8},
	{"weapon14",2755,0.4,0,"sa58v.wav",9},
	{"weapon15",2321,0.4,50,"saiga12k.wav",9},

	-- Secondary
	{"weapon16",20000,0,"","",0},
	{"weapon17",2939,0,"","",7},
	{"weapon18",2132,0.35,0,"mp5a5.wav",5},
	{"weapon19",2789,0.7,50,"revolver.wav",4},
	{"weapon20",1934,0.25,0,"pdw.wav",5},
	{"weapon21",2189,0.3,0,"m1911.wav",4},
	{"weapon22",1934,0,"","",5},
	{"weapon23",1889,0.15,50,"m9sd.wav",4},
	{"weapon24",1869,0,"","",5},
	{"weapon25",1553,0.3,75,"g17.wav",3},
	{"weapon26",983,0,"","",4},
	{"weapon27",950,0,"","",3},

	--
};


local helmetDamageReduction = {
	--["helmet"] = reduce by,
	["helmet5"] = 2.5,
	["helmet1"] = 2,
	["helmet2"] = 1.8,
	["helmet4"] = 1.5,
	["helmet3"] = 1.3,
	["helmet6"] = 1, -- 1 means no reduction
	["helmet7"] = 1, -- 1 means no reduction
};

local vestDamageReduction = {
	--["vest"] = reduce by,
	["vest2"] = 2,
	["vest1"] = 1.5,
};

function getWeaponPropertyTable()
	return weaponPropertyTable;
end

local messagesTable = { -- You can add as many as you want!
	"hint1",
	"hint2",
	"hint3",
	--"hint4",
	"hint5",
	"hint6",
	"hint7",
	"hint8",
	"hint9",
	"hint10",
	"hint11",
};

local helptext = {
	"newbiehelp1",
	"newbiehelp2",
	"newbiehelp3",
	"newbiehelp4",
	"newbiehelp5",
	"newbiehelp6",
	"newbiehelp7",
	"newbiehelp8",
	"newbiehelp9",
	"newbiehelp10",
	"newbiehelp11"
};

local weaponNoiseTable = {
	{"weapon11",150},
	{"weapon12",150},
	{"weapon13",150},
	{"weapon10",150},
	{"weapon6",150},
	{"weapon14",150},
	{"weapon2",300},
	{"weapon3",300},
	{"weapon5",300},
	{"weapon1",300},
	{"weapon4",300},
	{"weapon7",150},
	{"weapon9",150},
	{"weapon8",80},
	{"weapon15",150},
	{"weapon18",150},
	{"weapon21",150},
	{"weapon23",75},
	{"weapon25",150},
	{"weapon20",150},
	{"weapon19",150},
};

local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 3,
	[46] = 3, [43] = 3, [39] = 3
};

local boxSpace = dxGetFontHeight(1, "default-bold") + dxGetFontHeight(1, "default-bold") * 0.3;
local sW,sH = guiGetScreenSize();
local playerTarget = false;
local statsText = {};
local theTexts = {};
local theTextTimer = {};
local pingFails = 0;
local night = false;
local red = false;
local bpml = 0;
local blip = 12;
local sx,sy = sW, sH;
local worldW,worldH = 3072, 3072;
local rt = dxCreateRenderTarget(290, 175);
local xFactor,yFactor = (sx/1366), (sy/768);

local bloodsplash = guiCreateStaticImage(0,0,1,1,"images/bloodsplash.png",true)
guiSetEnabled(bloodsplash,false)
guiSetVisible(bloodsplash,false)

bindKey("x", "down", "chatbox", "globalchat");
bindKey("u", "down", "chatbox", "radiochat");

addEvent("onClientPlayerDeathInfo", true);
addEvent("checkVehicleInWaterClient", true);
addEvent("displayClientInfo", true);
addEvent("playPedSound", true);
addEvent("showJQCtext", true);
addEvent("playSoundForClient",true);

bindKey("n", "down", function()
	if (night == false) then
		if (getElementData(localPlayer, "toolbelt7") > 0) then
			setCameraGoggleEffect("nightvision");
			playSound("sounds/goggles.wav");
		end
		night = true;
	elseif (night == true) then
		setCameraGoggleEffect("normal");
		setFarClipDistance(500);
		night = false;
	end
end);

bindKey("i", "down", function()
	if (red == false) then
		if (getElementData(localPlayer, "toolbelt6") > 0) then
			setCameraGoggleEffect("thermalvision");
			playSound("sounds/goggles.wav");
			red = true;
		end
	elseif (red == true) then
		setCameraGoggleEffect("normal");
		setFarClipDistance(500);
		red = false;
	end
end);

local mT = 1;
setTimer(function()
	for i,v in ipairs(messagesTable) do
		if (mT == i) then
			startRollMessage(v, 230, 180, 50);
		elseif (mT > #messagesTable) then
			startRollMessage(messagesTable[1], 230, 180, 50);
			mT = 1;
		end
	end
	mT = mT+1;
end, 1*60000, 0);

function findRotation(x1, y1, x2, y2)
	local t = -math.deg(math.atan2(x2-x1, y2-y1));
	if (t < 0) then t = t + 360 end;
	return t;
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90-angle);
	local dx = math.cos(a)*dist;
	local dy = math.sin(a)*dist;
	return x+dx, y+dy;
end

function math.percent(procent, number, limit)
	if not limit then limit = 100; end
	if (procent and number) then
		return (procent/limit)*number;
	end
	return false;
end

function isInBuilding(x, y, z)
	local hit,_,_,_,_,_,_,_,_ = processLineOfSight(x, y, z, x, y, (z+10), true, false, false, true, false, false, false, false, nil);
	if hit then
		return true;
	end
	return false;
end

function isObjectAroundPlayer(thePlayer, distance, height)
	local x,y,z = getElementPosition(thePlayer);
	for i = math.random(360), 360, 1 do
		local nx,ny = getPointFromDistanceRotation(x, y, distance, i);
		local _,hitX,hitY,hitZ,_,_,_,_,material = processLineOfSight(x, y, (z+height), nx, ny, (z+height));
		if (material == 0) then
			return 0, nx, ny, z;
		end
	end
	return false, false, false, false;
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90-angle);
	return (x+(math.cos(a)*dist)), (y+(math.sin(a)*dist));
end

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if not isElementInWater(localPlayer) then
			if ((getElementData(localPlayer, "spawnedzombies") + 1) <= configVar.maxzombies) then
				local x,y,z = getElementPosition(localPlayer);
				local material,hX,hY,hz = isObjectAroundPlayer(localPlayer, 30, 3);
				if (material == 0 and not isInBuilding(hX, hY, hz)) then
					local gp = getGroundPosition(hX, hY, hz);
					triggerServerEvent("createZomieForPlayer", localPlayer, hX, hY, gp+1);
				end
			end
		end
	end
end, 5000, 0);

addEventHandler("playPedSound", root, function(ped, soundPath, x, y, z)
	if (ped and soundPath and x and y and z) then
		setPedVoice(ped, "PED_TYPE_DISABLED");
		playSound3D(soundPath, x, y, z, false);
	end
end);

addEventHandler("showJQCtext", root, function(player,sType,r,g,b,oN,nN)
	if (player and getLanguageTextClient(sType)) then
		if (sType == "changenicktext") then
			outputChatBox("* "..oN.." "..getLanguageTextClient(sType).." "..nN, r, g, b);
			return;
		end
		outputChatBox("* "..getPlayerName(player):gsub("#%x%x%x%x%x%x", "").." "..getLanguageTextClient(sType), r, g, b);
	end
end);

function math.round(number, decimals, method)
	local decimals = decimals or 0;
	local factor = 10^decimals;
	if (method == "ceil" or method == "floor") then 
		return math[method](number*factor)/factor;
	else 
		return tonumber(("%."..decimals.."f"):format(number));
	end
end

function startRollMessage(text, r, g, b, login, lll)
	if (login == 1) then
		local player = text;
		text = player.." "..getLanguageTextClient("logintext");
	elseif (login == 2) then
		local player = text;
		text = player.." "..getLanguageTextClient("waskilledtext2");
	elseif (login == 3) then
		local player = text;
		text = player.." "..getLanguageTextClient("waskilledtext1").." "..lll;
	end
	if (#theTexts == 5) then
		table.remove(theTexts, 1);
	end
	table.insert(theTexts, {text, r, g, b});
	if isTimer(theTextTimer["destroy"]) then killTimer(theTextTimer["destroy"]); end
	theTextTimer["destroy"] = setTimer(function() table.remove(theTexts, 1); end, 10000, 4);
end
addEventHandler("displayClientInfo", localPlayer, startRollMessage);


function getWeaponDamage(player, weapon)
	local slot = getSlotFromWeapon(weapon);
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_1")) then
				return v[2];
			end
		end
	elseif (slot == 1 or slot == 2 or slot == 4) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_2")) then
				if (getElementData(player, "humanity") == 5000) then
					if (v[1] == "weapon21" or v[1] == "weapon23" or v[1] == "weapon25" or v[1] == "weapon20" or v[1] == "weapon18") then
						return v[2]*1.3;
					end
				end
				if (getElementData(player, "humanity") <= 0) then
					if (v[1] == "weapon21" or v[1] == "weapon23" or v[1] == "weapon25" or v[1] == "weapon20" or v[1] == "weapon18") then
						return v[2]*0.7;
					end
				end
				return v[2];
			end
		end
	else
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_3")) then
				return v[2];
			end
		end
	end
end

function getWeaponVehicleDamage(player, weapon)
	local slot = getSlotFromWeapon(weapon);
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_1")) then
				return v[6];
			end
		end
	elseif (slot == 1 or slot == 2 or slot == 4) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_2")) then
				return v[6];
			end
		end
	else
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == getElementData(player, "currentweapon_3")) then
				return v[6];
			end
		end
	end
end

function getWeaponDamageFromName(weapon)
	if (weapon) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == weapon) then
				return v[2];
			end
		end
	end
end

function getWeaponVehicleDamageFromName(weapon)
	if (weapon) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == weapon) then
				return v[6];
			end
		end
	end
end

function getWeaponFireRateFromName(weapon)
	if (weapon) then
		for _,v in pairs(weaponPropertyTable) do
			if (v[1] == weapon) then
				return v[4];
			end
		end
	end
end

function fireRateToText(rate)
	if (rate == "") then return getLanguageTextClient("inventorydescription56"); end
	if (rate <= 150) then
		return getLanguageTextClient("inventorydescription55");
	elseif (rate <= 250) then
		return getLanguageTextClient("inventorydescription56");
	elseif (rate <= 500) then
		return getLanguageTextClient("inventorydescription57");
	elseif (rate <= 1000) then
		return getLanguageTextClient("inventorydescription58");
	elseif (rate > 1000) then
		return getLanguageTextClient("inventorydescription59");
	end
end

local eatsound;
local drinksound;
local repairsound;

addEventHandler("playSoundForClient", root, function(stype,x,y,z,deletetime)
	if (stype == "c4") then
		local sound = playSound3D("sounds/beep.mp3",x,y,z,false);
		setSoundMinDistance(sound,15);
		setTimer(function()
			local sound = playSound3D("sounds/beep.mp3",x,y,z,false);
			setSoundMaxDistance(sound,150);
		end,1000,4);
	elseif (stype == "fireplace") then
		local sound = playSound3D("sounds/fireplace.mp3",x,y,z,true);
		setSoundMinDistance(sound,5);
		setSoundMaxDistance(sound,30);
		setTimer(stopSound, deletetime, 1, sound);
	elseif (stype == "friendly") then
		local sound = playSound3D("sounds/friendly.ogg",x,y,z,false);
		attachElements(sound,source);
		setSoundMinDistance(sound,5);
		setSoundMaxDistance(sound,50);
	elseif (stype == "equip1") then
		playSound("sounds/equip1.wav",false);
	elseif (stype == "equip2") then
		playSound("sounds/equip2.wav",false);
	elseif (stype == "equip3") then
		playSound("sounds/equip3.mp3",false);
	elseif (stype == "death") then
		playSound("sounds/death.mp3",false);
	elseif (stype == "eatstart") then
		eatsound = playSound("sounds/eat.ogg",false);
	elseif (stype == "eatstop") then
		if (not eatsound) then return; end
		stopSound(eatsound);
		eatsound = nil;
	elseif (stype == "drinkstart") then
		drinksound = playSound("sounds/drink.ogg",false);
	elseif (stype == "drinkstop") then
		if (not drinksound) then return; end
		stopSound(drinksound);
		drinksound = nil;
	elseif (stype == "repairstart") then
		repairsound = playSound("sounds/repair.mp3",true);
	elseif (stype == "repairstop") then
		if (not repairsound) then return; end
		stopSound(repairsound);
		repairsound = nil;
	end
end);

addEventHandler("onClientPlayerDamage", localPlayer, function(attacker, weapon, bodypart, loss)
	cancelEvent();
	local occupiedvehicle = getPedOccupiedVehicle(localPlayer);
	if occupiedvehicle and getElementModel(occupiedvehicle) == 528 then return; end
	showPlayerDamageScreen(0,"up");
	local headshot = false;
	if (weapon == 37) then
		return;
	end
	if (weapon == 53) then
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-15);
		return;
	end
	if (attacker and getElementType(attacker) == "ped") then
		setElementData(localPlayer, "blood", (getElementData(localPlayer, "blood")-math.random(400, 900)));
		local number = math.random(1, 7);
		if (number == 4) then
			setElementData(localPlayer, "bleeding", getElementData(localPlayer, "bleeding")+math.floor(loss*10));
		end
	end
	if (weapon == 16) then
		local aX,aY,aZ = getElementPosition(attacker);
		local tX,tY,tZ = getElementPosition(localPlayer);
		if isLineOfSightClear(aX,aY,aZ,tX,tY,tZ,true,false,false,true) then
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(20000*0.8, 20000*1.2));
		end
	elseif (weapon == 49) then
		if (loss > 30) then
			local x,y,z = getElementPosition(localPlayer);
			playSound3D("sounds/breakbone.mp3", x, y, z);
			setElementData(localPlayer, "brokenbone", true);
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-math.floor(loss*10));
		end
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-math.floor(loss*5));
	elseif (weapon == 63 or weapon == 51 or weapon == 19) then
		if (getElementData(localPlayer, "blood") > 0) then
			local aX,aY,aZ = getElementPosition(attacker);
			local tX,tY,tZ = getElementPosition(localPlayer);
			if isLineOfSightClear(aX,aY,aZ,tX,tY,tZ,true,false,false,true) then
				triggerServerEvent("kilLDayZPlayer", localPlayer, attacker, headshot);
			end
		end
	elseif (weapon and weapon > 1 and weapon < 40 and attacker and getElementType(attacker) == "player") then
		local number = math.random(1, 8);
		if (number >= 6 or number <= 8) then
			setElementData(localPlayer, "bleeding", getElementData(localPlayer, "bleeding") + math.floor(loss*10));
		end
		local number2 = math.random(1, 7);
		if (number2 == 2) then
			setElementData(localPlayer, "pain", true);
		end
		local damage = getWeaponDamage(attacker, weapon);
		local helmet = getElementData(localPlayer,"helmet");
		local vest = getElementData(localPlayer,"vest");
		if (bodypart == 9) then
			if (helmet ~= "" and helmet ~= "helmet6" and helmet ~= "helmet7") then
				damage = damage/helmetDamageReduction[helmet];
			else
				setElementData(localPlayer, "blood", -9000);
			end
			headshot = true;
		end
		if (bodypart == 3) then
			if (vest ~= "") then
				damage = damage/vestDamageReduction[vest];
			end
		end
		if (bodypart == 7 or bodypart == 8) then
			damage = damage/2;
			setElementData(localPlayer, "brokenbone", true);
			local x,y,z = getElementPosition(localPlayer);
			playSound3D("sounds/breakbone.mp3", x, y, z);
		end
		if (bodypart == 5 or bodypart == 6) then
			damage = damage/2;
		end
		if not isElementInWater(localPlayer) then
			playSound("sounds/hit"..math.random(1, 3)..".mp3");
		end
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(damage*0.8, damage*1.2));
		--[[if (getElementData(localPlayer, "humanity") >= 1) then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") - math.random(40, 200));
		elseif (getElementData(localPlayer, "humanity") <= 0 and getElementData(attacker, "humanity") >= 1) then
			setElementData(attacker, "humanity", getElementData(attacker, "humanity") + math.random(40, 200));
			if (getElementData(attacker,"humanity") > 5000) then
				setElementData(attacker, "humanity", 5000);
			end
		end]]--
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				triggerServerEvent("kilLDayZPlayer", localPlayer, attacker, headshot, getWeaponNameFromID(weapon));
				setElementData(localPlayer, "isDead", true);
			end
		end
	elseif (weapon == 54 or weapon == 49) then
		setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - math.random(100, 1000));
		local number = math.random(1, 5);
		if (loss > 30) then
			setElementData(localPlayer, "brokenbone", true);
			local x,y,z = getElementPosition(localPlayer);
			playSound3D("sounds/breakbone.mp3", x, y, z);
		end
		if (loss >= 100) then
			setElementData(localPlayer, "blood", 49);
			setElementData(localPlayer, "bleeding", 50);
		end
		local number = math.random(1, 11);
		if (number == 3) then
			setElementData(localPlayer, "pain", true);
		end
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				triggerServerEvent("kilLDayZPlayer", localPlayer, attacker, headshot, getWeaponNameFromID(weapon));
				setElementData(localPlayer, "isDead", true);
			end
		end
	end
end);

addEventHandler("onClientPedDamage", root, function(attacker, weapon, bodypart, loss)
	cancelEvent();
	if (attacker and attacker == localPlayer or attacker and getElementType(attacker) == "vehicle") then
		if getElementData(source, "zombie") then
			if (weapon == 37) then return; end
			if getElementType(attacker) == "vehicle" then
				sx,sy,sz = getElementVelocity(attacker);
				actualspeed = (sx^2 + sy^2 + sz^2)^(0.5);
				kmh = actualspeed*180;
				if kmh >= 20 then
					local vehkiller = getVehicleOccupant(attacker);
					triggerServerEvent("onZombieGetsKilled",source,vehkiller)
				end
			elseif (weapon == 63 or weapon == 51 or weapon == 19) then
				local aX,aY,aZ = getElementPosition(attacker);
				local tX,tY,tZ = getElementPosition(source);
				if isLineOfSightClear(tX,tY,tZ,aX,aY,aZ,true,false,false,true) then
					triggerServerEvent("onZombieGetsKilled", source, attacker, false);
				end
			elseif (weapon and weapon >= 2 and attacker and getElementType(attacker) == "player") then
				if (weapon == 33 and bodypart == 3 or weapon == 33 and bodypart == 9) then
					if (bodypart == 9) then
						triggerServerEvent("onZombieGetsKilled", source, attacker, true, weapon);
						return;
					elseif (bodypart == 3) then
						triggerServerEvent("onZombieGetsKilled", source, attacker, false, weapon);
						return;	
					end
				end
				if (bodypart == 9) then
					setPedHeadless(source, true);
					triggerServerEvent("onZombieGetsKilled", source, attacker, true, weapon);
					return;
				end
				local damage = getWeaponDamage(attacker, weapon);
				if (weapon == 16) then
					local aX,aY,aZ = getElementPosition(attacker);
					local tX,tY,tZ = getElementPosition(source);
					if isLineOfSightClear(aX,aY,aZ,tX,tY,tZ,true,false,false,true) then
						setElementData(source, "blood", getElementData(source, "blood")-math.random(damage*0.75, damage*1.25));
					end
				else
					setElementData(source, "blood", getElementData(source, "blood")-math.random(damage*0.75, damage*1.25));
				end
				if (getElementData(source, "blood") <= 0) then
					triggerServerEvent("onZombieGetsKilled", source, attacker, false, weapon);
				end
			end
		elseif getElementData(source, "animal") then
			triggerServerEvent("createDeadAnimal", source);
		end
	end
end);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if (getElementData(localPlayer, "bleeding") > 20) then
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood")-getElementData(localPlayer, "bleeding"));
		else
			setElementData(localPlayer, "bleeding", 0);
		end
		if getElementData(localPlayer, "brokenbone") then
			toggleControl("jump", false);
			toggleControl("sprint", false);
		else
			toggleControl("jump", true);
			toggleControl("sprint", true);
		end
		if getElementData(localPlayer, "pain") then
			local x,y,z = getElementPosition(localPlayer);
			createExplosion(x, y, (z+15), 8, false, 1.5, false);
		end
		local temp = math.round(getElementData(localPlayer, "temperature"), 2);
		if (temp <= 36) then
			setElementData(localPlayer, "cold", true);
			bpml = bpml + 3;
		elseif (temp >= 37) then
			bpml = 0;
			if (getElementData(localPlayer, "cold") == true) then
				setElementData(localPlayer, "cold", false);
			end
			if (temp >= 39) then
				bpml = bpml + 3;
			end
		end
		if getElementData(localPlayer, "cold") then
			local x,y,z = getElementPosition(localPlayer);
			createExplosion(x, y, (z+15), 8, false, 0.5, false);
		end
		if (getElementData(localPlayer, "blood") <= 0) then
			if not getElementData(localPlayer, "isDead") then
				triggerServerEvent("kilLDayZPlayer", localPlayer, false, false);
			end
		end
		if (getElementData(localPlayer, "blood") > 12000) then
			setElementData(localPlayer, "blood", 12000);
		end
	end
end, 3000, 0);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		local x,y,z = getElementPosition(localPlayer);
		for _,v in ipairs(getElementsByType("player")) do
			local bleeding = getElementData(v, "bleeding") or 0;
			if (bleeding > 0) then
				local px,py,pz = getPedBonePosition(v, 3);
				local pdistance = getDistanceBetweenPoints3D(x, y, z, px, py, pz);
				if (bleeding > 600) then number = 5;
				elseif (bleeding > 300) then number = 3;
				elseif (bleeding > 100) then number = 1;
				else number = 0; end
				if (pdistance <= 120) then
					fxAddBlood(px, py, pz, 0, 0, 0, number, 1);
				end
			end
		end
	end
end, 300, 0);


setTimer(function()
	local volume = 0;
	local visibly = 0;
	if (getPedMoveState(localPlayer) == "stand") then
		volume = 1; 
		visibly = 3;
	elseif (getPedMoveState(localPlayer) == "walk") then
		volume = 2;
		visibly = 3;
	elseif (getPedMoveState(localPlayer) == "powerwalk") then
		volume = 3;
		visibly = 4;
	elseif (getPedMoveState(localPlayer) == "jog") then
		volume = 3;
		visibly = 4;
	elseif (getPedMoveState(localPlayer) == "sprint") then
		volume = 4;
		visibly = 4;
	elseif (getPedMoveState(localPlayer) == "crouch") then
		volume = 1;
		visibly = 2;
	elseif (getPedMoveState(localPlayer) == "crawl") then
		volume = 2;
		visibly = 2;
	elseif (getPedMoveState(localPlayer) == "climb") then
		volume = 3;
		visibly = 5;
	else
		volume = 2;
		visibly = 2;
	end
	local shooting = getElementData(localPlayer, "shooting");
	if (shooting and shooting > 0) then
		volume = 5;
	end
	if isPedInVehicle(localPlayer) then
		local pveh = getPedOccupiedVehicle(localPlayer);
		if (pveh and getVehicleEngineState(pveh) == true) then
			local sx,sy,sz = getElementVelocity(pveh);
			local kmh = ((sx^2 + sy^2 + sz^2)^(0.5)) * 180;
			if (kmh > 0) then
				volume = 5;
				visibly = 5;
			else
				volume = 3;
				visibly = 2;
			end
		else
			volume = 0;
			visibly = 2;
		end
	end
	if isObjectAroundPlayer(localPlayer, 2, 4) then visibly = 0; end
	if getElementData(localPlayer, "jumping") then visibly = 5; end
	if (volume > 5) then volume = 5; end
	if (visibly > 5) then visibly = 5; end
	setElementData(localPlayer, "volume", volume);
	setElementData(localPlayer, "visibly", visibly);
	if getPedControlState("jump") then
		setElementData(localPlayer, "jumping", true);
		setTimer(setElementData, 650, 1, localPlayer, "jumping", false);
	end
	if getPedControlState("fire") then
		local weapon = getPedWeapon(localPlayer);
		local primary = getElementData(localPlayer,"currentweapon_1");
		local secondary = getElementData(localPlayer,"currentweapon_2");
		local noise = 0;
		if (weapon == getWeaponIDFromDayZName(primary)) then
			noise = getWeaponNoise(primary);
			setElementData(localPlayer, "shooting", noise);
			if isTimer(shootTimer) then killTimer(shootTimer); end
			shootTimer = setTimer(setElementData, 99, 1, localPlayer, "shooting", 0);
		elseif (weapon == getWeaponIDFromDayZName(secondary)) then
			noise = getWeaponNoise(secondary);
			setElementData(localPlayer, "shooting", noise);
			if isTimer(shootTimer) then killTimer(shootTimer); end
			shootTimer = setTimer(setElementData, 99, 1, localPlayer, "shooting", 0);
		end
	end
end, 100, 0);

function getWeaponNoise(weapon)
	for _,v in ipairs(weaponNoiseTable) do
		if (weapon == v[1]) then return v[2]; end
	end
	return 0;
end

function getWeaponNoiseName(weapon)
	local noise = getWeaponNoise(weapon);
	if noise == 0 then
		return "-";
	elseif noise <= 100 then
		return getLanguageTextClient("inventorydescription64");
	elseif noise <= 150 then
		return getLanguageTextClient("inventorydescription63");
	elseif noise <= 300 then
		return getLanguageTextClient("inventorydescription62");
	end
end

-- Player Damage Screen
function showPlayerDamageScreen(visibly2,stateControle2)
    guiSetVisible(bloodsplash,true)
    visibly = visibly2 or visibly
    stateControle = stateControle2 or stateControle
    if visibly >= 6*0.1 and stateControle == "up" then
        stateControle = "down"
    end
    if visibly < 0 then
        guiSetVisible(bloodsplash,false)
        return
    end
    if stateControle == "up" then
        visibly = visibly + 0.1
    elseif stateControle == "down" then
        visibly = visibly - 0.1
    end
    guiSetAlpha(bloodsplash,visibly)
    setTimer(showPlayerDamageScreen,50,1)
end

--[[
addEventHandler("onClientPreRender",root,function()
	if (getElementData(localPlayer,"logedin")) then
		-- stop heli rotor if engine is off
		for _,v in pairs(getElementsByType("vehicle")) do
			local vehicle = v;
			local vehicleid = getElementModel(vehicle);
			if (vehicleid == 487 or vehicleid == 497) then
				if getVehicleEngineState(vehicle) == false then
					setHelicopterRotorSpeed(vehicle,0);
				end
			end
		end
	end
end);
]]

-- FPS and PING
local counter = 0 
local starttick 
local fps =0 

-- vehicle sounds
local vehsounds = {
	{487,"heli.mp3"},
	{497,"heli.mp3"},
	{528,"armoredtruck.mp3"},
	{470,"hmmwv.mp3"},
	{422,"pickuptruck.mp3"},
	{468,"motorcycle.mp3"},
	{433,"uralmilitary.mp3"},
	{473,"pbx.mp3"},
	{471,"atv.mp3"},
	{463,"motorbike.mp3"},
	{490,"suv.mp3"},
	{531,"tractor.mp3"},
	{579,"uaz.mp3"},
	{421,"golfiw211.mp3"},
	{456,"modernvan.mp3"},
};

addEventHandler("onClientRender",root,function()
	if (getElementData(localPlayer,"logedin")) then
		if (getElementData(localPlayer,"setting.fps")) then
		    if not starttick then 
	            starttick = getTickCount() 
	        end 
	        counter = counter+1 
	        if getTickCount() - starttick >= 1000 then 
	            fps = counter 
	            starttick,counter = false,0 
	        end
		    local text = fps.." FPS | "..getPlayerPing(localPlayer).." PING";
		    dxDrawText(text, (sW*0.98)-dxGetTextWidth(text),0,0,0,tocolor(255,255,255,180));
		end
		-- vehicle custom sounds :D
		for _,v in pairs(getElementsByType("vehicle")) do
			local vehicle = v;
			local vehicleid = getElementModel(vehicle);
			local vehiclestate = getVehicleEngineState(vehicle)
			if (vehicleid ~= 509) then
				for _,v in pairs(vehsounds) do
					if (v[1] == vehicleid) then
						local soundpath = "sounds/vehicles/"..v[2];
						local elements = getAttachedElements(vehicle);
						for i,e in ipairs(elements) do
							if (getElementType(e) == "sound") then
								if (vehicleid == 487 or vehicleid == 497) then
									local rtr_spd = getHelicopterRotorSpeed(vehicle)*4.5;
									setSoundSpeed(e,rtr_spd);
									setSoundMaxDistance(e,300);
									if (rtr_spd == 0) then
										setSoundPaused(e,true);
									else
										setSoundPaused(e,false);
									end
								else
									local vx, vy, vz = getElementVelocity(vehicle);
									local mph = ((vx^2 + vy^2 + vz^2)^(0.5)) * 180;
									local soundenginespeed = (mph+20)/50;
									if soundenginespeed > 2 then soundenginespeed = 2 end
									setSoundSpeed(e,soundenginespeed);
									if (not vehiclestate) then
										setSoundPaused(e,true);
									else
										setSoundPaused(e,false);
									end
								end
								if getElementData(vehicle,"isExploded") then
									destroyElement(e);
								end
							elseif not getElementData(vehicle,"soundexists") then
								local x,y,z = getElementPosition(vehicle);
								local sound = playSound3D(soundpath,x,y,z,true);
								setSoundMinDistance(sound,10);
								setSoundMaxDistance(sound,150);
								attachElements(sound,vehicle);
								setElementData(vehicle,"soundexists",true,false);
							end
						end
					end
				end
			end
		end
	end
end);

addEventHandler("onClientRender", root, function()
	if getElementData(localPlayer, "logedin") then
		if (getCameraGoggleEffect() ~= "normal") then
			dxDrawImage(0, 0, sW, sH, "images/crosshair/goggles.png", 0, 0, 0, tocolor(255, 255, 255, 255), false);
		end
		if (not exports.e_map:isPlayerMapVisible()) then
		if (getElementData(localPlayer,"setting.debugmonitor")) then
			statsText[1] = getLanguageTextClient("statname1")..": "..getElementData(localPlayer, "zombieskilled");
			statsText[2] = getLanguageTextClient("statname2")..": "..getElementData(localPlayer, "headshots");
			statsText[3] = getLanguageTextClient("statname3")..": "..getElementData(localPlayer, "murders");
			statsText[4] = getLanguageTextClient("statname4")..": "..getElementData(localPlayer, "banditskilled");
			statsText[5] = getLanguageTextClient("statname5")..": "..getElementData(localPlayer, "blood");
			statsText[6] = getLanguageTextClient("statname6")..": "..math.round(getElementData(localPlayer, "temperature"), 2).."°C";
			statsText[7] = getLanguageTextClient("statname7")..": "..math.round(getElementData(localPlayer, "humanity"), 2);
			local tH = dxGetFontHeight(1,"default")*0.85;
			dxDrawDayzWindow(sW-220, (sH-265)/3.5, 210, 110, dxServerTheme, false);
			for i,v in ipairs(statsText) do
				dxDrawText(v,sW-220/2-(dxGetTextWidth(v,1,"default")/2), (sH-265)/3.5+i*tH-2.5, 210, 110, tocolor(255,255,255,200),1,"default");
			end
		end
		dxDrawImage(sW*0.96, sH*0.47, 50, 50, "images/dayzicons/indicators/sound.png", 0, 0, 0, dxServerTheme2);
		local sound = getElementData(localPlayer, "volume");
		if (sound > 1) then
			dxDrawImage(sW*0.935, sH*0.47, 50, 50, "images/dayzicons/indicators/"..sound..".png", 0, 0, 0, dxServerTheme2);
		end
		dxDrawImage(sW*0.959, sH*0.53, 50, 50, "images/dayzicons/indicators/eye.png", 0, 0, 0, dxServerTheme2);
		local visibly = getElementData(localPlayer, "visibly");
		if (visibly > 1) then
			dxDrawImage(sW*0.935, sH*0.53, 50, 50, "images/dayzicons/indicators/"..visibly..".png", 0, 0, 0, dxServerTheme2);
		end
		if getElementData(localPlayer, "brokenbone") then
			dxDrawImage(sW*0.959, sH*0.62, 50, 50, "images/dayzicons/other/7.png", 0, 0, 0, tocolor(255, 255, 255, 180));
		end
		local t_number = 0;
		local h_number = 0;
		local th_number = 0;
		local f_number = 0;
		local b_number = 0;
		local humanity = math.round(getElementData(localPlayer, "humanity"), 1);
		if (humanity >= 5000) then
			r5,g5,b5 = 65, 160, 70;
			h_number = 5000;
		elseif (humanity >= 3500 and humanity < 5000) then
			r5,g5,b5 = 65, 160, 70;
			h_number = 3500;
		elseif (humanity >= 2500 and humanity < 3500) then
			r5,g5,b5 = 65, 160, 70;
			h_number = 2500;
		elseif (humanity >= 0 and humanity < 2500) then
			r5,g5,b5 = 65, 160, 70;
			h_number = 0;
		elseif (humanity <= -1000 and humanity < 0) then
			r5,g5,b5 = 65, 160, 70;
			h_number = -1000;
		elseif (humanity < -1000) then
			r5,g5,b5 = 65, 160, 70;
			h_number = -2500;
		end
		dxDrawImage(sW*0.959, sH*0.68, 50, 50, "images/dayzicons/bandit/"..h_number..".png", 0, 0, 0, tocolor(r5,g5,b5,180));
		dxDrawImage(sW*0.959, sH*0.68, 50, 50, "images/dayzicons/bandit/hat.png", 0, 0, 0, tocolor(255,255,255,180));
		local temp = math.round(getElementData(localPlayer, "temperature"), 1);
		if (temp > 37.5) then
			r5,g5,b5 = 100, 150, 130;
			t_number = 38;
		elseif (temp >= 37 and temp <= 37.5) then
			r5,g5,b5 = 100, 150, 130;
			t_number = 37;
		elseif (temp >= 36 and temp < 37) then
			r5,g5,b5 = 100, 150, 130;
			t_number = 36;
		elseif (temp >= 35 and temp < 36) then
			r5,g5,b5 = 100, 150, 130;
			t_number = 35;
		elseif (temp <= 34) then
			r5,g5,b5 = 100, 150, 130;
			t_number = 34;
		end
		dxDrawImage(sW*0.96, sH*0.74, 50, 50, "images/dayzicons/temperature/frame.png", 0, 0, 0, dxServerTheme2);
		dxDrawImage(sW*0.96, sH*0.74, 50, 50, "images/dayzicons/temperature/38.png", 0, 0, 0, tocolor(0,0,0,20));
		dxDrawImage(sW*0.96, sH*0.74, 50, 50, "images/dayzicons/temperature/"..t_number..".png", 0, 0, 0, tocolor(r5,g5,b5,180));
		local thirst = getElementData(localPlayer, "thirst");
		if (thirst > 80) then
			r5,g5,b5 = 150, 185, 100;
			th_number = 100;
		elseif (thirst <= 80 and thirst > 50) then
			r5,g5,b5 = 150, 185, 100;
			th_number = 80;
		elseif (thirst <= 60 and thirst > 40) then
			r5,g5,b5 = 150, 185, 100;
			th_number = 60;
		elseif (thirst <= 40 and thirst > 15) then
			r5,g5,b5 = 150, 185, 100;
			th_number = 40;
		elseif (thirst <= 15) then
			r5,g5,b5 = 150, 185, 100;
			th_number = 15;
		end
		dxDrawImage(sW*0.96, sH*0.80, 50, 50, "images/dayzicons/drink/frame.png", 0, 0, 0, dxServerTheme2);
		dxDrawImage(sW*0.96, sH*0.80, 50, 50, "images/dayzicons/drink/100.png", 0, 0, 0, tocolor(0,0,0,20));
		dxDrawImage(sW*0.96, sH*0.80, 50, 50, "images/dayzicons/drink/"..th_number..".png", 0, 0, 0, tocolor(r5,g5,b5, 180));
		local blood = getElementData(localPlayer, "blood");
		if (blood > 10000) then
			r5,g5,b5 = 100, 200, 110;
			b_number = 100;
		elseif (blood <= 10000 and blood > 8000) then
			r5,g5,b5 = 100, 200, 110;
			b_number = 80;
		elseif (blood <= 8000 and blood > 6000) then
			r5,g5,b5 = 100, 200, 110;
			b_number = 50;
		elseif (blood <= 6000 and blood > 4000) then
			r5,g5,b5 = 100, 200, 110;
			b_number = 30;
		elseif (blood <= 4000) then
			r5,g5,b5 = 100, 200, 110;
			b_number = 10;
		end
		dxDrawImage(sW*0.96, sH*0.86, 50, 50, "images/dayzicons/blood/frame.png", 0, 0, 0, dxServerTheme2);
		dxDrawImage(sW*0.96, sH*0.86, 50, 50, "images/dayzicons/blood/100.png", 0, 0, 0, tocolor(0,0,0,20));
		dxDrawImage(sW*0.96, sH*0.86, 50, 50, "images/dayzicons/blood/"..b_number..".png", 0, 0, 0, tocolor(r5,g5,b5, 180));
		if (getElementData(localPlayer, "bleeding") > 0) then
			dxDrawImage(sW*0.96, sH*0.86, 50, 50, "images/dayzicons/other/5.png", 0, 0, 0, tocolor(255, 255, 255, 180));
		end
		local food = getElementData(localPlayer, "food");
		if (food > 80) then
			r5,g5,b5 = 130, 200, 100;
			f_number = 100;
		elseif (food <= 80 and food > 50) then
			r5,g5,b5 = 130, 200, 100;
			f_number = 80;
		elseif (food <= 60 and food > 40) then
			r5,g5,b5 = 130, 200, 100;
			f_number = 60;
		elseif (food <= 40 and food > 15) then
			r5,g5,b5 = 130, 200, 100;
			f_number = 40;
		elseif (food <= 15) then
			r5,g5,b5 = 130, 200, 100;
			f_number = 15;
		end
		dxDrawImage(sW*0.96, sH*0.92, 50, 50, "images/dayzicons/eat/frame.png", 0, 0, 0, dxServerTheme2);
		dxDrawImage(sW*0.96, sH*0.92, 50, 50, "images/dayzicons/eat/100.png", 0, 0, 0, tocolor(0,0,0,20));
		dxDrawImage(sW*0.96, sH*0.92, 50, 50, "images/dayzicons/eat/"..f_number..".png", 0, 0, 0, tocolor(r5,g5,b5, 180));
		local veh = getPedOccupiedVehicle(localPlayer);
		if (veh and getElementModel(veh) ~= 509) then --[[If it's not a bike]]
			local col = getElementData(veh, "parent");
			local maxfuel = tonumber(getElementData(veh, "maxfuel")) or 0;
			local fuel = math.floor(tonumber(getElementData(col, "fuel"))) or 0;
			local needengine = tonumber(getElementData(veh, "needengines")) or 0;
			local needtires = tonumber(getElementData(veh, "needtires")) or 0;
			local needparts = tonumber(getElementData(veh, "needparts")) or 0;
			local needscrap = tonumber(getElementData(veh, "needscrap")) or 0;
			local needrotor = tonumber(getElementData(veh, "needrotor")) or 0;
			local engine = tonumber(getElementData(col, "Engine_inVehicle")) or 0;
			local tires = tonumber(getElementData(col, "Tire_inVehicle")) or 0;
			local parts = tonumber(getElementData(col, "Parts_inVehicle")) or 0;
			local scrap = tonumber(getElementData(col, "Scrap_inVehicle")) or 0;
			local rotor = tonumber(getElementData(col, "Rotor_inVehicle")) or 0;

			local percentfuel = math.floor((fuel/maxfuel)*130);

			local sx,sy,sz = getElementVelocity(veh);
			local kmh = ((sx^2 + sy^2 + sz^2)^(0.5)) * 180;

			dxDrawImage(sW*0.013,sH*0.25,18,18,"images/fuel.png",0,0,0,tocolor(50, 150, 50,255),false);
			dxDrawRectangle(sW*0.013+2,sH*0.25+22,12.9,132,tocolor(0,0,0,150),false);
			dxDrawRectangle(sW*0.013+3,sH*0.25+22+1,11,130,tocolor(150, 50, 50,100),false);
			dxDrawRectangle(sW*0.013+3,sH*0.25+22+1+130,11,-percentfuel,tocolor(50, 150, 50,255),false);

			dxDrawText(vehicle_name[getElementModel(veh)],sW*0.013+3+20+1,sH*0.25+5+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(vehicle_name[getElementModel(veh)],sW*0.013+3+20,sH*0.25+5,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")

			dxDrawText(getLanguageTextClient("vehiclehudtext1").." "..engine.."/"..needengine,sW*0.013+3+20+1,sH*0.25+25+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext1").." "..engine.."/"..needengine,sW*0.013+3+20,sH*0.25+25,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext2").." "..rotor.."/"..needrotor,sW*0.013+3+20+1,sH*0.25+37+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext2").." "..rotor.."/"..needrotor,sW*0.013+3+20,sH*0.25+37,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext3").." "..tires.."/"..needtires,sW*0.013+3+20+1,sH*0.25+49+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext3").." "..tires.."/"..needtires,sW*0.013+3+20,sH*0.25+49,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext4").." "..parts.."/"..needparts,sW*0.013+3+20+1,sH*0.25+61+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext4").." "..parts.."/"..needparts,sW*0.013+3+20,sH*0.25+61,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext5").." "..scrap.."/"..needscrap,sW*0.013+3+20+1,sH*0.25+73+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(getLanguageTextClient("vehiclehudtext5").." "..scrap.."/"..needscrap,sW*0.013+3+20,sH*0.25+73,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")

			dxDrawImage(sW*0.013+3+15,sH*0.25+112,18,18,"images/hp.png",0,0,0,tocolor(50, 150, 50,255),false);
			dxDrawText(math.floor((getElementHealth(veh)/10)).."%",sW*0.013+3+35+1,sH*0.25+115+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(math.floor((getElementHealth(veh)/10)).."%",sW*0.013+3+35,sH*0.25+115,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")

			dxDrawImage(sW*0.013+3+15,sH*0.25+132,32,18,"images/speed.png",0,0,0,tocolor(50, 150, 50,255),false);
			dxDrawText(math.floor(kmh).." km/h",sW*0.013+3+35+14+1,sH*0.25+135+1,0,0,tocolor(0,0,0),0.75,"default-bold","left","top")
			dxDrawText(math.floor(kmh).." km/h",sW*0.013+3+35+14,sH*0.25+135,0,0,tocolor(255,255,255),0.75,"default-bold","left","top")

			--[[
			local offset = dxGetFontHeight(1.02, "default-bold");
			local w = dxGetTextWidth(engine.."/"..needengine.." "..getLanguageTextClient("vehiclehudtext1"), 1.02, "default-bold");
			if (engine == needengine) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
			dxDrawText(engine.."/"..needengine.." "..getLanguageTextClient("vehiclehudtext1"), sW*0.5-w/2, sH*0, sW*0.5-w/2, sH*0, tocolor(r, g, b, 255), 1.02, "default-bold");
			local w = dxGetTextWidth(rotor.."/"..needrotor.." "..getLanguageTextClient("vehiclehudtext2"), 1.02, "default-bold");
			if (rotor == needrotor) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
			dxDrawText(rotor.."/"..needrotor.." "..getLanguageTextClient("vehiclehudtext2"), sW*0.5-w/2, sH*0+offset, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1.02, "default-bold");
			local w = dxGetTextWidth(tires.."/"..needtires.." "..getLanguageTextClient("vehiclehudtext3"), 1.02, "default-bold");
			if (tires == needtires) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
			dxDrawText(tires.."/"..needtires.." "..getLanguageTextClient("vehiclehudtext3"), sW*0.5-w/2, sH*0+offset*2, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1.02, "default-bold");
			local w = dxGetTextWidth(parts.."/"..needparts.." "..getLanguageTextClient("vehiclehudtext4"), 1.02, "default-bold");
			if (parts == needparts) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
			dxDrawText(parts.."/"..needparts.." "..getLanguageTextClient("vehiclehudtext4"), sW*0.5-w/2, sH*0+offset*3, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1.02, "default-bold");
			local w = dxGetTextWidth(scrap.."/"..needscrap.." "..getLanguageTextClient("vehiclehudtext5"), 1.02, "default-bold");
			if (scrap == needscrap) then r,g,b = 0, 255, 0; else r,g,b = 255, 0, 0; end
			dxDrawText(scrap.."/"..needscrap.." "..getLanguageTextClient("vehiclehudtext5"), sW*0.5-w/2, sH*0+offset*4, sW*0.5-w/2, sH*0+offset, tocolor(r, g, b, 255), 1.02, "default-bold");
			local w = dxGetTextWidth(getLanguageTextClient("vehiclehudtext6").." "..fuel.."/"..maxfuel, 1.02, "default-bold");
			local g = math.percent(math.percent(100, fuel, maxfuel), 255);
			dxDrawText(getLanguageTextClient("vehiclehudtext6").." "..fuel.."/"..maxfuel, sW*0.5-w/2, sH*0+offset*5, sW*0.5-w/2, sH*0+offset*2, tocolor(255-g, g, 0, 255), 1.02, "default-bold");
			]]--
		end
		for i,v in ipairs(theTexts) do
			dxDrawingColorText(getLanguageTextClient(v[1]) or v[1], (sW*0.3)+1, (sH-i*boxSpace)+1, (sW*0.9)+1, (sH-(i-1)*boxSpace)+1, tocolor(0, 0, 0, 255), 5170, 1, "default-bold", "right", "center");
			dxDrawingColorText(getLanguageTextClient(v[1]) or v[1], sW*0.3, sH-i*boxSpace, sW*0.9, sH-(i-1)*boxSpace, tocolor(v[2], v[3], v[4], 255), 5170, 1, "default-bold", "right", "center");
		end
		end
		local x,y,z = getElementPosition(localPlayer);
		for _,v in ipairs(getElementsByType("player")) do
			setPlayerNametagShowing(v, false);
			if (v ~= localPlayer) then
				local px,py,pz = getElementPosition(v);
				if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 3 or getPedTarget(localPlayer) == v) then
					local sx,sy = getScreenFromWorldPosition(px, py, pz+0.50, 0.06);
					if (sx and sy) then
						local tHumanity = getElementData(v,"humanity");
						local text = (getPlayerName(v):gsub("#%x%x%x%x%x%x", ""));
						local w = dxGetTextWidth(text, 1, "default-bold");
						if (getElementData(v,"gang") == getElementData(localPlayer,"gang")) then
							dxDrawImage(sx-50, sy-75, 100, 100, "images/tag.png");
						end
						dxDrawImage(sx-(w/2+22),sy-3,20,20,"images/network.png",0,0,0,getPlayerPingColor(getPlayerPing(v)))
						dxDrawText(text, sx-(w/2)+1, sy+1, sx-(w/2)+1, sy+1, tocolor(0, 0, 0, 255), 1, "default-bold");
						if (tHumanity <= 0) then
							dxDrawText(text, sx-(w/2), sy, sx-(w/2), sy, tocolor(150, 50, 50, 255), 1, "default-bold");
						elseif (tHumanity >= 1) then
							dxDrawText(text, sx-(w/2), sy, sx-(w/2), sy, tocolor(50, 150, 50, 255), 1, "default-bold");
						elseif (tHumanity >= 5000) then
							dxDrawText(text, sx-(w/2), sy, sx-(w/2), sy, tocolor(50, 50, 150, 255), 1, "default-bold");
						end
					end
				end
			end     
		end
		local weapon = getPedWeapon(localPlayer);
		if (weapon and getElementData(localPlayer,"setting.weaponhud")) then
			if (exports.e_map:isPlayerMapVisible()) then return end
			local clip = getPedAmmoInClip(localPlayer);
			local ammo = (getPedTotalAmmo(localPlayer)-clip);
			if (weaponslots[weapon]) then
				weaponname = getLanguageTextClient(getElementData(localPlayer, "currentweapon_"..weaponslots[weapon]));
			else
				weaponname = "";
			end
			local w = dxGetTextWidth(weaponname, 1.5, "default-bold");
			local badSlots = {[0]=1, [1]=1, [9]=1, [10]=1, [11]=1, [12]=1};
			dxDrawText(weaponname, (sW*0.97)-w+1, sH*0.060+1, sW*0.978+1, sH*0.59+1, tocolor(0, 0, 0, 255), 1.5, "default-bold", "right", "top", false, false, false, false, false)
			dxDrawText(weaponname, (sW*0.97)-w, sH*0.060, sW*0.978, sH*0.59, dxServerTheme5, 1.5, "default-bold", "right", "top", false, false, false, false, false)
			if (not badSlots[getPedWeaponSlot(localPlayer)]) then
				local w1 = dxGetTextWidth(clip, 1.5, "default-bold");
				local w2 = dxGetTextWidth(" | "..ammo, 1.25, "default-bold");
				dxDrawText(clip, (sW*0.97)-w1-w2+1, sH*0.082+1, sW*0.978-w2+1, sH*0.59+1, tocolor(0, 0, 0, 255), 1.5, "default-bold", "right", "top", false, false, false, false, false)
				dxDrawText(clip, (sW*0.97)-w1-w2, sH*0.082, sW*0.978-w2, sH*0.59, dxServerTheme5, 1.5, "default-bold", "right", "top", false, false, false, false, false)
				dxDrawText(" | "..ammo, (sW*0.97)-w2+1, sH*0.082+1, sW*0.978+1, sH*0.59+1, tocolor(0, 0, 0, 255), 1.25, "default-bold", "right", "top", false, false, false, false, false)
				dxDrawText(" | "..ammo, (sW*0.97)-w2, sH*0.082, sW*0.978, sH*0.59, dxServerTheme5, 1.25, "default-bold", "right", "top", false, false, false, false, false)
			end
			if (getElementData(localPlayer, "toolbelt3") >= 1) then
				local h,m = getTime();
				if (h < 10) then h = "0"..h; end
				if (m < 10) then m = "0"..m; end
				local w = dxGetTextWidth(h..":"..m, 0.14, "default-bold");
				dxDrawText(h..":"..m, (sW*0.97)-w+1, sH*0.11+1, sW*0.978+1, sH*0.59+1, tocolor(0, 0, 0, 255), 1.4, "default-bold", "right", "top", false, false, false, false, false)
				dxDrawText(h..":"..m, (sW*0.97)-w, sH*0.11, sW*0.978, sH*0.59, dxServerTheme5, 1.4, "default-bold", "right", "top", false, false, false, false, false)
			end
		end
		if (weapon == 43) then
			local task = getPedTask(localPlayer, "secondary", 0);
			local control = getPedControlState("aim_weapon");
			if ((task == "TASK_SIMPLE_USE_GUN") and control) then
				toggleControl("fire", false);
				toggleControl("action", false);
				dxDrawImage(0, 0, sW, sH, "images/crosshair/binoculars.png");
				--local camX, camY, camZ, targetX, targetY, targetZ = getCameraMatrix()
				--local waterFound, eX, eY, eZ = testLineAgainstWater(camX, camY, camZ, targetX, targetY, targetZ)
				--if (waterFound) then
				--	local distance = getDistanceBetweenPoints3D(camX, camY, camZ, eX, eY, eZ);
				--	local text = "DISTANCE: "..tostring(distance);
				--	local tWidth = dxGetTextWidth(text, 1.5, "default");
				--	local tHeight = dxGetFontHeight(1.5,"default");
				--	dxDrawText(text,sW*0.5-(tWidth/2)+1,sH*0.6+1,tWidth,tHeight,tocolor(0, 0, 0, 255),1.5,"default");
				--	dxDrawText(text,sW*0.5-(tWidth/2),sH*0.6,tWidth,tHeight,dxServerTheme5,1.5,"default");
				--end
			else
				toggleControl("fire", true);
				toggleControl("action", true);
			end
		elseif (weapon == 34) then
			local task = getPedTask(localPlayer, "secondary", 0);
			local control = getPedControlState("aim_weapon");
			if ((task == "TASK_SIMPLE_USE_GUN") and control) then
				for i = 1, 7 do
					if (i ~= 3) then
						local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
						if (tohide ~= "NONE") then
							setElementPosition(tohide,0,0,0);
							setElementAlpha(tohide, 0);
						end
					end
				end
				if (getElementData(localPlayer,"currentweapon_1") == "weapon1") then
					dxDrawImage(0, 0, sW, sH, "images/crosshair/3.png", 0, 0, 0, tocolor(255, 255, 255, 255), true);
				elseif (getElementData(localPlayer,"currentweapon_1") == "weapon4") then
					dxDrawImage(0, 0, sW, sH, "images/crosshair/2.png", 0, 0, 0, tocolor(255, 255, 255, 255), true);
				else
					dxDrawImage(0, 0, sW, sH, "images/crosshair/1.png", 0, 0, 0, tocolor(255, 255, 255, 255), true);
				end
			else
				for i = 1, 7 do
					if (i ~= 3) then
						local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
						if (tohide ~= "NONE") then
							setElementAlpha(tohide, 255);
						end
					end
				end
			end
		end
		local tH = dxGetFontHeight(1,"default");
		dxDrawText("Server: "..configVar.version,25,sH-tH-4,0,0,tocolor(255,255,255,127.5));
		-- newbie help text 
		if (getElementData(localPlayer,"showhelp")) then
			local margin = 15;
			local tWidth = dxGetTextWidth(getLongestStrings(helptext),1,"default")+(margin*2);
			local tHeight = dxGetFontHeight(1,"default");
			local helpX,helpY,helpW,helpH = sW*0.5-(tWidth/2),sH-(tHeight*countTableItems(helptext)+(margin*2)+100),tWidth,tHeight*countTableItems(helptext)+(margin*2);
			dxDrawDayzWindow(helpX,helpY,helpW,helpH,dxServerTheme,false);
			for i,v in pairs(helptext) do
				dxDrawText(getLanguageTextClient(v),helpX+margin,helpY+margin+tHeight*(i-1),helpW-margin,tHeight,tocolor(255,255,255));
			end
		end
	end
end);

function getPlayerPingColor(ping)
	if (ping) <= 120 then
		return tocolor(50,200,50,255);
	elseif (ping <= 250) then
		return tocolor(200,200,50,255);
	elseif (ping > 250) then
		return tocolor(200,50,50,255);
	end
end

function getLongestStrings(table)
    local longest
    for k, v in pairs(table) do
    	local text = getLanguageTextClient(v);
        if not longest or string.len(text) > string.len(longest) then
            longest = text;
        end
    end
    return longest
end

function countTableItems(table)
    local count = 0;
    for k, v in pairs(table) do
        count = count+1;
    end
    return count
end

--[[
bindKey("aim_weapon", "both", function(key, press)
	if (getPedWeapon(localPlayer) == 34) then
		if (press == "down") then
			for i = 1, 7 do
				if (i ~= 3) then
					local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
					if (tohide ~= "NONE") then
						setElementAlpha(tohide, 0);
					end
				end
			end
		elseif (press == "up") then
			for i = 1, 7 do
				if (i ~= 3) then
					local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
					if (tohide ~= "NONE") then
						setElementAlpha(tohide, 255);
					end
				end
			end
		end
	end
end);

addEventHandler("onClientVehicleStartExit", root, function()
	if (getElementModel(source) ~= 509) then
		if (getElementModel(source) ~= 468) then
			for i = 2, 4 do
				local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
				if (tohide ~= "NONE") then
					setElementAlpha(tohide, 255);
				end
			end
		end
	end
end);

addEventHandler("onClientVehicleEnter", root, function()
	if (getElementModel(source) ~= 509) then
		if (getElementModel(source) ~= 468) then
			for i = 2, 4 do
				local tohide = getElementData(localPlayer, "tohide"..tostring(i)) or "NONE";
				if (tohide ~= "NONE") then
					setElementAlpha(tohide, 0);
				end
			end
		end
	end
	setRadioChannel(0);
end);
]]--

addEventHandler("onClientPlayerTarget", root, function(target)
	if (target and getElementType(target) == "player") then
		playerTarget = target;
	else
		playerTarget = false;
	end
end);

addEventHandler("onClientKey", root, function(button,press)
	if getElementData(localPlayer,"repairingvehicle") and press then
		triggerServerEvent("cancelVehicleRepair",localPlayer);
	end
end)

addEventHandler("onClientPlayerDeathInfo", root, function()
	fadeCamera(false, 1.0, 0, 0, 0);
	setTimer(fadeCamera, 1000, 1, true, 1.5);
	local deadBackground = guiCreateStaticImage(0, 0, 1, 1, "images/black.png", true);
	local deathText = guiCreateLabel(0, 0.5, 1, 0.2, getLanguageTextClient("deathtext1").." "..configVar.respawntime.." "..getLanguageTextClient("deathtext2"), true);
	guiSetProperty(deathText,"AlwaysOnTop","True");
	local time = configVar.respawntime;
	setTimer(function()
		if (time > 1) then
			time = time-1;
			guiSetText(deathText,getLanguageTextClient("deathtext1").." "..time.." "..getLanguageTextClient("deathtext2"));
		else
			guiSetText(deathText,getLanguageTextClient("deathtext3"));
		end
	end,1000,configVar.respawntime);
	guiLabelSetHorizontalAlign(deathText, "center");
	setTimer(destroyElement, (configVar.respawntime*1000+1000), 1, deathText);
	setTimer(destroyElement, (configVar.respawntime*1000+1250), 1, deadBackground);
end);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		setElementData(localPlayer, "alivetime", getElementData(localPlayer, "alivetime") + 1);
		setElementData(localPlayer, "stats.playtime", getElementData(localPlayer, "stats.playtime") + 1);
		if (bpml > 0) then
			setElementData(localPlayer, "blood", getElementData(localPlayer, "blood") - bpml);
			if (getElementData(localPlayer,"cold")) then
				startRollMessage("clientinfotext8", 160, 40, 40);
			else
				startRollMessage("clientinfotext29", 160, 40, 40);
			end
		end
	end 
end, 60000, 0);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if getElementData(localPlayer, "pain") then
			startRollMessage("clientinfotext9", 160, 40, 40);
		end
		if (getElementData(localPlayer, "food") < 30) then
			startRollMessage("clientinfotext10", 160, 40, 40);
		end
	end
end, 60000, 0);

setTimer(function()
	if getElementData(localPlayer, "logedin") then
		if (getElementData(localPlayer, "thirst") < 30) then
			startRollMessage("clientinfotext11", 160, 40, 40);
		end
		if (getElementData(localPlayer, "bleeding") > 0) then
			startRollMessage("clientinfotext12", 160, 40, 40);
		end
	end
end, 60000, 0);

setTimer(function()
	if (getPlayerPing(localPlayer) > 450) then
		pingFails = pingFails + 1;
		if (pingFails == 3) then
			triggerServerEvent("kickPlayerOnHighPing", localPlayer);
			return;
		end
		startRollMessage("pingfailtext", 160, 40, 40);
		if isTimer(pingTimer) then return; end
		pingTimer = setTimer(function() pingFails = 0; end, 30000, 1);
	end
end, 4000, 0);

setTimer(function()
	playSound("sounds/ambience/dayz"..tostring(math.random(3))..".mp3",false);
end, 30*60000, 0);