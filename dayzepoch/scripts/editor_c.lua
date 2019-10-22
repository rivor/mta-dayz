dxServerTheme = tocolor(142, 109, 75, 200);
dxServerTheme2 = tocolor(209, 156, 104, 240);
dxServerTheme3 = {222, 184, 135};
dxServerTheme4 = {222, 184, 135, 180};
dxServerTheme5 = tocolor(142, 109, 75, 255);

addEventHandler("onClientElementDataChange",root,function(dataName)
	if (dataName == "setting.servertheme") then
		if (getElementData(localPlayer,"setting.servertheme") == 1) then -- (brown)
			dxServerTheme = tocolor(142, 109, 75, 200);
			dxServerTheme2 = tocolor(209, 156, 104, 240);
			dxServerTheme3 = {222, 184, 135};
			dxServerTheme4 = {222, 184, 135, 180};
			dxServerTheme5 = tocolor(142, 109, 75, 255);
		elseif (getElementData(localPlayer,"setting.servertheme") == 2) then -- (blue)
			dxServerTheme = tocolor(84, 135, 177, 200);
			dxServerTheme2 = tocolor(122, 195, 255, 240);
			dxServerTheme3 = {160, 212, 255};
			dxServerTheme4 = {160, 212, 255, 180};
			dxServerTheme5 = tocolor(84, 135, 177, 255);
		elseif (getElementData(localPlayer,"setting.servertheme") == 3) then -- (green)
			dxServerTheme = tocolor(160, 209, 92, 200);
			dxServerTheme2 = tocolor(155, 239, 38, 240);
			dxServerTheme3 = {213, 255, 155};
			dxServerTheme4 = {213, 255, 155, 180};
			dxServerTheme5 = tocolor(160, 209, 92, 255);
		end
	end
end);