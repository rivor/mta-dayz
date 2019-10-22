local ucp = {checkbox = {},staticimage = {},edit = {},window = {},tabpanel = {},radiobutton = {},button = {},label = {},tab = {}}

local sW, sH = guiGetScreenSize()

local setting_crosshair = nil;
local setting_weaponhud = nil;
local setting_debugmonitor = nil;
local setting_fps = nil;
local setting_lookbehind = nil;
local setting_servertheme = nil;

local crosshair = {
    [1] = dxCreateTexture("crosshairs/1.png"),
    [2] = dxCreateTexture("crosshairs/2.png"),
    [3] = dxCreateTexture("crosshairs/3.png"),
    [4] = dxCreateTexture("crosshairs/4.png"),
    [5] = dxCreateTexture("crosshairs/5.png")
}

local crosshair_shader = dxCreateShader("shader/crosshair_shader.fx");

function getBooleanFromNumber(number)
    if number == 1 then
        return true;
    elseif number == 0 then
        return false;
    end
end

function getNumberFromBoolean(boolean)
    if boolean == true then
        return 1;
    elseif boolean == false then
        return 0;
    end
end

function math.round(number, decimals, method) 
    decimals = decimals or 0 
    local factor = 10 ^ decimals 
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor 
    else return tonumber(("%."..decimals.."f"):format(number)) end 
end 

function formatTime(value)
    if value then
        days = math.round(value/(24*60));
        hours = math.round((value%(24*60)) / 60);
        minutes = math.round((value%(24*60)) % 60);
        if (minutes < 10) then minutes = "0"..minutes end
        return days,hours,minutes;
    end
    return false;
end

function replaceCrosshair(shader,texture)
    dxSetShaderValue(shader,"crosshair_texture",texture) 
    engineApplyShaderToWorldTexture(shader,"sitem16")
end

function loadXML()
    local xml = xmlLoadFile("dayzsettings.xml");
    if not xml then
        xml = xmlCreateFile("dayzsettings.xml","settings");
        xmlNodeSetAttribute(xml,"username","");
        xmlNodeSetAttribute(xml,"language","en");
        xmlNodeSetAttribute(xml,"crosshair",1);
        xmlNodeSetAttribute(xml,"weaponhud",1);
        xmlNodeSetAttribute(xml,"debugmonitor",1);
        xmlNodeSetAttribute(xml,"fps",1);
        xmlNodeSetAttribute(xml,"lookbehind",0);
        xmlNodeSetAttribute(xml,"servertheme",1);
        xmlSaveFile(xml);
    end

    setting_username = xmlNodeGetAttribute(xml,"username");
    setting_language = xmlNodeGetAttribute(xml,"language");
    setting_crosshair = tonumber(xmlNodeGetAttribute(xml,"crosshair"));
    setting_weaponhud = getBooleanFromNumber(tonumber(xmlNodeGetAttribute(xml,"weaponhud")));
    setting_debugmonitor = getBooleanFromNumber(tonumber(xmlNodeGetAttribute(xml,"debugmonitor")));
    setting_fps = getBooleanFromNumber(tonumber(xmlNodeGetAttribute(xml,"fps")));
    setting_lookbehind = getBooleanFromNumber(tonumber(xmlNodeGetAttribute(xml,"lookbehind")));
    setting_servertheme = tonumber(xmlNodeGetAttribute(xml,"servertheme"))
    guiSetText(login.edit[1],setting_username);
    setElementData(localPlayer,"language",setting_language);
    setElementData(localPlayer,"setting.weaponhud",setting_weaponhud);
    setElementData(localPlayer,"setting.debugmonitor",setting_debugmonitor);
    setElementData(localPlayer,"setting.fps",setting_fps);
    setElementData(localPlayer,"setting.servertheme",setting_servertheme);
    setElementData(localPlayer,"setting.lookbehind",setting_lookbehind);

    toggleControl("look_behind",setting_lookbehind);

    guiCheckBoxSetSelected(ucp.checkbox[1],setting_weaponhud);
    guiCheckBoxSetSelected(ucp.checkbox[2],setting_debugmonitor);
    guiCheckBoxSetSelected(ucp.checkbox[3],setting_fps);
    guiCheckBoxSetSelected(ucp.checkbox[4],setting_lookbehind);

    replaceCrosshair(crosshair_shader,crosshair[setting_crosshair]);

    guiRadioButtonSetSelected(ucp.radiobutton[setting_servertheme],true)

    xmlUnloadFile(xml);
end

function settings_gui()
    ucp.window[1] = guiCreateWindow((sW - 329) / 2, (sH - 291) / 2, 329, 291, "User Control Panel", false)
    guiWindowSetSizable(ucp.window[1], false)
    guiSetVisible(ucp.window[1],false)

    guiSetProperty(ucp.window[1],"AlwaysOnTop","True");

    ucp.tabpanel[1] = guiCreateTabPanel(10, 27, 309, 254, false, ucp.window[1])

    ucp.tab[1] = guiCreateTab("Settings", ucp.tabpanel[1])

    ucp.label[1] = guiCreateLabel(10, 10, 285, 15, "Crosshair:", false, ucp.tab[1])
    guiSetFont(ucp.label[1], "default-bold-small")
    ucp.staticimage[1] = guiCreateStaticImage(10, 35, 49, 49, "crosshairs/1.png", false, ucp.tab[1])
    ucp.staticimage[2] = guiCreateStaticImage(69, 35, 49, 49, "crosshairs/2.png", false, ucp.tab[1])
    ucp.staticimage[3] = guiCreateStaticImage(128, 35, 49, 49, "crosshairs/3.png", false, ucp.tab[1])
    ucp.staticimage[4] = guiCreateStaticImage(187, 35, 49, 49, "crosshairs/4.png", false, ucp.tab[1])
    ucp.staticimage[5] = guiCreateStaticImage(246, 35, 49, 49, "crosshairs/5.png", false, ucp.tab[1])
    ucp.staticimage[6] = guiCreateStaticImage(10, 35, 49, 49, "crosshairs/hover.png", false, ucp.tab[1])
    ucp.staticimage[7] = guiCreateStaticImage(69, 35, 49, 49, "crosshairs/hover.png", false, ucp.tab[1])
    ucp.staticimage[8] = guiCreateStaticImage(128, 35, 49, 49, "crosshairs/hover.png", false, ucp.tab[1])
    ucp.staticimage[9] = guiCreateStaticImage(187, 35, 49, 49, "crosshairs/hover.png", false, ucp.tab[1])
    ucp.staticimage[10] = guiCreateStaticImage(246, 35, 49, 49, "crosshairs/hover.png", false, ucp.tab[1])
    for i=6,#ucp.staticimage do
        guiSetAlpha(ucp.staticimage[i],0.025);
    end

    ucp.label[2] = guiCreateLabel(10, 94, 285, 15, "Hud:", false, ucp.tab[1])
    guiSetFont(ucp.label[2], "default-bold-small")
    ucp.checkbox[1] = guiCreateCheckBox(10, 119, 135, 15, "Weapon Hud", false, false, ucp.tab[1])
    ucp.checkbox[2] = guiCreateCheckBox(10, 144, 135, 15, "Debug Monitor", false, false, ucp.tab[1])
    ucp.checkbox[3] = guiCreateCheckBox(160, 119, 135, 15, "Show FPS", false, false, ucp.tab[1])
    ucp.checkbox[4] = guiCreateCheckBox(160, 144, 135, 15, "Look Behind", false, false, ucp.tab[1])
    ucp.label[3] = guiCreateLabel(10, 169, 285, 15, "Server Theme:", false, ucp.tab[1])
    guiSetFont(ucp.label[3], "default-bold-small")
    ucp.radiobutton[1] = guiCreateRadioButton(10, 194, 92, 15, "Brown", false, ucp.tab[1])
    ucp.radiobutton[2] = guiCreateRadioButton(112, 194, 92, 15, "Blue", false, ucp.tab[1])
    ucp.radiobutton[3] = guiCreateRadioButton(213, 194, 82, 15, "Green", false, ucp.tab[1])

    ucp.tab[2] = guiCreateTab("Statistics", ucp.tabpanel[1])

    ucp.label[4] = guiCreateLabel(10, 10, 289, 15, "Character:", false, ucp.tab[2])
    guiSetFont(ucp.label[4], "default-bold-small")
    ucp.label[5] = guiCreateLabel(10, 35, 289, 15, "Total zombies killed: N/A", false, ucp.tab[2])
    ucp.label[6] = guiCreateLabel(10, 60, 289, 15, "Total headshots: N/A", false, ucp.tab[2])
    ucp.label[7] = guiCreateLabel(10, 85, 289, 15, "Total bandits killed: N/A", false, ucp.tab[2])
    ucp.label[8] = guiCreateLabel(10, 110, 289, 15, "Total bullets shot: N/A", false, ucp.tab[2])
    ucp.label[9] = guiCreateLabel(10, 135, 289, 15, "Total deaths: N/A", false, ucp.tab[2])
    ucp.label[10] = guiCreateLabel(10, 160, 289, 15, "Account:", false, ucp.tab[2])
    guiSetFont(ucp.label[10], "default-bold-small")
    ucp.label[11] = guiCreateLabel(10, 185, 289, 15, "Total play time: 900 Days 23 Hours  59 Minutes", false, ucp.tab[2])
    ucp.label[12] = guiCreateLabel(10, 201, 289, 15, "Joined: 21 August, 2017.", false, ucp.tab[2])

    ucp.tab[3] = guiCreateTab("Account", ucp.tabpanel[1])

    ucp.label[13] = guiCreateLabel(10, 10, 289, 15, "Email:", false, ucp.tab[3])
    guiSetFont(ucp.label[13], "default-bold-small")
    ucp.edit[1] = guiCreateEdit(10, 35, 289, 23, "email@gmail.com", false, ucp.tab[3])
    guiEditSetReadOnly(ucp.edit[1], true)
    guiEditSetMaxLength(ucp.edit[1], 100)
    ucp.label[14] = guiCreateLabel(16, 58, 277, 15, "*for security purposes, you can't change your email.", false, ucp.tab[3])
    guiSetFont(ucp.label[14], "default-small")
    ucp.edit[2] = guiCreateEdit(10, 108, 289, 23, "", false, ucp.tab[3])
    guiEditSetMasked(ucp.edit[2], true)
    guiEditSetMaxLength(ucp.edit[2], 100)
    ucp.label[15] = guiCreateLabel(10, 83, 70, 15, "Password:", false, ucp.tab[3])
    guiSetFont(ucp.label[15], "default-bold-small")
    ucp.label[16] = guiCreateLabel(80, 83, 213, 15, "", false, ucp.tab[3])
    guiLabelSetHorizontalAlign(ucp.label[16], "right", false)
    guiSetFont(ucp.label[16], "default")
    ucp.label[17] = guiCreateLabel(16, 131, 277, 15, "*old password", false, ucp.tab[3])
    guiSetFont(ucp.label[17], "default-small")
    ucp.edit[3] = guiCreateEdit(10, 156, 289, 23, "", false, ucp.tab[3])
    guiEditSetMasked(ucp.edit[3], true)
    guiEditSetMaxLength(ucp.edit[3], 100)
    ucp.label[18] = guiCreateLabel(16, 179, 277, 15, "*new password", false, ucp.tab[3])
    guiSetFont(ucp.label[18], "default-small")
    ucp.button[1] = guiCreateButton(181, 189, 112, 30, "Change Password", false, ucp.tab[3])

    loadXML(); -- load xml file or create if it doesn't exist
end
addEventHandler("onClientResourceStart",resourceRoot,settings_gui);

function killErrorMessageTimer()
    if isTimer(errorMessageTimer) then
        killTimer(errorMessageTimer)
        guiSetText(ucp.label[16],"")
        guiSetAlpha(ucp.label[16],1)
    end
end

function errorMessage(text,r,g,b)
    if (text) then
        guiSetText(ucp.label[16],text)
        guiLabelSetColor(ucp.label[16],r,g,b)
        if isTimer(errorMessageTimer) then
            killTimer(errorMessageTimer)
            guiSetAlpha(ucp.label[16],1)
            errorMessageTimer = setTimer(removeErrorMessage,275,15)
        else
            function removeErrorMessage()
                if (guiGetAlpha(ucp.label[16]) > 0.30) then
                    guiSetAlpha(ucp.label[16],guiGetAlpha(ucp.label[16])-0.05)
                elseif (guiGetAlpha(ucp.label[16]) < 0.30) then
                    if isTimer(errorMessageTimer) then killTimer(errorMessageTimer) end
                    guiSetText(ucp.label[16],"")
                    guiSetAlpha(ucp.label[16],1)
                end
            end
            errorMessageTimer = setTimer(removeErrorMessage,275,15)
        end
    end
end
addEvent("settingsErrorMessage",true);
addEventHandler("settingsErrorMessage",root,errorMessage);

addEventHandler("onClientResourceStop",resourceRoot,function()
    setting_username = guiGetText(login.edit[1]);
    local xml = xmlLoadFile("dayzsettings.xml");
    if not xml then xmlCreateFile("dayzsettings.xml","settings"); end
    xmlNodeSetAttribute(xml,"username",setting_username);
    xmlNodeSetAttribute(xml,"language",getElementData(localPlayer,"language"));
    xmlNodeSetAttribute(xml,"crosshair",setting_crosshair);
    xmlNodeSetAttribute(xml,"weaponhud",getNumberFromBoolean(setting_weaponhud));
    xmlNodeSetAttribute(xml,"debugmonitor",getNumberFromBoolean(setting_debugmonitor));
    xmlNodeSetAttribute(xml,"fps",getNumberFromBoolean(setting_fps));
    xmlNodeSetAttribute(xml,"lookbehind",getNumberFromBoolean(setting_lookbehind));
    xmlNodeSetAttribute(xml,"servertheme",setting_servertheme);
    xmlSaveFile(xml);
    xmlUnloadFile(xml);
end);

local monthToName = {
    [1] = "January";
    [2] = "February";
    [3] = "March";
    [4] = "April";
    [5] = "May";
    [6] = "June";
    [7] = "July";
    [8] = "August";
    [9] = "September";
    [10] = "October";
    [11] = "November";
    [12] = "December";
}

setTimer(function()
    if (getElementData(localPlayer,"logedin")) then
        if (not getElementData(localPlayer,"stats.zombieskilled")) then return; end
        local days,hours,minutes = formatTime(tonumber(getElementData(localPlayer,"stats.playtime")));
        local timestamp = getElementData(localPlayer,"stats.joined")
        local time = getRealTime(timestamp);
        time.month = time.month+1;
        time.year = time.year+1900;
        guiSetText(ucp.edit[1],getElementData(localPlayer,"stats.email"));
        guiSetText(ucp.label[5],"Total zombies killed: "..getElementData(localPlayer,"stats.zombieskilled"));
        guiSetText(ucp.label[6],"Total headshots: "..getElementData(localPlayer,"stats.headshots"));
        guiSetText(ucp.label[7],"Total murders: "..getElementData(localPlayer,"stats.murders"));
        guiSetText(ucp.label[8],"Total bandits killed: "..getElementData(localPlayer,"stats.banditskilled"));
        guiSetText(ucp.label[9],"Total deaths: "..getElementData(localPlayer,"stats.deaths"));
        guiSetText(ucp.label[11],"Total play time: "..days.." Days "..hours.." Hours "..minutes.." Minutes");
        guiSetText(ucp.label[12],"Joined: "..time.monthday.." "..monthToName[time.month].." "..time.year);
    end
end,5000,0);

addEventHandler("onClientGUIClick",resourceRoot,function()
    for i=6,#ucp.staticimage do
        guiSetAlpha(ucp.staticimage[i],0.025);
        if (source == ucp.staticimage[i]) then
            if (i == 6) then
                guiSetAlpha(ucp.staticimage[i],0.2);
                replaceCrosshair(crosshair_shader,crosshair[1]);
                setting_crosshair = 1;
            elseif (i == 7) then
                guiSetAlpha(ucp.staticimage[i],0.2);
                replaceCrosshair(crosshair_shader,crosshair[2]);
                setting_crosshair = 2;
            elseif (i == 8) then
                guiSetAlpha(ucp.staticimage[i],0.2);
                replaceCrosshair(crosshair_shader,crosshair[3]);
                setting_crosshair = 3;
            elseif (i == 9) then
                guiSetAlpha(ucp.staticimage[i],0.2);
                replaceCrosshair(crosshair_shader,crosshair[4]);
                setting_crosshair = 4;
            elseif (i == 10) then
                guiSetAlpha(ucp.staticimage[i],0.2);
                replaceCrosshair(crosshair_shader,crosshair[5]);
                setting_crosshair = 5;
            end
        end
    end
    if (source == ucp.checkbox[1]) then
        if (guiCheckBoxGetSelected(source)) then
            setElementData(localPlayer,"setting.weaponhud",true);
            setting_weaponhud = true;
        else
            setElementData(localPlayer,"setting.weaponhud",false);
            setting_weaponhud = false;
        end
    elseif (source == ucp.checkbox[2]) then
        if (guiCheckBoxGetSelected(source)) then
            setElementData(localPlayer,"setting.debugmonitor",true);
            setting_debugmonitor = true;
        else
            setElementData(localPlayer,"setting.debugmonitor",false);
            setting_debugmonitor = false;
        end
    elseif (source == ucp.checkbox[3]) then
        if (guiCheckBoxGetSelected(source)) then
            setElementData(localPlayer,"setting.fps",true);
            setting_fps = true;
        else
            setElementData(localPlayer,"setting.fps",false);
            setting_fps = false;
        end
    elseif (source == ucp.checkbox[4]) then
        if (guiCheckBoxGetSelected(source)) then
            setElementData(localPlayer,"setting.lookbehind",true);
            setting_lookbehind = true;
            toggleControl("look_behind",true)
        else
            setElementData(localPlayer,"setting.lookbehind",false);
            setting_lookbehind = false;
            toggleControl("look_behind",false)
        end
    elseif (source == ucp.radiobutton[1]) then
        if (guiRadioButtonGetSelected(source)) then
            setElementData(localPlayer,"setting.servertheme",1);
            setting_servertheme = 1;
        end
    elseif (source == ucp.radiobutton[2]) then
        if (guiRadioButtonGetSelected(source)) then
            setElementData(localPlayer,"setting.servertheme",2);
            setting_servertheme = 2;
        end
    elseif (source == ucp.radiobutton[3]) then
        if (guiRadioButtonGetSelected(source)) then
            setElementData(localPlayer,"setting.servertheme",3);
            setting_servertheme = 3;
        end
    end
    if (source == ucp.button[1]) then
        local old_pass = guiGetText(ucp.edit[2]);
        local new_pass = guiGetText(ucp.edit[3]);
        if (string.len(new_pass) >= 5) then
            triggerServerEvent("set_account_pass",localPlayer,old_pass,new_pass)
        else
            errorMessage("Password too short.",255,0,0);
        end
    end
end);

bindKey("F2","down",function()
    if (getElementData(localPlayer,"logedin")) then
        local visible = guiGetVisible(ucp.window[1]);
        if not (visble) then
            showCursor(not visible);
            guiSetVisible(ucp.window[1],not visible);
            killErrorMessageTimer();
        end
    end
end);