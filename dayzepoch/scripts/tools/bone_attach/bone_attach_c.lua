addEventHandler("onClientResourceStart", resourceRoot, function()
	triggerServerEvent("boneAttach_requestAttachmentData", root);
	addEvent("boneAttach_attach", true);
	addEvent("boneAttach_detach", true);
	addEventHandler("boneAttach_attach", root, attachElementToBone);
	addEventHandler("boneAttach_detach", root, detachElementFromBone);
end);

addEvent("boneAttach_sendAttachmentData", true);
addEventHandler("boneAttach_sendAttachmentData", root, function(ped, bone, x, y, z, rx, ry, rz)
	for i,v in pairs(ped) do
		attPed[i] = v;
		attBone[i] = bone[i];
		attX[i] = x[i];
		attY[i] = y[i];
		attZ[i] = z[i];
		attRX[i] = rx[i];
		attRY[i] = ry[i];
		attRZ[i] = rz[i];
	end
end);

bone_0, bone_t, bone_f = {}, {}, {};
bone_0[1], bone_t[1], bone_f[1] = 5, nil, 6 --head;
bone_0[2], bone_t[2], bone_f[2] = 4, 5, 8 --neck;
bone_0[3], bone_t[3], bone_f[3] = 3, nil, 31 --spine;
bone_0[4], bone_t[4], bone_f[4] = 1, 2, 3 --pelvis;
bone_0[5], bone_t[5], bone_f[5] = 4, 32, 5 --left clavicle;
bone_0[6], bone_t[6], bone_f[6] = 4, 22, 5 --right clavicle;
bone_0[7], bone_t[7], bone_f[7] = 32, 33, 34 --left shoulder;
bone_0[8], bone_t[8], bone_f[8] = 22, 23, 24 --right shoulder;
bone_0[9], bone_t[9], bone_f[9] = 33, 34, 32 --left elbow;
bone_0[10], bone_t[10], bone_f[10] = 23, 24, 22 --right elbow;
bone_0[11], bone_t[11], bone_f[11] = 34, 35, 36 --left hand;
bone_0[12], bone_t[12], bone_f[12] = 24, 25, 26 --right hand;
bone_0[13], bone_t[13], bone_f[13] = 41, 42, 43 --left hip;
bone_0[14], bone_t[14], bone_f[14] = 51, 52, 53 --right hip;
bone_0[15], bone_t[15], bone_f[15] = 42, 43, 44 --left knee;
bone_0[16], bone_t[16], bone_f[16] = 52, 53, 54 --right knee;
bone_0[17], bone_t[17], bone_f[17] = 43, 42, 44 --left angle;
bone_0[18], bone_t[18], bone_f[18] = 53, 52, 54 --right angle;
bone_0[19], bone_t[19], bone_f[19] = 44, 43, 42 --left foot;
bone_0[20], bone_t[20], bone_f[20] = 54, 53, 52 --right foot;

addEventHandler("onClientPreRender", root, function()
	for i,v in pairs(attPed) do
		if (not isElement(i)) then
			clearAttachmentData(i);
		elseif isElementStreamedIn(v) then
			local bone = attBone[i];
			local x, y, z = getPedBonePosition(v, bone_0[bone]);
			local xX, xY, xZ, yX, yY, yZ, zX, zY, zZ = getBoneMatrix(v, bone);
			local offX, offY, offZ = attX[i], attY[i], attZ[i];
			local offRX, offRY, offRZ = attRX[i], attRY[i], attRZ[i];
			local objX = x+offX*xX+offY*yX+offZ*zX;
			local objY = y+offX*xY+offY*yY+offZ*zY;
			local objZ = z+offX*xZ+offY*yZ+offZ*zZ;
			local RxX, RxY, RxZ, RyX, RyY, RyZ, RzX, RzY, RzZ = getMatrixFromEulerAngles(offRX,offRY,offRZ);
			local TxX = RxX*xX+RxY*yX+RxZ*zX;
			local TxY = RxX*xY+RxY*yY+RxZ*zY;
			local TxZ = RxX*xZ+RxY*yZ+RxZ*zZ;
			local TyX = RyX*xX+RyY*yX+RyZ*zX;
			local TyY = RyX*xY+RyY*yY+RyZ*zY;
			local TyZ = RyX*xZ+RyY*yZ+RyZ*zZ;
			local TzX = RzX*xX+RzY*yX+RzZ*zX;
			local TzY = RzX*xY+RzY*yY+RzZ*zY;
			local TzZ = RzX*xZ+RzY*yZ+RzZ*zZ;
			local offRX, offRY, offRZ = getEulerAnglesFromMatrix(TxX, TxY, TxZ, TyX, TyY, TyZ, TzX, TzY, TzZ);
			if (not tonumber(tostring(objX)) or not tonumber(tostring(objY)) or not tonumber(tostring(objZ))) then return; end
			if (not tonumber(tostring(offRX)) or not tonumber(tostring(offRY)) or not tonumber(tostring(offRZ))) then return; end
			setElementPosition(i, objX, objY, objZ);
			setElementRotation(i, offRX, offRY, offRZ, "ZXY");
		else
			setElementPosition(i, getElementPosition(v));
		end
	end
end);