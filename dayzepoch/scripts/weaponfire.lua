-- weapon fire

local blockedTasks =  {
	"TASK_SIMPLE_IN_AIR",
	"TASK_SIMPLE_JUMP",
	"TASK_SIMPLE_LAND",
	"TASK_SIMPLE_GO_TO_POINT",
	"TASK_SIMPLE_NAMED_ANIM",
	"TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE",
	"TASK_SIMPLE_CAR_GET_IN",
	"TASK_SIMPLE_CLIMB",
	"TASK_SIMPLE_SWIM",
	"TASK_SIMPLE_HIT_HEAD",
	"TASK_SIMPLE_FALL",
	"TASK_SIMPLE_GET_UP"
};

addEvent("onClientCreateWeaponSound",true)

--[[local sW,sH = guiGetScreenSize();
local badSlots = {[0]=1, [1]=1, [9]=1, [10]=1, [11]=1, [12]=1, [6]=1};

function clickSound()
	playSound("sounds/click.wav");
	-- or we can play gta's built-in click sound with playSoundFrontEnd(41)
end

function checkAmmo(wepslot)
	local clipAmmo = getPedAmmoInClip(localPlayer,wepslot);
	local totalAmmo = getPedTotalAmmo(localPlayer,wepslot);
	if (wepslot == 6 and getPedTotalAmmo(localPlayer,6) <= 1) then
		toggleControl("fire",false);
		toggleControl("action",false);
		bindKey("fire","down",clickSound);
		outputChatBox("1 bind")
		return true;
	elseif (not badSlots[wepslot] and clipAmmo == 0 or not badSlots[wepslot] and totalAmmo <= 1) then
		toggleControl("fire",false);
		toggleControl("action",false);
		bindKey("fire","down",clickSound);
		outputChatBox("2 bind")
		return true;
	else
		toggleControl("fire",true);
		toggleControl("action",true);
		unbindKey("fire","down",clickSound);
		outputChatBox("unbind")
		return false;
	end
end
addEvent("checkClientAmmo",true);
addEventHandler("checkClientAmmo",root,checkAmmo);]]

bindKey("r", "down", function()
	setTimer(function()
		local ammo = getPedAmmoInClip(localPlayer);
		--local totalAmmo = getPedTotalAmmo(localPlayer);
		local clip = getWeaponProperty(getPedWeapon(localPlayer), "std", "maximum_clip_ammo");
		if (ammo ~= clip) then
			local task = getPedSimplestTask(localPlayer);
			for _,v in pairs(blockedTasks) do
				if (task == v) then
					return;
				end
			end
			triggerServerEvent("relWep", resourceRoot);
		end
	end, 50, 1);
end);

addEventHandler("onClientCreateWeaponSound",root,function(soundname,noise,x,y,z)
	local sound = playSound3D("sounds/weapons/"..soundname, x, y, z, false);
	setSoundMaxDistance(sound,noise);
end);

addEventHandler("onClientPlayerWeaponFire", localPlayer, function(weapon,ammo)
	--if (checkAmmo(getPedWeaponSlot(localPlayer))) then clickSound() end;
	local x,y,z = getPedBonePosition(localPlayer,26);
	local primary = getElementData(localPlayer,"currentweapon_1");
	local secondary = getElementData(localPlayer,"currentweapon_2");
	for _,v in ipairs(getWeaponPropertyTable()) do
		if (primary == v[1] and weapon == getWeaponIDFromDayZName(primary)) then
			triggerServerEvent("onCreateWeaponSound",localPlayer,v[5],getWeaponNoise(primary),x,y,z)
			createExplosion(x, y, z+10, 12, false, v[3], false);
			if (v[4] >= 50) then
				toggleControl("fire",false);
				toggleControl("action",false);
				setTimer(toggleControl,v[4],1,"fire",true);
				setTimer(toggleControl,v[4],1,"action",true);
			end
		elseif (secondary == v[1] and weapon == getWeaponIDFromDayZName(secondary)) then
			triggerServerEvent("onCreateWeaponSound",localPlayer,v[5],getWeaponNoise(secondary),x,y,z)
			createExplosion(x, y, z+10, 12, false, v[3], false);
			if (v[4] >= 50) then
				toggleControl("fire",false);
				toggleControl("action",false);
				setTimer(toggleControl,v[4],1,"fire",true);
				setTimer(toggleControl,v[4],1,"action",true);
			end
		end
	end
end);

local weaponslots = {
	[25] = 1, [26] = 1, [27] = 1,
	[30] = 1, [31] = 1, [33] = 1,
	[34] = 1, [2]  = 2, [4]  = 2,
	[5]  = 2, [6]  = 2, [8]  = 2,
	[22] = 2, [23] = 2, [24] = 2,
	[29] = 2, [16] = 3, [17] = 3,
	[46] = 3, [43] = 3, [39] = 3
};

--[[
local weaponClipSizeTable = {
	{"weapon11",20},
	{"weapon12",100},
	{"weapon13",100},
	{"weapon10",30},
	{"weapon6",30},
	{"weapon14",30},
	{"weapon2",1},
	{"weapon3",1},
	{"weapon5",1},
	{"weapon1",1},
	{"weapon4",1},
	{"weapon7",1},
	{"weapon9",30},
	{"weapon8",1},
	{"weapon15",7},
	{"weapon18",20},
	{"weapon21",10},
	{"weapon23",15},
	{"weapon25",15},
	{"weapon20",30},
	{"weapon19",7},
};
]]--

addEventHandler("onClientPlayerWeaponSwitch", localPlayer, function(_,currS)
	--checkAmmo(currS);
	toggleControl("fire",true);
	toggleControl("action",true);
	--[[
	local weaponid = getPedWeapon(localPlayer,currS);
	local weapon = getElementData(localPlayer,"currentweapon_"..weaponslots[weaponid]);
	for _,v in ipairs(weaponClipSizeTable) do
		if (weapon == v[1]) then
			setWeaponProperty(getWeaponNameFromID(weaponid), "pro", "maximum_clip_ammo", v[2]);
			setWeaponProperty(getWeaponNameFromID(weaponid), "std", "maximum_clip_ammo", v[2]);
			setWeaponProperty(getWeaponNameFromID(weaponid), "poor", "maximum_clip_ammo", v[2]);
		end
	end
	]]
end);

addEventHandler("onClientVehicleDamage",root,function(attacker,wep,loss,x,y,z,tyreid)
	if (wep == 63 or wep == 51 or wep == 19) then
		cancelEvent();
		local aX,aY,aZ = getElementPosition(attacker);
		local tX,tY,tZ = getElementPosition(source);
		if isLineOfSightClear(tX,tY,tZ,aX,aY,aZ,true,false,false,true) then
			blowVehicle(source,true);
		end
	elseif (attacker and wep and wep ~= 51) then
		local model = getElementModel(source);
		if (getElementModel(source) == 528) then
			cancelEvent();
			return;
		end
		if (wep == 0) then
			cancelEvent();
		else
			local damage = getWeaponVehicleDamage(attacker,wep);
			if (damage) then
				if (damage == 0) then return; end
				if (model == 487 or model == 497) then
					cancelEvent();
				else
					setElementHealth(source,getElementHealth(source)+loss);
				end
				setElementHealth(source,getElementHealth(source)-damage);
				iprint(model,getElementHealth(source),loss,damage)
			end
		end

	end
end);

--[[addEventHandler("onClientRender", root, function()
	if (not badSlots[getPedWeaponSlot(localPlayer)] and getPedTotalAmmo(localPlayer,getPedWeaponSlot(localPlayer)) <= 1) then
		dxDrawImage(sW*0.5-55+1,sH*0.8+1,100,100,"images/dayzicons/reload2.png",0,0,0,tocolor(0,0,0,255),false);
		dxDrawImage(sW*0.5-55,sH*0.8,100,100,"images/dayzicons/reload2.png",0,0,0,dxServerTheme5,false);
	end
end);]]