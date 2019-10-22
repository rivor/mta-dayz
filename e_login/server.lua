aclReload()

function loginHandler(player,username,password,language)
	local account = getAccount(username,password)
	if account then
		setElementData(player,"language",language)
		triggerClientEvent(player,"loginSuccess",player)
		triggerClientEvent(player,"lowScreenWarn",player);
		logIn(player,account,password)
		triggerEvent("onPlayerDayZLogin",player,player)
	elseif not account then
		triggerClientEvent(player,"seterror",player,"Password is incorrect.")
	end
end
addEvent("submitLogin",true)
addEventHandler("submitLogin",root,loginHandler)

function registerHandler(player,username,password,email,language)
	local account = addAccount(username,password)
	if account then
		setElementData(player,"language",language)
		triggerClientEvent(player,"loginSuccess",player)
		triggerClientEvent(player,"lowScreenWarn",player);
		logIn(player,account,password)
		triggerEvent("onPlayerDayZRegister",root,player,email)
	elseif not account then
		triggerClientEvent(player,"seterror",player,"account already exists.")
	end
end
addEvent("submitRegister",true)
addEventHandler("submitRegister",root,registerHandler)

function set_account_pass(old_pass,new_pass)
	local account = getAccount(getAccountName(getPlayerAccount(source)),old_pass);
	if (account) then
		setAccountPassword(account,new_pass)
		triggerClientEvent(source,"settingsErrorMessage",source,"Password changed.",0,255,0)
	else
		triggerClientEvent(source,"settingsErrorMessage",source,"Old password incorrect.",255,0,0)
	end
end
addEvent("set_account_pass",true)
addEventHandler("set_account_pass",root,set_account_pass)

addEventHandler("onPlayerLogin",root,function()
	setElementData(source,"setting.weaponhud",getElementData(source,"setting.weaponhud"));
    setElementData(source,"setting.debugmonitor",getElementData(source,"setting.debugmonitor"));
    setElementData(source,"setting.fps",getElementData(source,"setting.fps"));
    setElementData(source,"setting.servertheme",getElementData(source,"setting.servertheme"));
end)