local sW,sH = guiGetScreenSize();
local isEnabled = false;

addEvent("renderBlackWhite", true);

function renderEffect()
	dxSetRenderTarget();
	dxUpdateScreenSource(screenSrc2);
	dxDrawImage(0, 0, sW, sH, screenShader2);
end

function renderBlackWhite(bool)
	if bool then
		if isEnabled then return; end
		screenShader2 = dxCreateShader("scripts/tools/blackwhite/blackwhite.fx");
		screenSrc2 = dxCreateScreenSource(sW, sH);
		if (screenShader2 and screenSrc2) then
			dxSetShaderValue(screenShader2, "BlackWhiteTexture", screenSrc2);
			addEventHandler("onClientHUDRender", root, renderEffect);
		end
		isEnabled = true;
	else
		if (screenShader2 and screenSrc2) then
			destroyElement(screenShader2);
			destroyElement(screenSrc2);
			screenShader2, screenSrc2 = nil, nil;
			removeEventHandler("onClientHUDRender", root, renderEffect);
			isEnabled = false;
		end
	end
end
addEventHandler("renderBlackWhite", root, renderBlackWhite);