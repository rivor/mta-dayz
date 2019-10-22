login = {window={},button = {},edit={},label = {}};
local register = {window={},button = {},edit={},label = {}};
local logedin = {window={},button = {},edit={},label = {}};
local errortext = {grid={},button={},label = {}};
local language = {window={},staticimage={},combobox={},label={}};

local sW, sH = guiGetScreenSize();

login.window[1] = guiCreateWindow(sW*0.320, sH*0.384, 243, 152, "Please, sign in to continue!", false)
guiWindowSetMovable(login.window[1], false)
guiWindowSetSizable(login.window[1], false)

login.label[1] = guiCreateLabel(16, 25, 211, 15, "Username:", false, login.window[1])
login.edit[1] = guiCreateEdit(10, 40, 224, 24, "", false, login.window[1])
guiEditSetMaxLength(login.edit[1], 100)
login.button[1] = guiCreateButton(10, 114, 107, 29, "Sign In", false, login.window[1])
login.button[2] = guiCreateButton(127, 114, 107, 29, "> register?", false, login.window[1])
login.label[2] = guiCreateLabel(16, 68, 211, 15, "Password:", false, login.window[1])
login.edit[2] = guiCreateEdit(9, 83, 224, 24, "", false, login.window[1])
guiEditSetMasked(login.edit[2], true)
guiEditSetMaxLength(login.edit[2], 100)

guiSetVisible(login.window[1],false);


register.window[1] = guiCreateWindow(sW*0.320, sH*0.384, 243, 237, "Register your account.", false)
guiWindowSetMovable(register.window[1], false)
guiWindowSetSizable(register.window[1], false)

register.label[1] = guiCreateLabel(16, 25, 211, 15, "Username:", false, register.window[1])
register.edit[1] = guiCreateEdit(10, 40, 224, 24, "", false, register.window[1])
register.label[2] = guiCreateLabel(16, 68, 211, 15, "E-Mail:", false, register.window[1])
register.edit[2] = guiCreateEdit(9, 83, 224, 24, "", false, register.window[1])
guiEditSetMaxLength(register.edit[2], 100)
register.label[3] = guiCreateLabel(16, 110, 211, 15, "Password:", false, register.window[1])
register.edit[3] = guiCreateEdit(10, 125, 224, 24, "", false, register.window[1])
guiEditSetMasked(register.edit[3], true)
guiEditSetMaxLength(register.edit[3], 100)
register.label[4] = guiCreateLabel(16, 153, 211, 15, "Password 2x:", false, register.window[1])
register.edit[4] = guiCreateEdit(10, 168, 224, 24, "", false, register.window[1])
guiEditSetMasked(register.edit[4], true)
guiEditSetMaxLength(register.edit[4], 100)
register.button[1] = guiCreateButton(10, 198, 107, 29, "Register", false, register.window[1])
register.button[2] = guiCreateButton(127, 198, 107, 29, "> back?", false, register.window[1])

guiSetVisible(register.window[1],false);

--[[logedin.window[1] = guiCreateWindow(sW*0.320, sH*0.384, 243, 163, "Welcome, kaasis!", false)
guiWindowSetMovable(logedin.window[1], false)
guiWindowSetSizable(logedin.window[1], false)

logedin.label[1] = guiCreateLabel(20, 25, 207, 15, "Main:", false, logedin.window[1])
guiSetFont(logedin.label[1], "default-bold-small")
logedin.button[1] = guiCreateButton(10, 40, 223, 48, "Play Game", false, logedin.window[1])
logedin.label[2] = guiCreateLabel(20, 94, 207, 15, "Other:", false, logedin.window[1])
guiSetFont(logedin.label[2], "default-bold-small")
logedin.button[2] = guiCreateButton(10, 109, 107, 38, "Settings", false, logedin.window[1])
logedin.button[3] = guiCreateButton(126, 109, 107, 38, "Quit", false, logedin.window[1])
guiSetVisible(logedin.window[1],false);

logedin.window[2] = guiCreateWindow(sW*0.320, sH*0.6, 243, 125, "MOTD", false)
guiWindowSetMovable(logedin.window[2], false)
guiWindowSetSizable(logedin.window[2], false)

logedin.label[3] = guiCreateLabel(10, 24, 223, 73, "Hello there! You're always welcome here and in any time. If you have any type of suggestion or want to report something, go ahead and do it through /report or through our forums.", false, logedin.window[2])
guiLabelSetHorizontalAlign(logedin.label[3], "left", true)
logedin.label[4] = guiCreateLabel(10, 102, 223, 15, "Server Version: v0.3 alpha1 release1", false, logedin.window[2])
guiSetFont(logedin.label[4], "default-bold-small")

guiSetVisible(logedin.window[2],false);]]

language.window[1] = guiCreateWindow(0, 0, 243, 75, "Choose Language", false)
language.staticimage[1] = guiCreateStaticImage(0, 0, 243, 152, "empty.png", false)
language.staticimage[2] = guiCreateStaticImage(15, 25, 140, 140, "logo.png", false)
guiSetProperty(language.staticimage[1], "AlwaysOnTop", "True");
--guiWindowSetSizable(language.window[1], false)

language.label[1] = guiCreateLabel(16, 25, 211, 15, "Language:", false, language.staticimage[1])
guiSetFont(language.label[1], "default-bold-small")
language.combobox[1] = guiCreateComboBox(10, 40, 223, 102, "", false, language.staticimage[1])

local languages = {
    en = "English",
    lv = "Latviešu",
    ru = "Русский",
}

addEventHandler("onClientResourceStart",resourceRoot,function()
    if (languages) then
        local num=0;
        for i,v in pairs(languages) do
            guiComboBoxAddItem(language.combobox[1],v)
            if i == getElementData(localPlayer,"language") then
                guiComboBoxSetSelected(language.combobox[1],num);
            end
            num = num+1;
        end
    end
end);

function getLang(langid)
    for i,v in pairs(languages) do
        local language = guiComboBoxGetItemText(language.combobox[1],langid)
        if (language == v) then
            return i;
        end
    end
end

guiSetVisible(language.window[1],false)
guiSetVisible(language.staticimage[1],false)
guiSetVisible(language.staticimage[2],false)

local lX,lY = guiGetPosition(login.window[1],false);

errortext.grid[1] = guiCreateGridList(lX, lY-42, 243, 38, false)
guiSetAlpha(errortext.grid[1], 0.80)

errortext.label[1] = guiCreateLabel(10, 6, 188, 21, "", false, errortext.grid[1])
guiLabelSetVerticalAlign(errortext.label[1], "center")
errortext.button[1] = guiCreateButton(203, 6, 30, 26, "OK", false, errortext.grid[1])

guiSetVisible(errortext.grid[1],false);

addEventHandler("onClientResourceStart",resourceRoot,function()
    if (not getElementData(localPlayer, "logedin")) then
        setCameraMatrix (-1440.9035644531,-1506.8837890625,79.716201782227,-1500)
        loginped = createPed(73,-1440,-1503.599609375,79.699996948242,157.994018)
        setPedAnimation(loginped,"DEALER","DEALER_IDLE")
        setElementRotation(localPlayer,180,5,0)
        setPlayerHudComponentVisible("radar",false)
        fadeCamera(true)
        showChat(false)
        showCursor(true)
        guiSetVisible(login.window[1],true)
        guiSetVisible(language.window[1],true)
        guiSetVisible(language.staticimage[1],true)
        guiSetVisible(language.staticimage[2],true)
        local nX, nY = guiGetPosition(login.window[1],false);
        local nW, nH = guiGetSize(login.window[1],false);
        guiSetPosition(language.window[1], nX, nY+nH+4, false);
        guiSetPosition(language.staticimage[1], nX, nY+nH+4, false);
    end
end);

addEventHandler("onClientGUIClick",resourceRoot,function()
    if (source == login.button[1]) then
        clientSubmitLogin()
    elseif (source == login.button[2]) then
        guiSetVisible(login.window[1],false);
        guiSetVisible(register.window[1],true);
        local nX, nY = guiGetPosition(register.window[1],false);
        local nW, nH = guiGetSize(register.window[1],false);
        guiSetPosition(language.window[1], nX, nY+nH+4, false);
        guiSetPosition(language.staticimage[1], nX, nY+nH+4, false);
    elseif (source == register.button[1]) then
        clientSubmitRegister()
    elseif (source == register.button[2]) then
        guiSetVisible(login.window[1],true);
        guiSetVisible(register.window[1],false);
        local nX, nY = guiGetPosition(login.window[1],false);
        local nW, nH = guiGetSize(login.window[1],false);
        guiSetPosition(language.window[1], nX, nY+nH+4, false);
        guiSetPosition(language.staticimage[1], nX, nY+nH+4, false);
    elseif (source == errortext.button[1]) then
        guiSetVisible(errortext.grid[1],false);
    end
end);

function seterror(text)
    guiSetText(errortext.label[1],text)
    guiLabelSetColor(errortext.label[1],200,50,50)
    guiSetVisible(errortext.grid[1],true)
end
addEvent("seterror",true)
addEventHandler("seterror",root,seterror)

function clientSubmitLogin()
    local username = guiGetText(login.edit[1])
    local password = guiGetText(login.edit[2])
    local langid = guiComboBoxGetSelected(language.combobox[1])
    if (username ~= "" and password ~= "") then
        triggerServerEvent("submitLogin",localPlayer,localPlayer,username,password,getLang(langid))
    else
        seterror("Fields are empty!")
    end
end

function clientSubmitRegister()
    local username = guiGetText(register.edit[1])
    local email = guiGetText(register.edit[2])
    local password = guiGetText(register.edit[3])
    local password2 = guiGetText(register.edit[4])
    local langid = guiComboBoxGetSelected(language.combobox[1])
    if (string.len(username) >= 5 and string.len(email) >= 5 and string.find(email,"@") and string.len(password) >= 5 and password == password2) then
        triggerServerEvent("submitRegister",localPlayer,localPlayer,username,password,email,getLang(langid))
    else
        seterror("Username or password too short.")
    end
end

function loginSuccess()
    guiSetVisible(login.window[1],false)
    guiSetVisible(register.window[1],false)
    guiSetVisible(errortext.grid[1],false)
    --guiSetVisible(logedin.window[1],false)
    --guiSetVisible(logedin.window[2],false)
    guiSetVisible(language.window[1],false)
    guiSetVisible(language.staticimage[1],false)
    guiSetVisible(language.staticimage[2],false)
    destroyElement(loginped)
    showCursor(false)
    showChat(true)
end
addEvent("loginSuccess",true)
addEventHandler("loginSuccess",root,loginSuccess)

function lowScreenWarn()
    local x,y = guiGetScreenSize();
    if (x < 1024) and (y < 768) then
        outputChatBox("WARNING: YOUR SCREEN RESOLUTION IS TOO LOW, SOME GUI PLACEMENT MAY BE WRONGLY POSITIONED!",200,10,10);
    end
end
addEvent("lowScreenWarn",true)
addEventHandler("lowScreenWarn",root,lowScreenWarn)