--[[
	Code Author: kaasis/rivor2
	Contact Info: http://steamcommunity.com/id/rivor2
]]--

addEvent("notify",true);

local w,h = guiGetScreenSize();

local fade = 0;
local fade_fadein = false;
local fade_fadeaway = false;
local fade_staytime = 5; -- how many seconds text will stay

addEventHandler("onClientRender",root,function()
	if fade_fadein then
		fade = fade+10;
		if fade >= 255 then
			fade = 255;
			fade_fadein = false;
		end
	end
	if fade_fadeaway then
		fade = fade-10;
		if fade <= 0 then
			fade = 0;
			fade_fadeaway = false;
		end
	end
	if (fade >= 1) then
		dxDrawText("New mission has been spawned, check your map for locations!", w/2+1, h/3+1, w/2+1, h/3+1,tocolor(0,0,0,fade),1.09,"default-bold","center","center",false,false,true)
		dxDrawText("New mission has been spawned, check your map for locations!", w/2, h/3, w/2, h/3,tocolor(255,255,255,fade),1.09,"default-bold","center","center",false,false,true)
	end
end);

function notify()
	fade_fadein = true;
	setTimer(function()
		fade_fadeaway = true;
	end,1000*fade_staytime,1);
end

addEventHandler("notify",root,function()
	fade = 0;
	notify();
end);