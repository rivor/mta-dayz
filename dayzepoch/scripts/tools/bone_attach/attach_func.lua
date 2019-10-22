attPed = {};
attBone = {};
attX = {};
attY = {};
attZ = {};
attRX = {};
attRY = {};
attRZ = {};

function attachElementToBone(element, ped, bone, x, y, z, rx, ry, rz)
	if (not isElement(element) and isElement(ped)) then return false; end
	if (getElementType(ped) ~= "ped" and getElementType(ped) ~= "player") then return false; end
	local bone = tonumber(bone);
	if (not bone or bone < 1 or bone > 20) then return false; end
	local x,y,z,rx,ry,rz = tonumber(x) or 0,tonumber(y) or 0,tonumber(z) or 0,tonumber(rx) or 0,tonumber(ry) or 0,tonumber(rz) or 0;
	attPed[element] = ped;
	attBone[element] = bone;
	attX[element] = x;
	attY[element] = y;
	attZ[element] = z;
	attRX[element] = rx;
	attRY[element] = ry;
	attRZ[element] = rz;
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element, false);
	end
	if script_serverside then
		triggerClientEvent("boneAttach_attach", root, element, ped, bone, x, y, z, rx, ry, rz);
	end
	return true;
end

function detachElementFromBone(element)
	if (not element) then return false; end
	if (not attPed[element]) then return false; end
	clearAttachmentData(element);
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element, true);
	end
	if (script_serverside) then
		triggerClientEvent("boneAttach_detach", root, element);
	end
	return true;
end

function isElementAttachedToBone(element)
	if (not element) then return false; end
	return isElement(attPed[element]);
end

function getElementBoneAttachmentDetails(element)
	if not isElementAttachedToBone(element) then return false; end
	return attPed[element],  attBone[element], attX[element], attY[element], attZ[element], attRX[element], attRY[element], attRZ[element];
end 

function setElementBonePositionOffset(element,x,y,z)
	local ped,bone,ox,oy,oz,rx,ry,rz = getElementBoneAttachmentDetails(element);
	if (not ped) then return false; end
	return attachElementToBone(element, ped, bone, x, y, z, rx, ry, rz);
end

function setElementBoneRotationOffset(element,rx,ry,rz)
	local ped,bone,x,y,z,ox,oy,oz = getElementBoneAttachmentDetails(element);
	if (not ped) then return false; end
	return attachElementToBone(element, ped, bone, x, y, z, rx, ry, rz);
end

if (not script_serverside) then
	function getBonePositionAndRotation(ped, bone)
		local bone = tonumber(bone);
		if (not bone or bone < 1 or bone > 20) then return false; end
		if (not isElement(ped)) then return false; end
		if (getElementType(ped) ~= "player" and getElementType(ped) ~= "ped") then return false; end
		if (not isElementStreamedIn(ped)) then return false; end
		local x,y,z = getPedBonePosition(ped, bone_0[bone]);
		local rx,ry,rz = getEulerAnglesFromMatrix(getBoneMatrix(ped, bone));
		return x,y,z,rx,ry,rz;
	end
end

function clearAttachmentData(element)
	attPed[element] = nil;
	attBone[element] = nil;
	attX[element] = nil;
	attY[element] = nil;
	attZ[element] = nil;
	attRX[element] = nil;
	attRY[element] = nil;
	attRZ[element] = nil;
end

addEventHandler(script_serverside and "onElementDestroy" or "onClientElementDestroy", root, function()
	if (not attPed[source]) then return; end
	clearAttachmentData(source);
end);

function forgetNonExistingPeds()
	local checkedcount = 0;
	while true do
		for i,v in pairs(attPed) do
			if not isElement(v) then clearAttachmentData(i); end
			checkedcount = checkedcount + 1;
			if (checkedcount >= 1000) then
				coroutine.yield();
				checkedcount = 0;
			end
		end
		coroutine.yield();
	end
end

local clearing_nonexisting_peds = coroutine.create(forgetNonExistingPeds);
setTimer(function()
	if coroutine.status (clearing_nonexisting_peds) == "dead" then
		clearing_nonexisting_peds = coroutine.create(forgetNonExistingPeds);
	end
	coroutine.resume(clearing_nonexisting_peds)
end, 1000, 0);