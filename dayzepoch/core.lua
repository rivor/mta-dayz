local weaponAmmoTable = {
	["Weapons"] ={
		{"mag1", "weapon21", 23, 1879},
		{"mag1", "weapon23", 23, 1878},
		{"mag1", "weapon25", 23, 1877}, -- pistol 
		{"mag2", "weapon19", 24, 348}, -- revolver
		{"mag3", "weapon20", 29, 1882},
		{"mag3", "weapon18", 29, 1881}, -- submachine
		{"mag4", "weapon9", 31, 1839},
		{"mag4", "weapon10", 31, 1834},
		{"mag4", "weapon6", 31, 1835},
		{"mag4", "weapon14", 31, 1838}, -- aks
		{"mag5", "weapon11", 31, 1830}, -- m4a1
		{"mag6", "weapon12", 30, 1880},
		{"mag6", "weapon13", 30, 1833}, -- heavy
		{"mag7", "weapon7", 25, 349},
		{"mag7", "weapon15", 27, 351}, -- winchesters
		{"mag10", "weapon2", 34, 1869},
		{"mag8", "weapon3", 34, 1872},
		{"mag8", "weapon5", 34, 1874},
		{"mag10", "weapon1", 34, 1875},
		{"mag8", "weapon4", 34, 1876}, -- snipers
		{"mag9", "weapon8", 33, 357} -- crossbow
	},
	["others"] = {
		{"weapon16", 16, 342},
		{"weapon24", 4, 335},
		{"weapon22", 8, 339},
		{"weapon28", 43, 367},
		{"weapon26", 5, 336},
		{"weapon27", 6, 337},
		{"weapon17", 2, 333}
	}
};

function getWeaponAmmoType(name)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (name == v[2]) then return v[1], v[3], v[4]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (name == v[1]) then return v[1], v[2], v[3]; end
	end
	return false, false, false;
end

local skinTable = {
	{"clothing2", 287},
	{"clothing3", 179},
	{"clothing1", 285},
	{"clothing4", 73},
	{"clothing5", 72},
	{"clothing6", 71},
	{"clothing7", 66},
	{"clothing8", 27},
	{"clothing9", 29}
};

local animalsSpawns = {
	{-1350.775390625, -1070.8291015625, 160.71176147461},
	{-1369.1123046875, -1094.70703125, 163.45556640625},
	{-1431.8876953125, -1093.189453125, 162.88122558594},
	{-1456.1787109375, -1064.6630859375, 168.23822021484},
	{-1483.6357421875, -1024.376953125, 170.4222869873},
	{-1468.3408203125, -988.3291015625, 192.51156616211},
	{-1431.3173828125, -934.0478515625, 201.39248657227},
	{-1577.904296875, -1020.0693359375, 143.08142089844},
	{-1587.375, -1018.236328125, 141.72036743164},
	{-1590.380859375, -1040.8505859375, 134.61396789551},
	{-1581.958984375, -1072.4111328125, 133.2043762207},
	{-1584.595703125, -1106.2001953125, 138.63221740723},
	{-1550.591796875, -1137.1181640625, 136.79585266113},
	{-1498.1083984375, -1180.9814453125, 125.67600250244},
	{-1428.4541015625, -1225.892578125, 106.43696594238},
	{-411.271484375, -1338.080078125, 25.689184188843},
	{-373.59375, -1307.2568359375, 26.628273010254},
	{-372.1689453125, -1751.75, 31.759468078613},
	{-393.7333984375, -1195.427734375, 60.393005371094},
	{-417.9150390625, -1180.4599609375, 63.334930419922},
	{-433.0888671875, -1156.3349609375, 61.920516967773},
	{-336.744140625, -1267.5693359375, 23.735641479492},
	{-303.19140625, -1275.9599609375, 10.24838924408},
	{-233.025390625, -1235.2373046875, 6.5470447540283},
	{-193.0166015625, -1232.7568359375, 10.130974769592},
	{-176.25, -1223.6298828125, 8.0039596557617},
	{-166.5498046875, -1286.111328125, 3.5691347122192},
	{-969.5048828125, -1738.703125, 77.557479858398},
	{-966.748046875, -1776.2470703125, 80.165809631348},
	{-976.7177734375, -1808.9462890625, 90.694877624512},
	{-978.0849609375, -1827.4521484375, 93.413543701172},
	{-986.23046875, -1855.9130859375, 85.224227905273},
	{-1095.68359375, -1869.5302734375, 86.347923278809},
	{-1168.853515625, -1864.869140625, 79.263336181641},
	{-1221.1416015625, -1859.6591796875, 76.356552124023},
	{-650.044921875, -2077.580078125, 28.14298248291},
	{-632.34765625, -2062.50390625, 32.527751922607},
	{-537.833984375, -1992.03515625, 47.49878692627},
	{-498.4375, -1957.61328125, 38.346961975098}
};

local weatherTable = {
	[1] = 5,
	[2] = 8,
	[3] = 7,
	[4] = 10
};

local backpackSlots = {
	["NTS"] = {
		["backpack4"] = 12,
		["backpack3"] = 16,
		["backpack2"] = 24,
		["backpack1"] = 36,
		["backpack5"] = 48,
		["backpack6"] = 63,
		["backpack7"] = 72,
	},
	["STN"] = {
		[12] = "backpack4",
		[16] = "backpack3",
		[24] = "backpack2",
		[36] = "backpack1",
		[48] = "backpack5",
		[63] = "backpack6",
		[72] = "backpack7",
	}
};

local elementBackpack = {};
local elementHelmet = {};
local elementVest = {};
local elementWeaponBack = {};
local elementWeaponBack2 = {};
local elementWeaponRaplace = {};
local elementWeaponRaplace2 = {};
local handsUp = false;
local siting = false;
local lying = false;

addEvent("relWep", true);
addEvent("createDeadAnimal", true);
addEvent("onPlayerBuryBody", true);
addEvent("onPlayerRearmWeapon", true);
addEvent("removeBackWeaponOnDrop", true);
addEvent("kilLDayZPlayer", true);
addEvent("onPlayerRequestChangingStats", true);
addEvent("onPlayerUseMedicObject", true);
addEvent("onPlayerGiveMedicObject", true);
addEvent("onPlayerChangeSkin", true);
addEvent("onPlayerRefillWaterBottle", true);
addEvent("onPlayerPitchATent", true);
addEvent("onPlayerBuildASafe", true);
addEvent("onPlayerPlaceC4", true);
addEvent("onPlayerCallAirdrop", true);
addEvent("onPlayerEnterSafeCode", true);
addEvent("onPlayerChangeSafeCode", true);
addEvent("onPlayerBuildAWireFence", true);
addEvent("removeWirefence", true);
addEvent("addPlayerCookMeat", true);
addEvent("removeTent" ,true);
addEvent("removeSafe" ,true);
addEvent("removeMine" ,true);
addEvent("onPlayerMakeAFire", true);
addEvent("onPlayerPlaceRoadflare", true);
addEvent("onPlayerPlaceMine", true);
addEvent("kickPlayerOnHighPing", true);
addEvent("onPlayerEquipBackpack", true);
addEvent("onPlayerEquipHelmet", true);
addEvent("onPlayerEquipVest", true);
addEvent("onPlayerUnequipWeapon", true);
addEvent("onCreateWeaponSound", true);
addEvent("setPlayerUseAnimation", true);

addEventHandler("onResourceStart", resourceRoot, function()
	setGameType(configVar.version);
	local realTime = getRealTime();
	setTime(realTime.hour, realTime.minute);
	setFarClipDistance(500);
	setFogDistance(-25);
	setGameSpeed(1.1);
	setFPSLimit(61);
	setTrafficLightState("disabled");
	setMinuteDuration(60000*getGameSpeed());
	setTimer(setTrafficLightState, 10000, 0, "disabled");
	setWeaponProperty(30, "pro", "maximum_clip_ammo", 100);
	setWeaponProperty(30, "std", "maximum_clip_ammo", 100);
	setWeaponProperty(30, "poor", "maximum_clip_ammo", 100);
	setWeaponProperty(30, "pro", "flags", 0x000200);
	setWeaponProperty(30, "std", "flags", 0x000200);
	setWeaponProperty(30, "poor", "flags", 0x000200);
	setWeaponProperty(31, "pro", "maximum_clip_ammo", 30);
	setWeaponProperty(31, "std", "maximum_clip_ammo", 30);
	setWeaponProperty(31, "poor", "maximum_clip_ammo", 30);
	setWeaponProperty(29, "pro", "maximum_clip_ammo", 20);
	setWeaponProperty(29, "std", "maximum_clip_ammo", 20);
	setWeaponProperty(29, "poor", "maximum_clip_ammo", 20);
	setWeaponProperty(23, "pro", "weapon_range", 100);
	setWeaponProperty(23, "std", "weapon_range", 100);
	setWeaponProperty(23, "poor", "weapon_range", 100);
	setWeaponProperty(23, "pro", "maximum_clip_ammo", 15);
	setWeaponProperty(23, "std", "maximum_clip_ammo", 15);
	setWeaponProperty(23, "poor", "maximum_clip_ammo", 15);
end);

addEventHandler("onCreateWeaponSound", root, function(soundname,noise,x,y,z)
	triggerClientEvent(root,"onClientCreateWeaponSound",source,soundname,noise,x,y,z);
end);

function getBackpackNameFromSlots(slots)
	if (slots > 8) then
		return backpackSlots["STN"][slots];
	end
	return "None";
end

function getBackpackSlotsFromName(name)
	if name then
		return backpackSlots["NTS"][name];
	end
	return false;
end

function removeBackpack(source)
	if elementBackpack[source] then
		detachElementFromBone(elementBackpack[source]);
		destroyElement(elementBackpack[source]);
		elementBackpack[source] = false;
		setElementData(source, "tohide2", "NONE");
	end
end

function removeHelmet(source)
	if elementHelmet[source] then
		detachElementFromBone(elementHelmet[source]);
		destroyElement(elementHelmet[source]);
		elementHelmet[source] = false;
		setElementData(source, "tohide6", "NONE");
	end
end

function removeVest(source)
	if elementVest[source] then
		detachElementFromBone(elementVest[source]);
		destroyElement(elementVest[source]);
		elementVest[source] = false;
		setElementData(source, "tohide7", "NONE");
	end
end

function removeWeaponBack(source)
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source]);
		destroyElement(elementWeaponBack[source]);
		elementWeaponBack[source] = false;
		setElementData(source, "tohide3", "NONE");
	end
end

function removeWeaponBack2(source)
	if elementWeaponBack2[source] then
		detachElementFromBone(elementWeaponBack2[source]);
		destroyElement(elementWeaponBack2[source]);
		elementWeaponBack2[source] = false;
		setElementData(source, "tohide4", "NONE");
	end
end

function removeWeaponReplace(source)
	if elementWeaponRaplace[source] then
		detachElementFromBone(elementWeaponRaplace[source]);
		destroyElement(elementWeaponRaplace[source]);
		elementWeaponRaplace[source] = false;
		setElementData(source, "tohide1", "NONE");
	end
end

function removeWeaponReplace2(source)
	if elementWeaponRaplace2[source] then
		detachElementFromBone(elementWeaponRaplace2[source]);
		destroyElement(elementWeaponRaplace2[source]);
		elementWeaponRaplace2[source] = false;
		setElementData(source, "tohide5", "NONE");
	end
end

addEventHandler("onPlayerEquipBackpack", root, function(backpack,currSlots)
	local nSlots = getBackpackSlotsFromName(backpack);
	local oSlots = getElementData(source, "MAX_Slots");
	if (currSlots <= nSlots) then
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		setTimer(function(source, backpack)
			setElementData(source, "MAX_Slots", nSlots);
			setElementData(source, backpack, getElementData(source, backpack) - 1);
			if not (oSlots == 8) then
				local oName = getBackpackNameFromSlots(oSlots);
				setElementData(source, oName, getElementData(source, oName) + 1);
			end
			triggerClientEvent(source, "refreshInventoryManual", source);
		end,2000,1, source, backpack);
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			setElementData(source,"isInAction",false);
		end, 3000, 1, source);
	else
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext0",source)..(currSlots-nSlots)..getLanguageTextServer("clientinfotext1",source), 160, 40, 40);
	end
end);

addEventHandler("onPlayerEquipHelmet", root, function(helmet)
	local currHelmet = getElementData(source, "helmet");
	if (helmet ~= currHelmet) then
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		setTimer(function(source, helmet)
			setElementData(source, "helmet", helmet);
			setElementData(source, helmet, getElementData(source, helmet) - 1);
			if currHelmet ~= "" then
				setElementData(source, currHelmet, getElementData(source, currHelmet) + 1);
			end
			triggerClientEvent(source, "refreshInventoryManual", source);
		end,2000,1, source, helmet);
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			setElementData(source,"isInAction",false);
		end, 3000, 1, source);
	else
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext45",source), 160, 40, 40);
	end
end);

addEventHandler("onPlayerEquipVest", root, function(vest)
	local currVest = getElementData(source, "vest");
	if (vest ~= currVest) then
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		setTimer(function(source, vest)
			setElementData(source, "vest", vest);
			setElementData(source, vest, getElementData(source, vest) - 1);
			if currVest ~= "" then
				setElementData(source, currVest, getElementData(source, currVest) + 1);
			end
			triggerClientEvent(source, "refreshInventoryManual", source);
		end,2000,1, source, vest);
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			setElementData(source,"isInAction",false);
		end, 3000, 1, source);
	else
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext45",source), 160, 40, 40);
	end
end);

addEventHandler("onPlayerUnequipWeapon", root, function(eweapon, slot)
	setTimer(function(source, eweapon, slot)
		local weap = getElementData(source, "currentweapon_"..tostring(slot));
		local name,id,model = getWeaponAmmoType(weap);
		takeWeapon(source, id);
		if (slot < 3) then
			setElementData(source, "currentweapon_"..tostring(slot), "");
			if (slot == 1) then
				removeWeaponBack(source);
				removeWeaponReplace(source);
			else
				removeWeaponBack2(source);
				removeWeaponReplace2(source);
			end
		else
			setElementData(source, "currentweapon_"..tostring(slot), "");
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	end,175,1, source, eweapon, slot);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 350, 1, source);
end);

addEventHandler("onPlayerRearmWeapon", root, function(weapon, slot)
	setTimer(function(source, weapon, slot)
		takeAllWeapons(source);
		local wAmmo,id,_ = getWeaponAmmoType(weapon);
		local ammos = wAmmo;
		if (id ~= 8 or id ~= 5 or id ~= 6 or id ~= 2) then
			ammos = 1;
		end
		if (getElementData(source,wAmmo) < 1) then
			triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext2",source), 160, 40, 40);
		end
		if (slot < 3 and ammos < 1) then
			triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext2",source), 160, 40, 40);
		else
			local old = getElementData(source, "currentweapon_"..tostring(slot));
			if (weapon == old) then
				equipThem(source, slot);
				return;
			end
			if (slot < 3) then
				setElementData(source, "currentweapon_"..tostring(slot), weapon);
				triggerClientEvent(source,"playSoundForClient",source,"equip"..tostring(slot));
			else
				if (old ~= "") then
					local oldq = getElementData(source, old);
					if (oldq > 0) then
						setElementData(source, old, oldq);
					end
				end
				setElementData(source, "currentweapon_"..tostring(slot), weapon);
				triggerClientEvent(source,"playSoundForClient",source,"equip"..tostring(slot));
			end
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
		equipThem(source, slot);
	end,175,1, source, weapon, slot);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 350, 1, source);
end);

function equipThem(player, slot)
	removeWeaponBack(player);
	removeWeaponBack2(player);
	removeWeaponReplace(player);
	removeWeaponReplace2(player);
	for i = 1, 3 do
		local weapon = getElementData(player, "currentweapon_"..tostring(i));
		if (weapon ~= "") then
			if (i == slot) then bool = true; else bool = false; end
			local ammo,id,_ = getWeaponAmmoType(weapon);
			if (i == 3) then
				giveWeapon(player, id, getElementData(player, weapon), bool);
			else
				if (id == 8) then
					giveWeapon(player, id, 1, bool);
				else
					local wam = getElementData(player, ammo);
					giveWeapon(player, id, wam, bool);
					setWeaponAmmo(player, id, wam);
				end
			end
		end
	end
	if (slot == 1) then
		local weap2 = getElementData(player, "currentweapon_2");
		if (weap2 ~= "") then
			local _,id,model2 = getWeaponAmmoType(weap2);
			if model2 then
				attachWeaponBack2(player, model2, id);
			end
		end
	elseif (slot == 2) then
		local weap1 = getElementData(player, "currentweapon_1");
		if (weap1 ~= "") then
			local _,_,model1 = getWeaponAmmoType(weap1);
			if model1 then
				attachWeaponBack(player, model1);
			end
		end
	else
		local weap1 = getElementData(player, "currentweapon_1");
		if (weap1 ~= "") then
			local _,_,model1 = getWeaponAmmoType(weap1);
			if model1 then
				attachWeaponBack(player, model1);
			end
		end
		local weap2 = getElementData(player, "currentweapon_2");
		if (weap2 ~= "") then
			local _,id,model2 = getWeaponAmmoType(weap2);
			if model2 then
				attachWeaponBack2(player, model2, id);
			end
		end
		if (slot == 0) then
			setPedWeaponSlot(player, 0);
		end
	end
end

function attachWeaponReplace(source, model)
	removeWeaponReplace(source);
	local x,y,z = getElementPosition(source);
	if (model > 1000) then
		elementWeaponRaplace[source] = createObject(model, x, y, z);
		if elementWeaponRaplace[source] then
			setElementData(source, "tohide1", elementWeaponRaplace[source]);
		end
		if elementBackpack[source] then
			attachElementToBone(elementWeaponRaplace[source], source, 12, 0, 0, 0, 180, 90, 180);
		else
			attachElementToBone(elementWeaponRaplace[source], source, 12, 0, 0, 0, 180, 90, 180);
		end
	end
end

function attachWeaponReplace2(source, model)
	removeWeaponReplace2(source);
	local x,y,z = getElementPosition(source);
	if (model > 1000) then
		elementWeaponRaplace2[source] = createObject(model, x, y, z);
		if elementWeaponRaplace2[source] then
			setElementData(source, "tohide5", elementWeaponRaplace2[source]);
		end
		if elementBackpack[source] then
			attachElementToBone(elementWeaponRaplace2[source], source, 12, 0, 0, 0, 180, 90, 180);
		else
			attachElementToBone(elementWeaponRaplace2[source], source, 12, 0, 0, 0, 180, 90, 180);
		end
	end
end

function attachWeaponBack(source, model)
	removeWeaponBack(source);
	local x,y,z = getElementPosition(source);
	elementWeaponBack[source] = createObject(model, x, y, z);
	if elementWeaponBack[source] then
		setObjectScale(elementWeaponBack[source], 0.8);
		setElementData(source, "tohide3", elementWeaponBack[source]);
	end
	local bpValue = getElementData(source,"MAX_Slots");
	if (elementBackpack[source] and bpValue == 12) then
		attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.20, -0.1, 0, 270, -90);
	elseif (elementBackpack[source] and bpValue == 72) then
		attachElementToBone(elementWeaponBack[source], source, 3, 0.26, -0.20, -0.1, 0, 270, -90);
	elseif elementBackpack[source] then
		attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.31, -0.1, 0, 270, -90);
	else
		attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.11, -0.1, 0, 270, 10);
	end
end

function attachWeaponBack2(source, model, id)
	removeWeaponBack2(source);
	local x,y,z = getElementPosition(source);
	elementWeaponBack2[source] = createObject(model, x, y, z);
	if elementWeaponBack2[source] then
		setObjectScale(elementWeaponBack2[source], 1);
		if (id == 6) then
			setObjectScale(elementWeaponBack2[source], 0.7);
		elseif (id == 8) then
			setObjectScale(elementWeaponBack2[source], 0.8);
		end
		setElementData(source, "tohide4", elementWeaponBack2[source]);
	end
	local bpValue = getElementData(source,"MAX_Slots");
	if elementBackpack[source] then
		if (id == 8) then
			if (bpValue == 72) then
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.27, -0.12, 0.22, 180, 0, -90);
			else
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.12, 0.22, 180, 0, -90);
			end
		elseif (id == 2 or id == 4 or id == 6 or id == 5) then
			if (bpValue == 72) then
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.27, -0.18, -0.1, 0, 0, -90);
			else
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.18, -0.1, 0, 0, -90);
			end
		elseif (bpValue == 12) then
			attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.20, -0.1, 0, 270, -90);
		else
			if (bpValue == 72) then
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.27, -0.31, -0.1, 0, 270, -90);
			else
				attachElementToBone(elementWeaponBack2[source], source, 3, -0.18, -0.31, -0.1, 0, 270, -90);
			end
		end
	else
		if (id == 8) then
			attachElementToBone(elementWeaponBack2[source], source, 3, -0.07 -0.14, -0.1, -0.1, 0, -8);
		elseif (id == 2 or id == 4) then
			attachElementToBone(elementWeaponBack2[source], source, 3, -0.20, -0.11, -0.1, -0.1, 0, -11);
		elseif (id == 6 or id == 5) then
			attachElementToBone(elementWeaponBack2[source], source, 3, -0.15, -0.11, -0.1, -0.1, 0, 70);
		else
			attachElementToBone(elementWeaponBack2[source], source, 3, -0.22, -0.11, -0.1, -0.1, -270, -11);
		end
	end
end

addEventHandler("onPlayerWeaponSwitch", root, function(previousWeaponID, currentWeaponID)
	local weapon = getElementData(source, "currentweapon_1");
	local weapon2 = getElementData(source, "currentweapon_2");
	if not weapon then return; end
	local _,weapID,model = getWeaponAmmoType(weapon);
	if (currentWeaponID == weapID) then
		removeWeaponBack(source);
		attachWeaponReplace(source, model);
	elseif (previousWeaponID == weapID) then
		removeWeaponReplace(source);
		attachWeaponBack(source, model);
	end
	if not weapon2 then return; end
	local _,id2,model2 = getWeaponAmmoType(weapon2);
	if (previousWeaponID == id2) then
		removeWeaponReplace2(source);
		attachWeaponBack2(source, model2, id2);
	elseif (currentWeaponID == id2) then
		removeWeaponBack2(source);
		attachWeaponReplace2(source, model2);
	end
end);

addEventHandler("removeBackWeaponOnDrop", root, function(check, slot)
	if (slot == 1) then
		removeWeaponBack(source);
		removeWeaponReplace(source);
	elseif (slot == 2) then
		removeWeaponBack2(source);
		removeWeaponReplace2(source);
	end
	if check then
		local weapon = getElementData(source, "currentweapon_"..tostring(slot));
		local _,id,_ = getWeaponAmmoType(weapon);
		takeWeapon(source, id);
		if (slot == 3) then
			takeWeapon(client, id);
			local weapon = getElementData(client, "currentweapon_3");
			if weapon then
				setElementData(client, "currentweapon_3", "");
			end
		end
		setElementData(source, "currentweapon_"..tostring(slot), "");
		triggerClientEvent(source, "refreshInventoryManual", source);
	end
end);

addEventHandler("onPlayerQuit", root, function()
	removeBackpack(source);
	removeHelmet(source);
	removeVest(source);
	removeWeaponBack(source);
	removeWeaponReplace(source);
	removeWeaponBack2(source);
	removeWeaponReplace2(source);
end);

addEventHandler("kilLDayZPlayer", root, function()
	removeBackpack(source);
	removeHelmet(source);
	removeVest(source);
	removeWeaponBack(source);
	removeWeaponReplace(source);
	removeWeaponBack2(source);
	removeWeaponReplace2(source);
end);

addEventHandler("onElementDataChange", root, function(dataName, oldValue)
	if not oldValue then oldValue = 0; end
	if (getElementType(source) == "player") then
		if (dataName == "MAX_Slots") then
			local newValue = getElementData(source, dataName);
			removeBackpack(source);
			local x,y,z = getElementPosition(source);
			if (newValue == 12) then elementBackpack[source] = createObject(3026, x, y, z); -- Leather Sack
			elseif (newValue == 16) then elementBackpack[source] = createObject(1717, x, y, z); -- Hunting Backpack
			elseif (newValue == 24) then elementBackpack[source] = createObject(1575, x, y, z); -- Boulder Backpack
			elseif (newValue == 36) then elementBackpack[source] = createObject(1252, x, y, z); -- Coyote Backpack
			elseif (newValue == 48) then elementBackpack[source] = createObject(1719, x, y, z); -- Dry Bag
			elseif (newValue == 63) then elementBackpack[source] = createObject(1725, x, y, z); -- Tortilla Backpack
			elseif (newValue >= 72) then elementBackpack[source] = createObject(1736, x, y, z); -- Alice Backpack
			elseif (newValue == 8) then return; end
			if elementBackpack[source] then
				setElementData(source, "tohide2", elementBackpack[source]);
				if (newValue >= 36) then
					--setObjectScale(elementBackpack[source], 0.95);
				end
			end
			if (newValue == 12 or newValue == 16) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.15, 0.07, 0, 0, 0);
			elseif (newValue == 24) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.17, 0.03, 0, 0, 0);
				setObjectScale(elementBackpack[source],1.2)
			elseif (newValue == 36 or newValue == 48) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.13, 0.07, 0, 0, 0);
			elseif (newValue == 63) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.15, 0.01, 0, 0, 0);
				setObjectScale(elementBackpack[source],1.2)
			elseif (newValue >= 72) then
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.15, 0.05, 0, 0, 0);
				setObjectScale(elementBackpack[source],1.1)
			else
				attachElementToBone(elementBackpack[source], source, 3, 0, -0.18, 0.05, 90, 0, 0);
			end
		elseif (dataName == "helmet" or dataName == "vest" or dataName == "skin") then
			local helmet = getElementData(source, "helmet");
			local vest = getElementData(source, "vest");
			removeHelmet(source);
			removeVest(source);
			local x,y,z = getElementPosition(source);
			local model;
			if (dataName == "helmet" or dataName == "vest") then
				model = getElementModel(source);
			elseif (dataName == "skin") then
				model = getElementData(source,dataName);
			end
			if helmet == "helmet1" then elementHelmet[source] = createObject(1738, x, y, z); -- Helmet 1
			elseif helmet == "helmet2" then elementHelmet[source] = createObject(1745, x, y, z); -- Helmet 2
			elseif helmet == "helmet3" then elementHelmet[source] = createObject(1747, x, y, z); -- Helmet 3
			elseif helmet == "helmet4" then elementHelmet[source] = createObject(1748, x, y, z); -- Helmet 4
			elseif helmet == "helmet5" then elementHelmet[source] = createObject(1749, x, y, z); -- Helmet 5
			elseif helmet == "helmet6" then elementHelmet[source] = createObject(1750, x, y, z); -- Helmet 6
			elseif helmet == "helmet7" then elementHelmet[source] = createObject(1751, x, y, z); -- Helmet 7
			end
			if vest == "vest1" then elementVest[source] = createObject(2105, x, y, z); -- Vest 1
			elseif vest == "vest2" then elementVest[source] = createObject(2106, x, y, z); -- Vest 2
			end
			if elementHelmet[source] then
				setElementCollisionsEnabled(elementHelmet[source],false)
				setElementData(source, "tohide6", elementHelmet[source]);
				if (model == 179) then 								--left/right --middle --up/down
					attachElementToBone(elementHelmet[source], source, 1, -0.005, 0.04, 0.06, 0, 0, -180);
				elseif (model == 287) then
					attachElementToBone(elementHelmet[source], source, 1, -0.000, 0.02, 0.07, 0, 0, -180);
					setObjectScale(elementHelmet[source],1.1)
				elseif (model == 27) then
					attachElementToBone(elementHelmet[source], source, 1, -0.005, 0.03, 0.08, 0, 0, -180);
				elseif (model == 29 or model == 285) then
					attachElementToBone(elementHelmet[source], source, 1, -0.005, 0.05, 0.08, 0, 0, -180);
				elseif (model == 71 or model == 72 or model == 73 or model == 66) then
					attachElementToBone(elementHelmet[source], source, 1, -0.000, 0.065, 0.1, 0, 0, -180);
				end
			end
			if elementVest[source] then
				setElementCollisionsEnabled(elementVest[source],false)
				setElementData(source, "tohide7", elementVest[source]);
				if (model == 179 or model == 287) then--left/right --middle --up/down
					attachElementToBone(elementVest[source], source, 3, 0, 0.06, 0.03, 0, 0, -180);
					setObjectScale(elementVest[source],1.2)
				elseif (model == 71 or model == 72 or model == 73 or model == 285) then
					attachElementToBone(elementVest[source], source, 3, 0, 0.04, 0.05, 0.0, 0, -180);
					setObjectScale(elementVest[source],1.2)
				elseif (model == 27) then
					attachElementToBone(elementVest[source], source, 3, 0, 0.04, 0.05, 0.0, 0, -180);
					setObjectScale(elementVest[source],1.1)
				elseif (model == 29) then
					attachElementToBone(elementVest[source], source, 3, 0, 0.05, 0.05, 0.0, 0, -180);
					setObjectScale(elementVest[source],1.1,1.2)
				elseif (model == 66) then
					attachElementToBone(elementVest[source], source, 3, 0, 0.07, 0.08, 0.0, 0, -180);
					setObjectScale(elementVest[source],1.1,1.25)
				end
			end
		elseif (dataName == "toolbelt1") then
			--[[if (getElementData(source, "toolbelt1") >= 1) then
				toggleControl(source, "radar", true);
			else
				toggleControl(source, "radar", false);
			end]]
		elseif (dataName == "toolbelt2") then
			--[[if (getElementData(source, "toolbelt2") >= 1) then
				setPlayerHudComponentVisible(source, "radar", true);
			else
				setPlayerHudComponentVisible(source, "radar", false);
			end]]
		elseif (dataName == "loot") then
			if (not getElementData(source,"loot")) then
				triggerClientEvent(source,"hideInventoryManual2",source);
			end
		end
		local weapon1 = getElementData(source, "currentweapon_1");
		local weapon2 = getElementData(source, "currentweapon_2");
		local weapon3 = getElementData(source, "currentweapon_3");
		if (dataName == weapon1 or dataName == weapon2 or dataName == weapon3) then
			if (getElementData(source, dataName) == 0) then
				local ammoData,weapID = getWeaponAmmoType(dataName);
				takeWeapon(source, weapID);
			end
		end
		local ammoData1,weapID1 = getWeaponAmmoType(weapon1);
		if (dataName == ammoData1) then
			local newammo = (oldValue-getElementData(source, dataName));
			if (newammo == 1 and dataName ~= "mag9") then return; end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID1, newammo);
				removeWeaponBack(source);
			elseif (getElementData(source, dataName) > oldValue) then
				giveWeapon(source, weapID1, getElementData(source, dataName)-oldValue, false);
			end
		end
		local ammoData2,weapID2 = getWeaponAmmoType(weapon2);
		if (dataName == ammoData2) then
			local newammo = oldValue-getElementData(source, dataName);
			if (newammo == 1) then return; end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID2, newammo);
			elseif (getElementData(source,dataName) > oldValue) then
				giveWeapon(source, weapID2, getElementData(source, dataName)-oldValue, false);
			end
		end
		local ammoData3,weapID3 = getWeaponAmmoType(weapon3);
		if (dataName == ammoData3) then
			local newammo = oldValue-getElementData(source, dataName);
			if (newammo == 1) then return; end
			if (getElementData(source, dataName) < oldValue) then
				takeWeapon(source, weapID3, newammo);
			elseif (getElementData(source, dataName) > oldValue) then
				giveWeapon(source, weapID3, getElementData(source, dataName)-oldValue, false);
			end
		end
	end
end);

addEventHandler("onPlayerStealthKill", root, function(target)
	if (target and getElementType(target) == "player") then
		triggerEvent("kilLDayZPlayer", target, source, false, false);
	end
end);

function addPlayerStats(player, data, value)
	if (data == "food") then
		local current = getElementData(player, data);
		if (current + value > 100) then
			setElementData(player, data, 100);
		elseif (current + value < 1) then
			setElementData(player, data, 0);
			setElementData(player, "blood", (getElementData(player, "blood") - math.random(50, 120)));
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "thirst") then
		local current = getElementData(player, data);
		if (current + value > 100) then
			setElementData(player, data, 100);
		elseif (current + value < 1) then
			setElementData(player, data, 0);
			setElementData(player, "blood", (getElementData(player, "blood") - math.random(50, 120)));
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "blood") then
		local current = getElementData(player, data);
		if (current + value > 12000) then
			setElementData(player, data, 12000);
		elseif (current + value < 1) then
			setElementData(player, data, 0);
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "temperature") then
		local current = getElementData(player, data);
		if (current + value > 41) then
			setElementData(player, data, 41);
		elseif (current + value <= 31) then
			setElementData(player, data, 31);
		else
			setElementData(player, data, (current + value));
		end
	elseif (data == "humanity") then
		local current = getElementData(player, data);
		local new = current + value;
		if (new > 5000) then
			setElementData(player, data, 5000);
		else
			setElementData(player, data, new);
		end
	end
end

setTimer(function()
	for _,v in ipairs(getElementsByType("player")) do
		if getElementData(v, "logedin") then
			local value = 0;
			if isElementInWater(v) then
				value = -0.01;
			end
			if getControlState(v, "sprint") then
				value = (value + 0.005);
				addPlayerStats(v, "thirst", -0.2);
			end
			local weather = getWeather();
			if (weather == 5) then
				value = (value + 0.005);
			elseif (weather == 8) then
				value = (value - 0.05);
			elseif (weather == 7) then
				value = (value - 0.01);
			elseif (weather == 10) then
				value = (value + 0.05);
			end
			if (getElementData(v, "humanity") < 2500) then
				addPlayerStats(v, "humanity", 30);
			end
			addPlayerStats(v, "temperature", value);
			addPlayerStats(v, "food", -1.5);
			addPlayerStats(v, "thirst", -1.5);
		end 
	end
end, 60000, 0);

addEventHandler("onPlayerRequestChangingStats", root, function(itemName, itemInfo, data)
	if (data == "food") then
		if (itemName == "fooditem5") then blood = math.random(200, 300);
		elseif (itemName == "fooditem9") then blood = math.random(300, 350);
		elseif (itemName == "fooditem10") then blood = math.random(600, 800);
		elseif (itemName == "fooditem4") then blood = math.random(150, 250);
		elseif (itemName == "fooditem3") then blood = math.random(320, 400); end
		setPedAnimation(source, "FOOD", "EAT_Burger", -1, false, false, nil, false);
		setElementData(source, itemName, getElementData(source, itemName)-1);
		addPlayerStats(source, "blood", blood);
		addPlayerStats(source, data, math.random(60, 100));
		triggerClientEvent(source,"playSoundForClient",source,"eatstart");
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			triggerClientEvent(source,"playSoundForClient",source,"eatstop");
			setElementData(source,"isInAction",false);
		end, 5000, 1, source);
	elseif (data == "thirst") then
		setElementData(source, itemName, getElementData(source, itemName)-1);
		addPlayerStats(source, data, math.random(60, 100));
		setPedAnimation(source, "VENDING", "VEND_Drink2_P", -1, false, false, nil, false);
		if (itemName == "fooditem1") then
			setElementData(source, "fooditem2", getElementData(source, "fooditem2") + 1);
		end
		triggerClientEvent(source,"playSoundForClient",source,"drinkstart");
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			triggerClientEvent(source,"playSoundForClient",source,"drinkstop");
			setElementData(source,"isInAction",false);
		end, 3500, 1, source);
	end
	triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext3",source).." "..getLanguageTextServer(itemName,source), 40, 160, 40);
	triggerClientEvent(source, "refreshInventoryManual", source);
end);

addEventHandler("onPlayerUseMedicObject", root, function(itemName)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source)
		if (itemName == "medicine5") then
			setElementData(source, "bleeding", 0);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		elseif (itemName == "medicine1") then
			setElementData(source, "bleeding", 0);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			sleepFunction(function()
				sleep(2000)
				addPlayerStats(source, "blood", 289);
				sleep(4000)
				addPlayerStats(source, "blood", 1241);
				sleep(6500)
				addPlayerStats(source, "blood", 3221);
				sleep(9500)
				addPlayerStats(source, "blood", 3664);
			end);
		elseif (itemName == "medicine2") then
			setElementData(source, "bleeding", 0);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			sleepFunction(function()
				sleep(2000)
				addPlayerStats(source, "blood", 50);
				sleep(4000)
				addPlayerStats(source, "blood", 891);
				sleep(6000)
				addPlayerStats(source, "blood", 1982);
				sleep(8000)
				addPlayerStats(source, "blood", 2921);
			end);
		elseif (itemName == "medicine3") then
			setElementData(source, "bleeding", 0);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			sleepFunction(function()
				sleep(2000)
				addPlayerStats(source, "blood", 50);
				sleep(3000)
				addPlayerStats(source, "blood", 471);
				sleep(4000)
				addPlayerStats(source, "blood", 1291);
				sleep(5000)
				addPlayerStats(source, "blood", 1481);
			end);
		elseif (itemName == "medicine4") then
			setElementData(source, "cold", false);
			setElementData(source, "temperature", 37);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		elseif (itemName == "medicine6") then
			setElementData(source, "pain", false);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		elseif (itemName == "medicine8") then
			setElementData(source, "brokenbone", false)
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		elseif (itemName == "medicine7") then
			addPlayerStats(source, "blood", 12000);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 1500, 1, source);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerGiveMedicObject", root, function(itemName, player)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source)
		if (itemName == "givebandage") then
			setElementData(player, "bleeding", 0);
			setElementData(source, "medicine5", getElementData(source, "medicine5") - 1);
			addPlayerStats(source, "humanity", 40);
		elseif (itemName == "giveblood") then
			setElementData(source, "medicine7", getElementData(source, "medicine7") - 1);
			addPlayerStats(source, "humanity", 250);
			sleepFunction(function()
				sleep(2000)
				addPlayerStats(player, "blood", 2213);
				sleep(4000)
				addPlayerStats(player, "blood", 3562);
				sleep(6000)
				addPlayerStats(player, "blood", 4920);
			end);
		end
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 1500, 1, source);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

function getSkinIDFromName(name)
	for _,v in ipairs(skinTable) do
		if (name == v[1]) then return v[2]; end
	end
end

function getSkinNameFromID(id)
	for _,v in ipairs(skinTable) do
		if (id == v[2]) then return v[1]; end
	end
end

addEventHandler("setPlayerUseAnimation", root, function()
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
end);

addEventHandler("onPlayerChangeSkin", root, function(skin)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source, skin)
		local name = getSkinNameFromID(getElementData(source, "skin"));
		setElementData(source, name, getElementData(source, name)+1);
		setElementData(source, skin, getElementData(source, skin)-1);
		local id = getSkinIDFromName(skin);
		setElementData(source, "skin", id);
		setElementModel(source, id);
		triggerClientEvent(source, "refreshInventoryManual", source);
		setElementData(source,"isInAction",false);
	end,3000,1, source, skin);
	setElementData(source,"isInAction",true);
end);

addEventHandler("onPlayerRefillWaterBottle", root, function(itemName)
	if isElementInWater(source) then
		setTimer(function(source, itemName)
			setElementData(source, "fooditem1", getElementData(source, "fooditem1") + 1);
			setElementData(source, itemName, getElementData(source, itemName) - 1);
			triggerClientEvent(source, "refreshInventoryManual", source);
			triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext4",source).." "..getLanguageTextServer(itemName,source), 40, 160, 40);
		end, 175, 1, source, itemName);
		setElementData(source,"isInAction",true);
		setTimer(function(source)
			setElementData(source,"isInAction",false);
		end, 350, 1, source);
	else
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext5",source), 160, 40, 40);
	end
end);

addEventHandler("onPlayerPitchATent", root, function(itemName)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source,itemName)
		setElementData(source, itemName, getElementData(source, itemName) - 1);
		triggerClientEvent(source, "hideInventoryManual", source);
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+5*math.cos(offsetRot);
		local vy = y+5*math.sin(offsetRot);
		local vrot = zr+180;
		local tent = createObject(3243, vx, vy, (z-1), 0, 0, vrot);
		setObjectScale(tent, 1.3);
		local tentCol = createColSphere(x, y, z, 4);
		attachElements(tentCol, tent, 0, 0, 0);
		setElementData(tentCol, "parent", tent);
		setElementData(tent, "parent", tentCol);
		setElementData(tentCol, "tent", true);
		setElementData(tentCol, "MAX_Slots", 100);
	end, 2000, 1, source,itemName);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerBuildASafe", root, function(itemName,code)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source, itemName)
		setElementData(source, itemName, getElementData(source, itemName) - 1);
		triggerClientEvent(source, "refreshInventoryManual", source);
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1.5*math.cos(offsetRot);
		local vy = y+1.5*math.sin(offsetRot);
		local vrot = zr;
		local safe = createObject(2332, vx, vy, z-0.35, 0, 0, vrot);
		setElementCollisionsEnabled(safe,false)
		--setObjectScale(safe, 0.9);
		local safeCol = createColSphere(x, y, z, 2.5);
		local safe_id = (tostring(math.random(999999999))..""..tostring(math.random(999999999)));
		attachElements(safeCol, safe, 0, 0, 0);
		setElementData(safeCol, "parent", safe);
		setElementData(safe, "parent", safeCol);
		setElementData(safeCol, "safe", true);
		setElementData(safeCol, safe_id, code);
		setElementData(safeCol, "id", safe_id);
		setElementData(safeCol, "MAX_Slots", 50);
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext23",source), 40, 160, 40);
	end, 2000, 1, source, itemName);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerPlaceC4", root, function(source,safe_col)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function()
		setElementData(source, "item7", getElementData(source, "item7") - 1);
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("item7",source).." "..getLanguageTextServer("clientinfotext26",source), 40, 160, 40);
		local safe = getElementData(safe_col,"parent");
		local x,y,z = getElementPosition(safe);
		triggerClientEvent(root,"playSoundForClient",source,"c4",x,y,z);
		setTimer(function()
			setElementModel(safe,1829)
			setElementCollisionsEnabled(safe,false)
			setElementData(safe_col,getElementData(safe_col,"id"),"raided");
			createExplosion(x,y,z,2);
			setTimer(function()
				if (safe) then destroyElement(safe); end
				if (safe_col) then destroyElement(safe_col); end
			end,60000*10,1)
		end,5000,1);
	end,2000,1);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerEnterSafeCode", root, function(code,safe_col)
	if (code and safe_col) then
		local safe_id = getElementData(safe_col,"id");
		local safe_code = getElementData(safe_col,safe_id);
		if (safe_code == code) then
			setElementData(source,safe_id,code)
			triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext24",source), 40, 160, 40);
		else
			triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext25",source), 160, 40, 40);
		end
	end
end);

addEventHandler("onPlayerChangeSafeCode", root, function(code,safe_col)
	if (safe_col) then
		local safe_id = getElementData(safe_col,"id");
		removeElementData(source,safe_id)
		setElementData(safe_col,safe_id,code)
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext27",source), 40, 160, 40);
	end
end);

addEventHandler("onPlayerCallAirdrop", root, function()
	if (source) then
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		local x,y,z = getElementPosition(source);
		local splayer = source;
		setTimer(function()
			setElementData(splayer,"item8",getElementData(splayer,"item8") - 1);
			triggerClientEvent(splayer, "refreshInventoryManual", splayer);
			triggerClientEvent(splayer, "displayClientInfo", splayer, getLanguageTextServer("clientinfotext28",splayer), 40, 160, 40);
			local crate = createObject(2975,x,y,z+150,0,0,0,true);
			local parachute = createObject(2903,x,y,z,0,0,0,true);
			local flare1 = createObject(354,x,y,z-1,0,0,0,true);
			local flare2 = createObject(354,x,y,z-1,0,0,0,true);
			attachElements(parachute,crate,0,0,1.5,0,0,0)
			local fallingTime = 2*60000;
			moveObject(crate,fallingTime,x,y,z-1);
			setTimer(function()
				destroyElement(crate);
				moveObject(parachute,fallingTime*0.25,x,y,z-15);
				local airdrop = createObject(2975,x,y,z-1);
				local airdropCol = createColSphere(x, y, z, 4);
				attachElements(airdropCol, airdrop, 0, 0, 0);
				setElementData(airdropCol, "parent", airdrop);
				setElementData(airdrop, "parent", airdropCol);
				setElementData(airdropCol, "airdrop", true);
				setElementData(airdropCol, "MAX_Slots", 100);
				setTimer(function()
					if (airdrop) then destroyElement(airdrop); end
					if (airdropCol) then destroyElement(airdropCol); end
					if (flare1) then destroyElement(flare1); end
					if (flare2) then destroyElement(flare2); end
					if (parachute) then destroyElement(parachute); end
				end,15*60000,1);
			end,fallingTime,1);
		end,2000,1);
		setElementData(splayer,"isInAction",true);
		setTimer(function(splayer)
			setElementData(splayer,"isInAction",false);
		end, 3000, 1, splayer);
	end
end);

addEventHandler("onPlayerBuildAWireFence", root, function(itemName)
	setElementData(source, itemName, getElementData(source, itemName)-1);
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source)
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1*math.cos(offsetRot);
		local vy = y+1*math.sin(offsetRot);
		local vrot = zr+90;
		local wFence = createObject(983, vx, vy, z, xr, yr, vrot);
		setObjectScale(wFence, 1);
		local wFenceCol = createColSphere(x, y, z, 2);
		attachElements(wFenceCol, wFence, 0, 0, 0);
		setElementData(wFenceCol, "parent", wFence);
		setElementData(wFence, "parent", wFenceCol);
		setElementData(wFenceCol, "wirefence", true);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("removeWirefence", root, function(object)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(object)
		destroyElement(getElementData(object, "parent"));
		destroyElement(object);
	end, 2000, 1, object);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("removeTent",root, function(object,player)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	local col = getElementData(object, "parent");
	setTimer(function(col, object)
		local x,y,z = getElementPosition(col);
		local item,itemString = getItemTablePosition("item3");
		local itemPickup = createItemPickup(item, x, y, (z+1), itemString);
		if col then destroyElement(col); end
		if object then destroyElement(object); end
		setElementData(player, "loot", false);
		setElementData(player, "currentCol", false);
		setElementData(player, "lootname", false);
	end, 2000, 1, col, object);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("removeSafe",root, function(object,player)
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	local col = getElementData(object, "parent");
	setTimer(function(col, object)
		local x,y,z = getElementPosition(col);
		local item,itemString = getItemTablePosition("item4");
		local itemPickup = createItemPickup(item, x, y, (z+1), itemString);
		local safe_id = getElementData(col,"id");
		removeElementData(player,safe_id)
		local account = getPlayerAccount(player);
		if (account) then
			setAccountData(account,safe_id,false);
		end
		if col then destroyElement(col); end
		if object then destroyElement(object); end
		setElementData(player, "loot", false);
		setElementData(player, "currentCol", false);
		setElementData(player, "lootname", false);
	end, 2000, 1, col, object);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("removeMine",root, function(detonateCol)
	local mineCol = getElementData(detonateCol, "mineCol");
	local object = getElementData(mineCol, "parent");
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source, detonateCol, object, mineCol)
		if isElement(detonateCol) then destroyElement(detonateCol); end
		if isElement(mineCol) then destroyElement(mineCol); end
		if isElement(object) then destroyElement(object); end
		triggerClientEvent(source, "disableMenu", source);
	end, 2000, 1, source, detonateCol, object, mineCol);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("addPlayerCookMeat", root, function()
	setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source)
		setElementData(source, "fooditem11", getElementData(source, "fooditem11")-1);
		setElementData(source, "fooditem10", getElementData(source, "fooditem10")+1);
		triggerClientEvent(source, "displayClientInfo", source, getLanguageTextServer("clientinfotext6",source).." "..getLanguageTextServer("fooditem11",source)..".", 40, 160, 40);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end, 2000, 1, source);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerMakeAFire", root, function(itemName)
	setPedAnimation(source, "BOMBER","BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source,itemName)
		setElementData(source, "item1", getElementData(source, "item1")-1);
		local x,y,z = getElementPosition(source);
		local xr,yr,zr = getElementRotation(source);
		local offsetRot = math.rad(zr+90);
		local vx = x+1*math.cos(offsetRot);
		local vy = y+1*math.sin(offsetRot);
		local vrot = zr+90;
		local wood = createObject(1463, vx, vy, (z-0.75), xr, yr, vrot);
		setObjectScale(wood, 0.55);
		setElementCollisionsEnabled(wood, false);
		setElementFrozen(wood, true);
		local fire = createObject(3525, vx, vy, (z-0.75), xr, yr, vrot);
		setObjectScale(fire, 0);
		local fireCol = createColSphere(vx, vy, z, 2);
		setElementData(fireCol, "parent", wood);
		setElementData(wood, "parent", fireCol);
		setElementData(fireCol, "fireplace", true);
		triggerClientEvent(root,"playSoundForClient",source,"fireplace",x,y,z,2*60000);
		triggerClientEvent(source, "refreshInventoryManual", source);
		setTimer(function(fireCol, fire, wood)
			if fireCol then destroyElement(fireCol); end
			if fire then destroyElement(fire); end
			if wood then destroyElement(wood); end
		end, (2*60000), 1, fireCol, fire, wood);
	end,2000, 1, source,itemName);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerPlaceRoadflare", root, function(itemName,r,g,b)
	setPedAnimation(source, "BOMBER","BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source,itemName, r, g, b)
		setElementData(source, itemName, getElementData(source, itemName)-1);
		local x,y,z = getElementPosition(source);
		local object1 = createObject(354, x, y, (z-0.6));
		local object2 = createObject(354, x, y, (z-0.6));
		local color1 = createMarker (x,y,(z-0.6),"corona",4,r,g,b)
		local color2 = createMarker (x,y,(z-0.6),"corona",4,r,g,b)
		setTimer(destroyElement, 300000, 1, object1);
		setTimer(destroyElement, 300000, 1, object2);
		setTimer(destroyElement, 300000, 1, color1);
		setTimer(destroyElement, 300000, 1, color2);
		triggerClientEvent(source, "refreshInventoryManual", source);
	end,2000, 1, source, itemName, r, g, b);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

addEventHandler("onPlayerPlaceMine", root, function(itemName)
	setPedAnimation(source, "BOMBER","BOM_Plant", -1, false, false, nil, false);
	setTimer(function(source,itemName)
		setElementData(source, itemName, getElementData(source, itemName)-1);
		local x,y,z = getElementPosition(source);
		local mine = createObject(1510, x, y, (z-1));
		local mineCol = createColSphere(x, y, z, 0.5);
		local detonateCol = createColSphere(x, y, z, 0.7);
		attachElements(mineCol,mine,0,0,0.5);
		setElementData(mineCol,"parent",mine)
		setElementData(mineCol,"detonateCol",detonateCol)
		setElementData(mine,"parent",mineCol)
		setElementData(detonateCol,"mineCol",mineCol)
		setElementData(detonateCol,"mine",true);
		triggerClientEvent(source, "refreshInventoryManual", source);
		local selfdestroyer = setTimer(function(mine,mineCol)
			destroyElement(mine);
			destroyElement(mineCol);
			destroyElement(detonateCol);
		end,15*60000,1,mine,mineCol);
		setElementData(mineCol,"selfdestroyer",selfdestroyer);
		addEventHandler("onColShapeHit", mineCol, detectMine);
	end,2000, 1, source, itemName);
	setElementData(source,"isInAction",true);
	setTimer(function(source)
		setElementData(source,"isInAction",false);
	end, 3000, 1, source);
end);

function detectMine(player)
	local mine = getElementData(source,"parent");
	local detonateCol = getElementData(source,"detonateCol");
	local selfdestroyer = getElementData(source,"selfdestroyer");
	local px,py,pz = getElementPosition(player);
	local ox,oy,oz = getElementPosition(mine);
	local distance = getDistanceBetweenPoints3D(px,py,pz,ox,oy,oz)
	if (getDistanceBetweenPoints3D(px,py,pz,ox,oy,oz) < 2) then
		if (isTimer(selfdestroyer)) then killTimer(selfdestroyer); end
		destroyElement(mine);
		destroyElement(source);
		destroyElement(detonateCol);
		triggerClientEvent(player, "disableMenu", player);
		setTimer(createExplosion, 100, 1, ox, oy, oz, 8, player);
	end
end

addEventHandler("onPlayerChat", root, function(message, mType)
	if (mType == 0 or mType == 1) then
		cancelEvent();
	end
	if (mType == 0) then
		if isPlayerMuted(source) then
			outputChatBox(getLanguageTextServer("clientinfotext43",source), source, 160, 40, 40);
			return;
		end
		local x,y,z = getElementPosition(source);
		local chatSphere = createColSphere(x, y, z, 15);
		local nearbyPlayers = getElementsWithinColShape(chatSphere, "player");
		if (getElementData(source,"antichat")) then
			outputChatBox(getLanguageTextServer("clientinfotext41",source), source, 160, 40, 40);
			return;
		else
			setElementData(source,"antichat",true)
			setTimer(setElementData, 1000, 1, source, "antichat", false);
		end
		destroyElement(chatSphere);
		for _,v in ipairs(nearbyPlayers) do
			outputChatBox("#D3D3D3[LOCAL]#D3D3D3"..string.gsub((getPlayerName(source)..": #D3D3D3"..message), '#%x%x%x%x%x%x', ''), v, 211, 211, 211, true);
		end
	end
end);

addCommandHandler("give", function(source, _, target, amount)
	local target = getPlayerFromPartialName(target);
	local zKills = getElementData(source,"zombieskilled");
	if target and target ~= source then
		if tonumber(amount) >= 1 and zKills >= tonumber(amount) then
			setElementData(source,"zombieskilled",getElementData(source,"zombieskilled")-amount);
			setElementData(target,"zombieskilled",getElementData(target,"zombieskilled")+amount);
			outputChatBox(tostring(amount).." zKills has been sent to "..getPlayerName(target):gsub("#%x%x%x%x%x%x", "").."!",source,50,150,50)
			outputChatBox("You received "..tostring(amount).." zKills from "..getPlayerName(source):gsub("#%x%x%x%x%x%x", "").."!",target,50,150,50)
		else
			outputChatBox("You don't have that much zKills!",source,150,50,50)
		end
	else
		outputChatBox("Player not found!",source,150,50,50)
	end
end);

addCommandHandler("globalchat", function(player, _, ...)
	if (configVar.globalchat) then
		if isPlayerMuted(player) then
			outputChatBox(getLanguageTextServer("clientinfotext43",player), player, 160, 40, 40);
			return;
		end
		if (getElementData(player,"antichat")) then
			outputChatBox(getLanguageTextServer("clientinfotext41",player), player, 160, 40, 40);
			return;
		else
			setElementData(player,"antichat",true)
			setTimer(setElementData, 1000, 1, player, "antichat", false);
		end
		for _,v in ipairs(getElementsByType("player")) do
			outputChatBox("#154360[GLOBAL]#1A5276"..getPlayerName(player):gsub("#%x%x%x%x%x%x", "").."#154360: #FFFFFF"..table.concat({...}, " "):gsub("#%x%x%x%x%x%x", ""), v, 255, 255, 255, true);
		end
	end
end);

addCommandHandler("radiochat", function(player, _, ...)
	if (getElementData(player, "toolbelt8") >= 1) then
		if isPlayerMuted(player) then
			outputChatBox(getLanguageTextServer("clientinfotext43",player), player, 160, 40, 40);
			return;
		end
		if (getElementData(player,"antichat")) then
			outputChatBox(getLanguageTextServer("clientinfotext41",player), player, 160, 40, 40);
			return;
		else
			setElementData(player,"antichat",true)
			setTimer(setElementData, 1000, 1, player, "antichat", false);
		end
		for _,v in ipairs(getElementsByType("player")) do
			if (getElementData(v, "toolbelt8") >= 1) then
				if (getElementData(v, "radiochannel") == getElementData(player, "radiochannel")) then
					outputChatBox("#7D6608[RADIO]#9A7D0A"..getPlayerName(player):gsub("#%x%x%x%x%x%x", "").."#7D6608: #FFFFFF"..table.concat({...}, " "):gsub("#%x%x%x%x%x%x", ""), v, 255, 255, 255, true);
				end
			end
		end
	else
		triggerClientEvent(player, "displayClientInfo", player, getLanguageTextServer("clientinfotext7",player), 160, 40, 40);
	end
end);

setTimer(function()
	for _,v in ipairs(getElementsByType("player")) do
		if getElementData(v, "logedin") then
			local current = getElementData(v, "skin");
			if (getElementData(v, "humanity") <= 0) then
				--setElementModel(v, 180);
			elseif (getElementData(v, "humanity") == 5000) then
				--setElementModel(v, 210);
			else
				setElementModel(v, getElementData(v, "skin"));
			end
		end
	end
end, 5000, 0);

addCommandHandler("kickall", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		for _,v in ipairs(getElementsByType("player")) do
			if (v ~= player) then
				kickPlayer(v, "#Hotfix!");
			end
		end
	end
end);

addEventHandler("onPlayerCommand", root, function(cmd)
	if (cmd == "login" or cmd == "logout") then
		cancelEvent();
	end
end);

addEventHandler("kickPlayerOnHighPing", root, function()
	kickPlayer(source, "Ping > 450!");
end);

function funcBindHandsup(player, key, keyState)
	if (handsUp) then
		setPedAnimation(player, false);
		handsUp = false;
	else
		if (getElementData(player,"isInAction")) then return false; end
		if isPedInVehicle(player) then return false; end
		setPedAnimation(player, "BEACH", "ParkSit_M_loop", -1, true, false, false, false);
		handsUp = true;
	end 
end
function funcBindSit(player, key, keyState)
	if (siting) then
		setPedAnimation(player, false);
		siting = false;
	else
		if (getElementData(player,"isInAction")) then return false; end
		if isPedInVehicle(player) then return false; end
		setPedAnimation(player, "SHOP", "SHP_Rob_HandsUp", -1, true, false, false, false);
		siting = true
	end 
end
function funcBindLie(player, key, keyState)
	if (lying) then
		setPedAnimation(player, false);
		lying = false;
	else
		if (getElementData(player,"isInAction")) then return false; end
		if isPedInVehicle(player) then return false; end
		setPedAnimation(player, "WUZI", "CS_Dead_Guy", -1, false, false, false, true);
		lying = true;
	end
end

function funcBindFriendly(player, key, keyState)
	if isPedInVehicle(player) then return false; end
	if (getElementData(player,"antichat_friendly")) then
		return;
	else
		setElementData(player,"antichat_friendly",true)
		setTimer(setElementData, 3000, 1, player, "antichat_friendly", false);
	end
	if (keyState == "down") then
		local x,y,z = getElementPosition(player);
		triggerClientEvent(root,"playSoundForClient",player,"friendly",x,y,z);
	end
end

addEventHandler("relWep", resourceRoot, function()
	reloadPedWeapon(client);
end);

function changeWeather(weather)
	if (weather) then
		setWeather(weather);
		return;
	else
		setWeather(weatherTable[math.random(4)]);
		setTimer(changeWeather, (30*60000), 1);
	end
end
 
addEventHandler("onPlayerLogin", root, function()
	bindKey(source, ",", "down", funcBindHandsup);
	bindKey(source, ".", "down", funcBindSit);
	bindKey(source, "l", "down", funcBindLie);
	bindKey(source, ";", "down", funcBindFriendly);
end);

addEventHandler("onPlayerBuryBody", root, function()
	if (getElementData(source, "weapon27") >= 1) then
		setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, nil, false);
		local cCol = getElementData(source, "currentCol");
		if cCol then
			if getElementData(cCol, "deadman") then
				setElementData(source, "loot", false);
				setElementData(source, "currentCol", false);
				setTimer(function(cCol)
					if cCol then
						local element = getElementData(cCol, "parent");
						local fader = setTimer(function()
							local x,y,z = getElementPosition(element);
							setElementPosition(element,x,y,z-0.025);
						end,200,15);
						setTimer(function()
							if (isTimer(fader)) then killTimer(fader) end
							destroyElement(element);
						end,3000,1);
					end
					destroyElement(cCol);
				end, 2000, 1, cCol);
			end 
		end
	end
end);

function spawnDayZAnimals()
	for _,v in ipairs(animalsSpawns) do
		local ped = createPed(math.random(12, 14), v[1], v[2], v[3]);
		setElementData(ped, "animal", true);
	end
end

function destroyDeadAnimalAndRespawn(ped, pedCol, x, y, z)
	if (ped and pedCol) then
		destroyElement(ped);
		destroyElement(pedCol);
		local ped = createPed(math.random(12, 14), x, y, z);
		setElementData(ped, "animal", true);
		setPedAnimation(ped, "ped", "pikcup_box");
		setElementSyncer(ped, getRandomPlayer());
	end
end

addEventHandler("createDeadAnimal", root, function()
	local x,y,z = getElementPosition(source);
	local skin = getElementModel(source);
	local ped = createPed(skin, x, y, z);
	local pedCol = createColSphere(x, y, z, 1.5);
	killPed(ped);
	setElementData(pedCol, "parent", ped);
	setElementData(pedCol, "playername", "Animal");
	setElementData(pedCol, "deadman", true);
	setElementData(pedCol, "MAX_Slots", 8);
	local time = getRealTime();
	setElementData(pedCol, "deadreason", {"other","deadanimaltext",time.hour,time.minute,"clocktext"});
	if (getElementModel(source) == 12) then setElementData(pedCol, "fooditem11", math.random(8));
	elseif (getElementModel(source) == 13) then setElementData(pedCol, "fooditem11", math.random(4));
	elseif (getElementModel(source) == 14) then setElementData(pedCol, "fooditem11", math.random(2)); end
	destroyElement(source);
	setTimer(destroyDeadAnimalAndRespawn, 1800000, 1, ped, pedCol, x, y, z);
end);

addEventHandler("onPlayerQuit", root, function(quitType, reason)
	triggerClientEvent("showJQCtext", root, source, "leavetext", 160, 40, 40)
end);

addEventHandler("onPlayerChangeNick", root, function(oldNick, newNick)
	triggerClientEvent("showJQCtext", root, source, "changenicktext", 40, 160, 40, oldNick, newNick)
end);

addEventHandler("onPlayerJoin", root, function()
	setPlayerNametagShowing(source, false);
	--if (not getElementData(source,"language")) then setElementData(source,"language","en"); end
	triggerClientEvent("showJQCtext", root, source, "jointext", 40, 160, 40)
	for i = 70, 79 do
		if (i ~= 73) then
			setPedStat(source, i, 999);
		end
	end
end);

addEventHandler("onPlayerLogin", root, function()
	triggerClientEvent("displayClientInfo", root, getPlayerName(source):gsub("#%x%x%x%x%x%x", ""), 255, 255, 255, 1);
end);

setTimer(function()
	for _,v in ipairs(getElementsByType("ped")) do
		if getElementData(v, "animal") then return; end
		if getElementData(v, "zombie") then
			if getElementData(v, "deadzombie") then return; end
			if isPedDead(v) then return; end
			local x,y,z = getElementPosition(v);
			local path = "sounds/mgroan"..math.random(1, 10)..".ogg";
			triggerClientEvent("playPedSound", root, v, path, x, y, z);
		end
	end
end, 5000, 0);

function sleepFunction(sleepingFunction, ...)
    local co = coroutine.create(sleepingFunction)
    coroutine.resume(co, ...)
end

function sleep(time)
    local co = coroutine.running()
    local function resumeThisCoroutine()
        coroutine.resume(co)
    end
    setTimer(resumeThisCoroutine, time, 1)
    coroutine.yield()
end 

spawnDayZAnimals();
changeWeather(2); -- '7' means you use the weather 7 delete it to make a random weather.