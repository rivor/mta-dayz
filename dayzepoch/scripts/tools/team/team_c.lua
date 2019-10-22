function teamsystem_gui()

	local screenW, screenH = guiGetScreenSize()
	createTeamWindow = guiCreateWindow((screenW - 366) / 2, (screenH - 242) / 2, 366, 242, "TEAM SYSTEM", false)
	guiWindowSetMovable(createTeamWindow, false)
	guiWindowSetSizable(createTeamWindow, false)
	guiSetVisible(createTeamWindow,false)

	guiSetProperty(createTeamWindow,"AlwaysOnTop","True");

	createTeamGridlist = guiCreateTabPanel(10, 28, 346, 204, false, createTeamWindow)

	createTeamTabCreateTeam = guiCreateTab("Create Team", createTeamGridlist)

	bgCREATION = guiCreateGridList(53, 43, 233, 62, false, createTeamTabCreateTeam)

	buttonCreateTeam = guiCreateButton(127, 21, 96, 31, "Create Team", false, bgCREATION)
	editboxTeamName = guiCreateEdit(10, 21, 112, 31, "", false, bgCREATION)
	labelName = guiCreateLabel(20, 6, 92, 16, "Name:", false, bgCREATION)

	labelTeamCost = guiCreateLabel(63, 105, 213, 18, "Creating team will cost you 25 zKills", false, createTeamTabCreateTeam)
	guiLabelSetHorizontalAlign(labelTeamCost, "center", false)
	guiLabelSetVerticalAlign(labelTeamCost, "center")

	createTeamTabInvites = guiCreateTab("Invites", createTeamGridlist)

	buttonAcceptInvite = guiCreateButton(20, 143, 93, 26, "Accept", false, createTeamTabInvites)
	inviteListGridlist = guiCreateGridList(10, 10, 326, 128, false, createTeamTabInvites)
	guiGridListAddColumn(inviteListGridlist, "Teams", 0.9)
	guiSetProperty(inviteListGridlist, "SortSettingEnabled", "False")
	buttonDeclineInvite = guiCreateButton(118, 143, 93, 26, "Decline", false, createTeamTabInvites)





	local screenW, screenH = guiGetScreenSize()
	teamWindow = guiCreateWindow((screenW - 465) / 2, (screenH - 335) / 2, 465, 335, "TEAM SYSTEM", false)
	guiWindowSetMovable(teamWindow, false)
	guiWindowSetSizable(teamWindow, false)
	guiSetVisible(teamWindow, false)

	errorMessageText = guiCreateLabel(266, 23, 184, 27, "", false, teamWindow)
	guiLabelSetHorizontalAlign(errorMessageText, "right", false)
	guiLabelSetVerticalAlign(errorMessageText, "center")   

	tabpanel = guiCreateTabPanel(10, 28, 445, 297, false, teamWindow)

	tabpanelManageTeam = guiCreateTab("Manage Team", tabpanel)

	teamGridlist = guiCreateGridList(7, 8, 251, 257, false, tabpanelManageTeam)
	guiGridListSetSortingEnabled (teamGridlist, false)
	guiGridListAddColumn(teamGridlist, "Player", 0.57)
	guiGridListAddColumn(teamGridlist, "Rank", 0.31)
	buttonPromote = guiCreateButton(266.5, 8, 167, 29, "Change Member's Rank", false, tabpanelManageTeam)
	buttonKick = guiCreateButton(266.5, 43, 167, 29, "Kick Member", false, tabpanelManageTeam)
	buttonDisband = guiCreateButton(266.5, 78, 167, 29, "Disband Team", false, tabpanelManageTeam)
	buttonLeave = guiCreateButton(266.5, 113, 167, 29, "Leave", false, tabpanelManageTeam)

	buttonInvitePanel = guiCreateButton(166, 225, 75, 22, "Invite", false, teamGridlist)

	promoteWindow = guiCreateWindow((screenW - 135) / 2, (screenH - 157) / 2, 135, 157, "Change Rank", false)
	guiWindowSetMovable(promoteWindow, false)
	guiWindowSetSizable(promoteWindow, false)
	guiSetProperty(promoteWindow, "AlwaysOnTop", "True")
	guiSetVisible(promoteWindow, false)

	guiSetProperty(promoteWindow,"AlwaysOnTop","True");

	promoteGridlist = guiCreateGridList(9, 24, 117, 94, false, promoteWindow)
	guiGridListAddColumn(promoteGridlist, "Ranks", 0.8)
	for i = 1, 3 do
	    guiGridListAddRow(promoteGridlist)
	end
	guiGridListSetItemText(promoteGridlist, 0, 1, "set_member", false, false)
	guiGridListSetItemText(promoteGridlist, 1, 1, "set_trusted", false, false)
	guiGridListSetItemText(promoteGridlist, 2, 1, "set_officer", false, false)
	guiSetProperty(promoteGridlist, "SortSettingEnabled", "False")
	buttonWindowPromote = guiCreateButton(10, 118, 84, 29, "CHANGE", false, promoteWindow)
	buttonWindowPromoteClose = guiCreateButton(94, 118, 32, 29, "X", false, promoteWindow)    

	invitePanel = guiCreateWindow((screenW - 272) / 2, (screenH - 259) / 2, 272, 259, "Invite Panel", false)
	guiSetVisible(invitePanel,false)
	guiWindowSetMovable(invitePanel, false)
	guiWindowSetSizable(invitePanel, false)
	guiSetProperty(invitePanel, "AlwaysOnTop", "True")

	teamInviteGridlist = guiCreateGridList(10, 27, 252, 193, false, invitePanel)
	guiGridListSetSortingEnabled (teamInviteGridlist, false)
	guiGridListAddColumn(teamInviteGridlist, "Player", 0.57)
	guiGridListAddColumn(teamInviteGridlist, "Invited", 0.31)
	buttonInvite = guiCreateButton(10, 224, 170, 25, "Send/Revoke Invitation", false, invitePanel)
	buttonInviteClose = guiCreateButton(186, 224, 76, 25, "close", false, invitePanel)

	confirmActionWindow = guiCreateWindow((screenW - 148) / 2, (screenH - 90) / 2, 148, 90, "Confirm Action", false)
	guiWindowSetMovable(confirmActionWindow, false)
	guiWindowSetSizable(confirmActionWindow, false)
	guiSetProperty(confirmActionWindow, "AlwaysOnTop", "True")
	guiSetVisible(confirmActionWindow, false)

	guiSetProperty(confirmActionWindow,"AlwaysOnTop","True");

	labelConfirmAction = guiCreateLabel(10, 20, 128, 33, "Are you sure?", false, confirmActionWindow)
	guiLabelSetHorizontalAlign(labelConfirmAction, "center", false)
	guiLabelSetVerticalAlign(labelConfirmAction, "center")
	buttionConfirmActionYes = guiCreateButton(10, 53, 62, 27, "Yes", false, confirmActionWindow)
	buttonConfirmActionNo = guiCreateButton(76, 53, 62, 27, "No", false, confirmActionWindow)    

	tabpanelInvite = guiCreateTab("All Teams", tabpanel)

	allTeamList = guiCreateGridList(7, 8, 430, 257, false, tabpanelInvite)
	guiGridListSetSortingEnabled (allTeamList, false)
	guiGridListAddColumn(allTeamList, "Team", 0.4)
	guiGridListAddColumn(allTeamList, "Leader", 0.35)
	guiGridListAddColumn(allTeamList, "Slots", 0.15)

	tabpanelHelp = guiCreateTab("Help", tabpanel)

	helpText = guiCreateMemo(7, 8, 430, 257, "Here you can create team and invite your friends in it to play and fight together. :) \n\nTo chat in team chat press 'Y' or '/teamchat text' \n\nRank 'Member' can only talk in team chat and leave team. \n\nRank 'Trusted' or higher is for members who will be able to access your base with /open or /close if you have one, but if you don't have one you can purchase it by contacting owner. \n\nRank 'Officer' can kick and invite people to team.", false, tabpanelHelp)
	guiSetProperty(helpText,"Disabled","True")

	labelTeam = guiCreateLabel(268, 243, 167, 15, "Team: N/A", false, tabpanelManageTeam)
	labelLeader = guiCreateLabel(268, 224, 167, 15, "Leader: N/A", false, tabpanelManageTeam)
	labelRank = guiCreateLabel(268, 205, 167, 15, "Rank: N/A", false, tabpanelManageTeam)

	--baseTab = guiCreateTab("Base", tabpanel)
end
addEventHandler("onClientResourceStart", root, teamsystem_gui)

bindKey("y", "down", "chatbox", "teamchat");

addEvent("gang.recive:datatable", true);
addEvent("gang.update:client", true);
addEvent("gang.close", true);
addEvent("gang.refreshInviteList", true);

addEventHandler("gang.recive:datatable", root, function(data)
	if data then
		updateTeamInfo(data);
	end
end);

addEventHandler("gang.update:client", root, function()
	if guiGetVisible(teamWindow) then
		triggerServerEvent("gang.request:datatable", localPlayer);
	end
end);

addEventHandler("gang.close", root, function()
	guiSetVisible(createTeamWindow, false);
	guiSetVisible(teamWindow, false);
	showCursor(false);
end);

addEventHandler("gang.refreshInviteList", root, function()
	updateInviteInfo()
end);

function killErrorMessageTimer()
	if isTimer(errorMessageTimer) then
		killTimer(errorMessageTimer)
		guiSetText(errorMessageText,"")
		guiSetAlpha(errorMessageText,1)
	end
end

function errorMessage(text,r,g,b)
	if (text) then
		guiSetText(errorMessageText,text)
		guiLabelSetColor(errorMessageText,r,g,b)
		if isTimer(errorMessageTimer) then
			killTimer(errorMessageTimer)
			guiSetAlpha(errorMessageText,1)
			errorMessageTimer = setTimer(removeErrorMessage,275,15)
		else
			function removeErrorMessage()
				if (guiGetAlpha(errorMessageText) > 0.30) then
					guiSetAlpha(errorMessageText,guiGetAlpha(errorMessageText)-0.05)
				elseif (guiGetAlpha(errorMessageText) < 0.30) then
					if isTimer(errorMessageTimer) then killTimer(errorMessageTimer) end
					guiSetText(errorMessageText,"")
					guiSetAlpha(errorMessageText,1)
				end
			end
			errorMessageTimer = setTimer(removeErrorMessage,275,15)
		end
	end
end

addEventHandler("onClientGUIClick", resourceRoot, function()
	if (source == buttonCreateTeam) then
		local teamname = guiGetText(editboxTeamName)
		local player = localPlayer
		if (teamname ~= "") then
			triggerServerEvent("creategang", localPlayer, player, teamname);
		end
	elseif (source == buttonAcceptInvite) then
		if not (guiGridListGetSelectedItem(inviteListGridlist) == -1) then
			local team = guiGridListGetItemText(inviteListGridlist, guiGridListGetSelectedItem(inviteListGridlist), 1)
			if team and team ~= "no invites" then
				triggerServerEvent("team_accept", localPlayer, localPlayer, team);
			end
		end
	elseif (source == buttonDeclineInvite) then
		if not (guiGridListGetSelectedItem(inviteListGridlist) == -1) then
			local team = guiGridListGetItemText(inviteListGridlist, guiGridListGetSelectedItem(inviteListGridlist), 1)
			if team and team ~= "no invites" then
				triggerServerEvent("team_decline", localPlayer, localPlayer, team);
			end
		end
	elseif (source == buttonPromote) then
		if not (guiGridListGetSelectedItem(teamGridlist) == -1) then
			if (getPlayerTeamRank(localPlayer) == "Leader") then
				guiSetVisible(promoteWindow,true)
			end
		else
			errorMessage("Select a member to change rank.",200,0,0)
		end
	elseif (source == buttonWindowPromote) then
		if (getPlayerTeamRank(localPlayer) == "Leader") then
			if not (guiGridListGetSelectedItem(teamGridlist) == -1) then
				if not (guiGridListGetSelectedItem(promoteGridlist) == -1) then
					local rank = guiGridListGetItemText(promoteGridlist, guiGridListGetSelectedItem(promoteGridlist), 1)
					local playername = guiGridListGetItemText(teamGridlist, guiGridListGetSelectedItem(teamGridlist), 1)
					local player = getPlayerFromName(playername);
					if (getPlayerTeamRank(player) ~= "Leader") then
						if (type(rank) == "string" and player ~= "") then
							triggerServerEvent("gang.question", localPlayer, rank, player, playername);
							guiSetVisible(promoteWindow,false)
						end
					else
						errorMessage("You can't change your own rank.",200,0,0)
					end
				else
					errorMessage("Select a rank to change.",200,0,0)
				end
			else
				errorMessage("Select a member to change rank.",200,0,0)
			end
		end
	elseif (source == buttonWindowPromoteClose) then
		guiSetVisible(promoteWindow,false)
	elseif (source == buttonKick) then
		if (getPlayerTeamRank(localPlayer) == "Leader" or getPlayerTeamRank(localPlayer) == "Officer") then
			if not (guiGridListGetSelectedItem(teamGridlist) == -1) then
				local playername = guiGridListGetItemText(teamGridlist, guiGridListGetSelectedItem(teamGridlist), 1);
				local player = getPlayerFromName(playername);
				if (getPlayerTeamRank(player) ~= "Leader") then
					guiSetVisible(confirmActionWindow,true)
					setElementData(localPlayer,"gang.question.1","kick")
					setElementData(localPlayer,"gang.question.2",player)
					setElementData(localPlayer,"gang.question.3",playername)
				else
					errorMessage("You can't kick yourself!",200,0,0)
				end
			else
				errorMessage("Select a member to kick.",200,0,0)
			end
		end
	elseif (source == buttonDisband) then
		if (getPlayerTeamRank(localPlayer) == "Leader") then
			guiSetVisible(confirmActionWindow,true)
			setElementData(localPlayer,"gang.question.1","disband_team")
		end
	elseif (source == buttonLeave) then
		if (getPlayerTeamRank(localPlayer) ~= "Leader") then
			guiSetVisible(confirmActionWindow,true)
			setElementData(localPlayer,"gang.question.1","leave")
		else
			errorMessage("You can't leave being Leader.",200,0,0)
		end
	elseif (source == buttonInvitePanel) then
		guiSetVisible(invitePanel,true);
	elseif (source == buttonInviteClose) then
		guiSetVisible(invitePanel,false);
	elseif (source == buttonInvite) then
		if (getPlayerTeamRank(localPlayer) == "Leader" or getPlayerTeamRank(localPlayer) == "Officer") then
			if not (guiGridListGetSelectedItem(teamInviteGridlist) == -1) then
				local val = guiGridListGetItemText(teamInviteGridlist, guiGridListGetSelectedItem(teamInviteGridlist), 1);
				if (val == "no one to invite") then return; end
				local player = getPlayerFromName(guiGridListGetItemData(teamInviteGridlist, guiGridListGetSelectedItem(teamInviteGridlist), 1));
				if player then
					triggerServerEvent("gang.question", localPlayer, "invite", player);
				end
			end
		end
	elseif (source == buttionConfirmActionYes) then
		actionYes()
	elseif (source == buttonConfirmActionNo) then
		actionNo()
	end
end);

function actionYes()
	local arg1 = getElementData(localPlayer, "gang.question.1");
	local arg2 = getElementData(localPlayer, "gang.question.2") or "-";
	local arg3 = getElementData(localPlayer, "gang.question.3") or "-";
	if (type(arg1) == "string" and arg1 ~= "") then
		triggerServerEvent("gang.question", localPlayer, arg1, arg2, arg3);
		actionNo();
	end
end

function actionNo()
	guiSetVisible(confirmActionWindow, false);
	setElementData(localPlayer, "gang.question.1", nil);
	setElementData(localPlayer, "gang.question.2", nil);
	setElementData(localPlayer, "gang.question.3", nil);
end

function guiGridListGetSelectedItemText(gridList,column)
	local item = guiGridListGetSelectedItem ( gridList );
	if item then
	    return guiGridListGetItemText ( gridList, item, column or 1 );
	end
	return false
end

function getPlayerGang(player)
	if player then
		return getElementData(player, "gang") or "None";
	end
	return false;
end

function getPlayerTeamRank(player)
	if player then
		return getElementData(player, "gang.rank") or false;
	end
	return false;
end

function refreshPlayerInvites()
    triggerServerEvent("refreshPlayerInvite",getLocalPlayer())
end

function updatePlayerInvites(invitations)
    guiGridListClear(inviteListGridlist)
    for _,v in ipairs(invitations) do
    	local player,team = unpack(v)
    	if (player == localPlayer) then
	    	local row = guiGridListAddRow(inviteListGridlist)
	    	guiGridListSetItemText(inviteListGridlist, row, 1, team, false, false )
	    end
	end
	if (guiGridListGetRowCount(inviteListGridlist) == 0) then
		local row = guiGridListAddRow(inviteListGridlist)
		guiGridListSetItemText(inviteListGridlist, row, 1, "no invites", false, false )
    end
end
addEvent("updatePlayerInvites",true)
addEventHandler("updatePlayerInvites",getRootElement(),updatePlayerInvites)

function getTeamList()
	triggerServerEvent("receiveTeamList",localPlayer)
end
addEvent("getTeamList",true)
addEventHandler("getTeamList",root,getTeamList)

function recieveTeamList(teams)
	guiGridListClear(allTeamList)
	for _,value in ipairs(teams) do
		local row = guiGridListAddRow(allTeamList)
		guiGridListSetItemText(allTeamList, row, 1, value["name"], false, false)
		guiGridListSetItemText(allTeamList, row, 2, value["leader"], false, false)
		triggerServerEvent("getPlayersFromGangss",localPlayer,value["name"],row)
		function getInfoCellBackss(players,roww)
			guiGridListSetItemText(allTeamList, roww, 3, players.."/"..value["slots"], false, false)
		end
		addEvent("getInfoCellBackss",true)
		addEventHandler("getInfoCellBackss",root,getInfoCellBackss)
	end
	if (guiGridListGetRowCount(allTeamList) == 0) then
		local row = guiGridListAddRow(allTeamList)
		guiGridListSetItemText(allTeamList, row, 1, "no teams in database", false, false )
    end
end
addEvent("recieveTeamList",true)
addEventHandler("recieveTeamList",root,recieveTeamList)

function updateInviteInfo()
	guiGridListClear(teamInviteGridlist);
	for _,v in ipairs(getElementsByType("player")) do
		if (getPlayerGang(v) == "None" and v ~= localPlayer) then
			local row = guiGridListAddRow(teamInviteGridlist);
			local playerName = getPlayerName(v):gsub("#%x%x%x%x%x%x", "")
			local invited = getElementData(v,"gangteams."..getPlayerGang(localPlayer)) or "No"
			guiGridListSetItemText(teamInviteGridlist, row, 1, playerName, false, false);
			guiGridListSetItemText(teamInviteGridlist, row, 2, invited, false, false);
			guiGridListSetItemData(teamInviteGridlist, row, 1, getPlayerName(v));
			if invited == "Yes" then
				guiGridListSetItemColor(teamInviteGridlist, row, 2, 0, 255, 0)
			elseif invited == "No" then
				guiGridListSetItemColor(teamInviteGridlist, row, 2, 255, 0, 0)
			end
		end
	end
	if (guiGridListGetRowCount(teamInviteGridlist) == 0) then
		local row = guiGridListAddRow(teamInviteGridlist)
		guiGridListSetItemText(teamInviteGridlist, row, 1, "no one to invite", false, false )
		guiGridListSetItemText(teamInviteGridlist, row, 2, " ", false, false )
    end
end

function updateTeamInfo(data)
	guiGridListClear(teamGridlist);
	if (#data > 0) then
		for _,v in ipairs(data) do
			local row = guiGridListAddRow(teamGridlist);
			guiGridListSetItemText(teamGridlist, row, 1, v[1]:gsub("#%x%x%x%x%x%x", ""), false, false);
			if (v[3] == 1) then
				guiGridListSetItemColor(teamGridlist, row, 1, 0, 255, 0);
				guiSetText(labelLeader,"Leader: "..v[1]:gsub("#%x%x%x%x%x%x", ""))
			else
				guiGridListSetItemColor(teamGridlist, row, 1, 255, 0, 0);
			end
			guiGridListSetItemText(teamGridlist, row, 2, v[2], false, false);
		end
		guiSetText(labelTeam,"Team: "..getPlayerGang(localPlayer))
		guiSetText(labelRank,"Rank: "..getPlayerTeamRank(localPlayer))
		if (getPlayerTeamRank(localPlayer) == "Member") then
			guiSetEnabled(buttonPromote,false)
			guiSetEnabled(buttonKick,false)
			guiSetEnabled(buttonDisband,false)
			guiSetEnabled(buttonLeave,true)
			guiSetEnabled(buttonInvite,false)
			guiSetEnabled(buttonInvitePanel,false)
		elseif (getPlayerTeamRank(localPlayer) == "Trusted") then
			guiSetEnabled(buttonPromote,false)
			guiSetEnabled(buttonKick,false)
			guiSetEnabled(buttonDisband,false)
			guiSetEnabled(buttonLeave,true)
			guiSetEnabled(buttonInvite,false)
			guiSetEnabled(buttonInvitePanel,false)
		elseif (getPlayerTeamRank(localPlayer) == "Officer") then
			guiSetEnabled(buttonPromote,false)
			guiSetEnabled(buttonKick,true)
			guiSetEnabled(buttonDisband,false)
			guiSetEnabled(buttonLeave,true)
			guiSetEnabled(buttonInvite,true)
			guiSetEnabled(buttonInvitePanel,true)
		elseif (getPlayerTeamRank(localPlayer) == "Leader") then
			guiSetEnabled(buttonPromote,true)
			guiSetEnabled(buttonKick,true)
			guiSetEnabled(buttonDisband,true)
			guiSetEnabled(buttonLeave,false)
			guiSetEnabled(buttonInvite,true)
			guiSetEnabled(buttonInvitePanel,true)
		end
	end
end

function antispam()
	if (getElementData(localPlayer,"antispam")) then
		outputChatBox(getLanguageTextClient("clientinfotext44"), 160, 40, 40);
		return false;
	else
		setElementData(localPlayer,"antispam",true)
		setTimer(setElementData, 1000, 1, localPlayer, "antispam", false);
		return true;
	end
end

function openTeamSystem(key, keyState)
	if (getElementData(localPlayer,"logedin")) then
		if (keyState == "down") then
			if (getPlayerGang(localPlayer) == "None") then
				if guiGetVisible(createTeamWindow) == false then
					if not antispam() then return; end
					guiSetVisible(createTeamWindow, true)
					guiSetVisible(teamWindow, false)
					refreshPlayerInvites();
					guiSetInputMode("no_binds_when_editing")  
					showCursor(true)
				else
					guiSetInputMode("allow_binds")
					guiSetVisible(createTeamWindow, false)
					showCursor(false)
				end
			else
				if guiGetVisible(teamWindow) == false then
					if not antispam() then return; end
					triggerServerEvent("gang.request:datatable", localPlayer);
					guiSetVisible(createTeamWindow, false)
					guiSetVisible(teamWindow, true)
					updateInviteInfo();
					getTeamList();
					guiSetInputMode("no_binds_when_editing")  
					showCursor(true)
				else
					guiSetVisible(teamWindow, false)
					guiSetVisible(promoteWindow, false)
					guiSetVisible(invitePanel,false)
					actionNo()
					killErrorMessageTimer();
					guiSetInputMode("allow_binds")
					showCursor(false)
				end
			end
		end
	end
end
bindKey("f1", "down", openTeamSystem)

setTimer(function()
	local nr = 0;
	playerBlibs = {};
	for _,v in ipairs(playerBlibs) do
		if isElement(v) then
			destroyElement(v);
		end
	end
	if getElementData(localPlayer, "logedin") then
		local gang = getPlayerGang(localPlayer);
		if (gang == "None") then return; end
		for _,v in pairs(getElementsByType("player")) do
			if getElementData(v, "logedin") then
				if (getPlayerGang(v) == gang and v ~= localPlayer) then
					nr = nr + 1;
					playerBlibs[nr] = createBlipAttachedTo(v, 2, 2, 0, 255, 0);
					setBlipVisibleDistance(playerBlibs[nr], 1000);
				end
			end
		end
	end
end, 10000, 0);