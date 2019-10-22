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

-- THESE CAN BE CHANGED
triggerKey = "tab" -- default button to open/close scoreboard
drawOverGUI = true -- draw scoreboard over gui?
seperationSpace = 80 -- the space between top/bottom screen and scoreboard top/bottom in pixels

-- BUT DON'T TOUCH THESE
scoreboardToggled = false
scoreboardForced = false
scoreboardDrawn = false
forceScoreboardUpdate = false
useAnimation = false
scoreboardIsToggleable = false
showServerInfo = true
showGamemodeInfo = false
showTeams = false
useColors = true
drawSpeed = 1
scoreboardScale = 1
teamHeaderFont = "clear"
contentFont = "default"
columnFont = "default-bold"
serverInfoFont = "default-bold"
rmbFont = "clear"
cBlack = tocolor( 0, 0, 0 )
cWhite = tocolor( 255, 255, 255 )
cSettingsBox = tocolor( 255, 255, 255, 150 )
MAX_PRIRORITY_SLOT = 500

scoreboardColumns = {}
resourceColumns = {}
scoreboardDimensions = { ["width"] = 0, ["height"] = 0, ["phase"] = 1, ["lastSeconds"] = 0 }
scoreboardTicks = { ["lastUpdate"] = 0, ["updateInterval"] = 500 }
scoreboardContent = {}
firstVisibleIndex = 1
sortBy = { ["what"] = "alivetime", ["dir"] = 1 } -- -1 = dec, 1 = asc
sbOutOffset, sbInOffset = 1, 1
sbFont = "clear"
sbFontScale = 0.68
serverInfo = {}
fontScale = { -- To make all fonts be equal in height
	["default"] = 1.0,
	["default-bold"] = 1.0,
	["clear"] = 1.0,
	["arial"] = 1.0,
	["sans"] = 1.0,
	["pricedown"] = 0.5,
	["bankgothic"] = 0.5,
	["diploma"] = 0.5,
	["beckett"] = 0.5
}
selectedRows = {}


defaultSettings = {
	["useanimation"] = false,
	["toggleable"] = false,
	["showserverinfo"] = true,
	["showgamemodeinfo"] = false,
	["showteams"] = false,
	["usecolors"] = true,
	["drawspeed"] = 2,
	["scale"] = 1.0,
	["columnfont"] = "default-bold",
	["contentfont"] = "default-bold",
	["teamfont"] = "clear",
	["serverinfofont"] = "default",
	["bg_color"] = {
		["r"] = 0,
		["g"] = 0,
		["b"] = 0,
		["a"] = 170
	},
	["selection_color"] = {
		["r"] = 82,
		["g"] = 103,
		["b"] = 188,
		["a"] = 170
	},
	["highlight_color"] = {
		["r"] = 255,
		["g"] = 255,
		["b"] = 255,
		["a"] = 50
	},
	["header_color"] = {
		["r"] = 100,
		["g"] = 100,
		["b"] = 100,
		["a"] = 255
	},
	["team_color"] = {
		["r"] = 100,
		["g"] = 100,
		["b"] = 100,
		["a"] = 100
	},
	["border_color"] = {
		["r"] = 100,
		["g"] = 100,
		["b"] = 100,
		["a"] = 50
	},
	["serverinfo_color"] = {
		["r"] = 150,
		["g"] = 150,
		["b"] = 150,
		["a"] = 255
	},
	["content_color"] = {
		["r"] = 255,
		["g"] = 255,
		["b"] = 255,
		["a"] = 255
	}
}

tempColors = {
	["bg_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["selection_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["highlight_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["header_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["team_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["border_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["serverinfo_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	},
	["content_color"] = {
		["r"] = nil,
		["g"] = nil,
		["b"] = nil,
		["a"] = nil
	}
}
								

addEvent( "onClientPlayerScoreboardClick" )

addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource() ), 
	function ( resource )
		cScoreboardBackground = tocolor( defaultSettings.bg_color.r, defaultSettings.bg_color.g, defaultSettings.bg_color.b, defaultSettings.bg_color.a )
		cSelection = tocolor( defaultSettings.selection_color.r, defaultSettings.selection_color.g, defaultSettings.selection_color.b, defaultSettings.selection_color.a )
		cHighlight = tocolor( defaultSettings.highlight_color.r, defaultSettings.highlight_color.g, defaultSettings.highlight_color.b, defaultSettings.highlight_color.a )
		cHeader = tocolor(255,255,255)
		cTeam = tocolor( defaultSettings.team_color.r, defaultSettings.team_color.g, defaultSettings.team_color.b, defaultSettings.team_color.a )
		cBorder = tocolor( defaultSettings.border_color.r, defaultSettings.border_color.g, defaultSettings.border_color.b, defaultSettings.border_color.a )
		cServerInfo = tocolor(255,255,255,255)
		cContent = tocolor( defaultSettings.content_color.r, defaultSettings.content_color.g, defaultSettings.content_color.b, defaultSettings.content_color.a )
		
		bindKey( triggerKey, "down", "Toggle scoreboard", "1" )
		bindKey( triggerKey, "up", "Toggle scoreboard", "0" )
		
		addEventHandler( "onClientRender", getRootElement(), drawScoreboard )
		triggerServerEvent( "onClientDXScoreboardResourceStart", getRootElement() )
		triggerServerEvent( "requestServerInfo", getRootElement() )
	end
)

addEventHandler( "onClientPlayerQuit", getRootElement(),
	function()
		selectedRows[source] = nil
	end
)

function sendServerInfo( output )
	serverInfo = output
end
addEvent( "sendServerInfo", true )
addEventHandler( "sendServerInfo", getResourceRootElement( getThisResource() ), sendServerInfo )

function toggleScoreboard( _, state )
	local logged = getElementData(localPlayer,"logedin");
	if not logged then return; end
	state = iif( state == "1", true, false )
	if scoreboardIsToggleable and state then
		scoreboardToggled = not scoreboardToggled
	elseif not scoreboardIsToggleable then
		scoreboardToggled = state
	end
end
addCommandHandler( "Toggle scoreboard", toggleScoreboard )


addCommandHandler( "scoreboard", 
	function ()
		scoreboardToggled = not scoreboardToggled
	end
)

function iif( cond, arg1, arg2 )
	if cond then
		return arg1
	end
	return arg2
end

function doDrawScoreboard( rtPass, onlyAnim, sX, sY )
	if #scoreboardColumns ~= 0 then

		--
		-- In/out animation
		--
		local currentSeconds = getTickCount() / 1000
		local deltaSeconds = currentSeconds - scoreboardDimensions.lastSeconds
		scoreboardDimensions.lastSeconds = currentSeconds
		deltaSeconds = math.clamp( 0, deltaSeconds, 1/25 )
			
		if scoreboardToggled or scoreboardForced then
			local phases = {
				[1] = {
					["width"] 		= s(10),
					["height"] 		= s(5),
					
					["incToWidth"] 	= s(10),
					["incToHeight"] = s(5),
				
					["decToWidth"] 	= 0,
					["decToHeight"] = 0
				},
				[2] = {
					["width"] 	= s(40),
					["height"] 	= s(5),
						
					["incToWidth"] 	= calculateWidth(),
					["incToHeight"] = s(5),
						
					["decToWidth"] 	= s(10),
					["decToHeight"] = s(5)
						
				},
				[3] = {
					["width"] 		= calculateWidth(),
					["height"] 		= s(30),
						
					["incToWidth"] 	= calculateWidth(),
					["incToHeight"] = calculateHeight(),
						
					["decToWidth"] 	= calculateWidth(),
					["decToHeight"] = s(5)
				}
			}
		
			if not useAnimation then
				scoreboardDimensions.width = calculateWidth()
				scoreboardDimensions.height = calculateHeight()
				scoreboardDimensions.phase = #phases
			end
			
			local maxChange = deltaSeconds * 30*drawSpeed
			local maxWidthDiff = math.clamp( -maxChange, phases[scoreboardDimensions.phase].incToWidth - scoreboardDimensions.width, maxChange )
			local maxHeightDiff = math.clamp( -maxChange, phases[scoreboardDimensions.phase].incToHeight - scoreboardDimensions.height, maxChange )	
			
			if scoreboardDimensions.width < phases[scoreboardDimensions.phase].incToWidth then
				scoreboardDimensions.width = scoreboardDimensions.width + maxWidthDiff * phases[scoreboardDimensions.phase].width
				if scoreboardDimensions.width > phases[scoreboardDimensions.phase].incToWidth then
					scoreboardDimensions.width = phases[scoreboardDimensions.phase].incToWidth
				end
			elseif scoreboardDimensions.width > phases[scoreboardDimensions.phase].incToWidth and not scoreboardDrawn then
				scoreboardDimensions.width = scoreboardDimensions.width - maxWidthDiff * phases[scoreboardDimensions.phase].width
				if scoreboardDimensions.width < phases[scoreboardDimensions.phase].incToWidth then
					scoreboardDimensions.width = phases[scoreboardDimensions.phase].incToWidth
				end
			end
				
			if scoreboardDimensions.height < phases[scoreboardDimensions.phase].incToHeight then
				scoreboardDimensions.height = scoreboardDimensions.height + maxHeightDiff * phases[scoreboardDimensions.phase].height
				if scoreboardDimensions.height > phases[scoreboardDimensions.phase].incToHeight then
					scoreboardDimensions.height = phases[scoreboardDimensions.phase].incToHeight
				end
			elseif scoreboardDimensions.height > phases[scoreboardDimensions.phase].incToHeight and not scoreboardDrawn then
				scoreboardDimensions.height = scoreboardDimensions.height - maxHeightDiff * phases[scoreboardDimensions.phase].height
				if scoreboardDimensions.height < phases[scoreboardDimensions.phase].incToHeight then
					scoreboardDimensions.height = phases[scoreboardDimensions.phase].incToHeight
				end
			end
				
			if 	scoreboardDimensions.width == phases[scoreboardDimensions.phase].incToWidth and
				scoreboardDimensions.height == phases[scoreboardDimensions.phase].incToHeight then
				if phases[scoreboardDimensions.phase + 1] then
					scoreboardDimensions.phase = scoreboardDimensions.phase + 1
				else
					if not scoreboardDrawn then
						bindKey( "mouse2", "both", showTheCursor )
						bindKey( "mouse_wheel_up", "down", scrollScoreboard, -1 )
						bindKey( "mouse_wheel_down", "down", scrollScoreboard, 1 )
						addEventHandler( "onClientClick", getRootElement(), scoreboardClickHandler )
						if not (windowSettings and isElement( windowSettings )) then
							showCursor( false )
						end
						triggerServerEvent( "requestServerInfo", getRootElement() )
					end
					scoreboardDrawn = true
				end
			end
		elseif scoreboardDimensions.width ~= 0 and scoreboardDimensions.height ~= 0 then
			local phases = {
				[1] = {
					["width"] 		= s(10),
					["height"] 		= s(5),
					
					["incToWidth"] 	= s(10),
					["incToHeight"] = s(5),
				
					["decToWidth"] 	= 0,
					["decToHeight"] = 0
				},
				[2] = {
					["width"] 	= s(40),
					["height"] 	= s(5),
						
					["incToWidth"] 	= calculateWidth(),
					["incToHeight"] = s(5),
						
					["decToWidth"] 	= s(10),
					["decToHeight"] = s(5)
						
				},
				[3] = {
					["width"] 		= calculateWidth(),
					["height"] 		= s(30),
						
					["incToWidth"] 	= calculateWidth(),
					["incToHeight"] = calculateHeight(),
						
					["decToWidth"] 	= calculateWidth(),
					["decToHeight"] = s(5)
				}
			}
		
			if scoreboardDrawn then
				unbindKey( "mouse2", "both", showTheCursor )
				unbindKey( "mouse_wheel_up", "down", scrollScoreboard, -1 )
				unbindKey( "mouse_wheel_down", "down", scrollScoreboard, 1 )
				removeEventHandler( "onClientClick", getRootElement(), scoreboardClickHandler )
				if not (windowSettings and isElement( windowSettings )) then
					showCursor( false )
				end
			end
			scoreboardDrawn = false
			
			if not useAnimation then
				scoreboardDimensions.width = 0
				scoreboardDimensions.height = 0
				scoreboardDimensions.phase = 1
			end
			
			local maxChange = deltaSeconds * 30*drawSpeed
			local maxWidthDiff = math.clamp( -maxChange, scoreboardDimensions.width - phases[scoreboardDimensions.phase].decToWidth, maxChange )
			local maxHeightDiff = math.clamp( -maxChange, scoreboardDimensions.height - phases[scoreboardDimensions.phase].decToHeight, maxChange )
			
			if scoreboardDimensions.width > phases[scoreboardDimensions.phase].decToWidth then
				scoreboardDimensions.width = scoreboardDimensions.width - maxWidthDiff * phases[scoreboardDimensions.phase].width
				if scoreboardDimensions.width < phases[scoreboardDimensions.phase].decToWidth then
					scoreboardDimensions.width = phases[scoreboardDimensions.phase].decToWidth
				end
			elseif scoreboardDimensions.width < phases[scoreboardDimensions.phase].decToWidth then
				scoreboardDimensions.width = scoreboardDimensions.width - maxWidthDiff * phases[scoreboardDimensions.phase].width
				if scoreboardDimensions.width > phases[scoreboardDimensions.phase].decToWidth then
					scoreboardDimensions.width = phases[scoreboardDimensions.phase].decToWidth
				end
			end
				
			if scoreboardDimensions.height > phases[scoreboardDimensions.phase].decToHeight then
				scoreboardDimensions.height = scoreboardDimensions.height - maxHeightDiff * phases[scoreboardDimensions.phase].height
				if scoreboardDimensions.height < phases[scoreboardDimensions.phase].decToHeight then
					scoreboardDimensions.height = phases[scoreboardDimensions.phase].decToHeight
				end
			elseif scoreboardDimensions.height < phases[scoreboardDimensions.phase].decToHeight then
				scoreboardDimensions.height = scoreboardDimensions.height - maxHeightDiff * phases[scoreboardDimensions.phase].height
				if scoreboardDimensions.height > phases[scoreboardDimensions.phase].decToHeight then
					scoreboardDimensions.height = phases[scoreboardDimensions.phase].decToHeight
				end
			end
				
			if 	scoreboardDimensions.width == phases[scoreboardDimensions.phase].decToWidth and
				scoreboardDimensions.height == phases[scoreboardDimensions.phase].decToHeight and
				scoreboardDimensions.width ~= 0 and scoreboardDimensions.height ~= 0 then
				
				scoreboardDimensions.phase = scoreboardDimensions.phase - 1
				if scoreboardDimensions.phase < 1 then scoreboardDimensions.phase = 1 end
			end
		end

		--
		-- Draw scoreboard background
		--
		if (not rtPass or onlyAnim) and scoreboardDimensions.width ~= 0 and scoreboardDimensions.height ~= 0 then
			exports.dayzepoch:dxDrawDayzWindow( (sX/2)-(scoreboardDimensions.width/2)-10, (sY/2)-(scoreboardDimensions.height/2)-10, scoreboardDimensions.width+20, scoreboardDimensions.height+25, dxServerTheme, drawOverGUI )
			dxDrawRectangle( (sX/2)-(scoreboardDimensions.width/2), (sY/2)-(scoreboardDimensions.height/2-18), scoreboardDimensions.width, scoreboardDimensions.height-32, tocolor(0,0,0,100), drawOverGUI )
		end

		-- Check if anything else to do
		if not scoreboardDrawn or onlyAnim then
			return
		end		

		--
		-- Update the scoreboard content
		--
		local currentTick = getTickCount()
		if (currentTick - scoreboardTicks.lastUpdate > scoreboardTicks.updateInterval and (scoreboardToggled or scoreboardForced)) or forceScoreboardUpdate then
			forceScoreboardUpdate = false
			scoreboardContent = {}
			local index = 1
			
			local sortTableIndex = 1
			local sortTable = {}
			
			local players = getElementsByType( "player" )
			for key, player in ipairs( players ) do
				if not getPlayerTeam( player ) or not (showTeams or (serverInfo.forceshowteams and not serverInfo.forcehideteams)) or serverInfo.forcehideteams then
					sortTable[sortTableIndex] = {}
					for key, column in ipairs( scoreboardColumns ) do
						local content
						if column.name == "name" then
							local playerName = getPlayerName( player )
							if serverInfo.allowcolorcodes then
								if string.find( playerName, "#%x%x%x%x%x%x" ) then
									local colorCodes = {}
									while( string.find( playerName, "#%x%x%x%x%x%x" ) ) do
										local startPos, endPos = string.find( playerName, "#%x%x%x%x%x%x" )
										if startPos then
											colorCode = string.sub( playerName, startPos, endPos )
											table.insert( colorCodes, { { getColorFromString( colorCode ) }, startPos } )
											playerName = string.gsub( playerName, "#%x%x%x%x%x%x", "", 1 )
										end
									end
									content = { playerName, colorCodes }
								else
									content = playerName
								end
							else
								content = playerName
							end
						elseif column.name == "ping" then
							content = getPlayerPing( player )
						elseif column.name == "alivetime" then
							content = formatTime(getElementData(player,"alivetime"));
						else
							content = getElementData( player, column.name )
						end
						content = iif( content and column.name ~= "name" and type( content ) ~= "table", tostring( content ), content )
						if column.textFunction then
							if content and column.name == "name" and type( content ) == "table" then
								content[1] = column.textFunction( content[1], player )
							else
								content = column.textFunction( content, player )
							end
						end
						sortTable[sortTableIndex][column.name] = content
						sortTable[sortTableIndex]["__SCOREBOARDELEMENT__"] = player
					end
					sortTableIndex = sortTableIndex + 1
				end
			end
			if sortBy.what ~= "__NONE__" then table.sort( sortTable, scoreboardSortFunction ) end
			for key, value in ipairs( sortTable ) do
				scoreboardContent[index] = value
				index = index + 1
			end
			
			if (showTeams or (serverInfo.forceshowteams and not serverInfo.forcehideteams)) and not serverInfo.forcehideteams then
				-- And then the teams
				local teamSortTableIndex = 1
				local teamSortTable = {}
				sortTableIndex = 1
				sortTable = {}
				local teams = getElementsByType( "team" )
				for key, team in ipairs( teams ) do

					-- Add teams to sorting table first
					teamSortTable[teamSortTableIndex] = {}	
					for key, column in ipairs( scoreboardColumns ) do
						local content
						if column.name == "name" then
							local teamName = getTeamName( team )
							local teamMemberCount = #getPlayersInTeam( team )
							teamName = iif( teamName, tostring( teamName ), "-" )
							teamMemberCount = iif( teamMemberCount, tostring( teamMemberCount ), "0" )
							teamName = teamName .. " (" .. teamMemberCount .. " player" .. iif( teamMemberCount == "1", "", "s" ) .. ")"
							if serverInfo.allowcolorcodes then
								if string.find( teamName, "#%x%x%x%x%x%x" ) then
									local colorCodes = {}
									while( string.find( teamName, "#%x%x%x%x%x%x" ) ) do
										local startPos, endPos = string.find( teamName, "#%x%x%x%x%x%x" )
										if startPos then
											colorCode = string.sub( teamName, startPos, endPos )
											table.insert( colorCodes, { { getColorFromString( colorCode ) }, startPos } )
											teamName = string.gsub( teamName, "#%x%x%x%x%x%x", "", 1 )
										end
									end
									content = { teamName, colorCodes }
								else
									content = teamName
								end
							else
								content = teamName
							end
						else
							content = getElementData( team, column.name )
						end
						content = iif( content and column.name ~= "name" and type( content ) ~= "table", tostring( content ), content )
						if column.textFunction then
							if content and column.name == "name" and type( content ) == "table" then
								content[1] = column.textFunction( content[1], team )
							else
								content = column.textFunction( content, team )
							end
						end
						teamSortTable[teamSortTableIndex][column.name] = content
						teamSortTable[teamSortTableIndex]["__SCOREBOARDELEMENT__"] = team
					end
					teamSortTableIndex = teamSortTableIndex + 1
					
					-- and then the players
					sortTableIndex = 1
					sortTable[team] = {}
					local players = getPlayersInTeam( team )
					for key, player in ipairs( players ) do
						sortTable[team][sortTableIndex] = {}
						for key, column in ipairs( scoreboardColumns ) do
							local content
							if column.name == "name" then
								local playerName = getPlayerName( player )
								if serverInfo.allowcolorcodes then
									if string.find( playerName, "#%x%x%x%x%x%x" ) then
										local colorCodes = {}
										while( string.find( playerName, "#%x%x%x%x%x%x" ) ) do
											local startPos, endPos = string.find( playerName, "#%x%x%x%x%x%x" )
											if startPos then
												colorCode = string.sub( playerName, startPos, endPos )
												table.insert( colorCodes, { { getColorFromString( colorCode ) }, startPos } )
												playerName = string.gsub( playerName, "#%x%x%x%x%x%x", "", 1 )
											end
										end
										content = { playerName, colorCodes }
									else
										content = playerName
									end
								else
									content = playerName
								end
							elseif column.name == "ping" then
								content = getPlayerPing( player )
							else
								content = getElementData( player, column.name )
							end
							content = iif( content and column.name ~= "name" and type( content ) ~= "table", tostring( content ), content )
							if column.textFunction then
								if content and column.name == "name" and type( content ) == "table" then
									content[1] = column.textFunction( content[1], player )
								else
									content = column.textFunction( content, player )
								end
							end
							sortTable[team][sortTableIndex][column.name] = content
							sortTable[team][sortTableIndex]["__SCOREBOARDELEMENT__"] = player
						end
						sortTableIndex = sortTableIndex + 1
					end
					if sortBy.what ~= "__NONE__" then table.sort( sortTable[team], scoreboardSortFunction ) end
				end
				if sortBy.what ~= "__NONE__" then table.sort( teamSortTable, scoreboardSortFunction ) end
				for key, content in ipairs( teamSortTable ) do
					local team = content["__SCOREBOARDELEMENT__"]
					scoreboardContent[index] = content
					index = index + 1
					
					for key, value in ipairs( sortTable[team] ) do
						scoreboardContent[index] = value
						index = index + 1
					end
				end
			end
			scoreboardTicks.lastUpdate = currentTick
		end
		
		--
		-- Draw scoreboard content
		--
		if scoreboardDrawn then
			scoreboardDimensions.height = calculateHeight()
			scoreboardDimensions.width = calculateWidth()
			
			local topX, topY = (sX/2)-(calculateWidth()/2), (sY/2)-(calculateHeight()/2)
			local index = firstVisibleIndex
			local maxPerWindow = getMaxPerWindow()
			
			if firstVisibleIndex > #scoreboardContent-maxPerWindow+1 then
				firstVisibleIndex = 1
			end
			
			if firstVisibleIndex > 1 then 
				dxDrawImage( sX/2-8, topY-15, 17, 11, "scripts/scoreboard/arrow.png", 0, 0, 0, cWhite, drawOverGUI )
			end
			if firstVisibleIndex+maxPerWindow <= #scoreboardContent and #scoreboardContent > maxPerWindow then
				dxDrawImage( sX/2-8, topY+scoreboardDimensions.height+4, 17, 11, "scripts/scoreboard/arrow.png", 180, 0, 0, cWhite, drawOverGUI )
			end
			
			local y = topY+s(5)
			if serverInfo.server and showServerInfo then
				local customServerName = "KICK.LV | DayZ Epoch |LOOTx2|SHOP|150+Vehicles|";
				--serverInfo.server
				dxDrawText( customServerName, topX+s(5), y-5, topX+scoreboardDimensions.width-s(10), y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ), cServerInfo, fontscale(serverInfoFont, s(1)), serverInfoFont, "left", "top", false, false, drawOverGUI )
			end
			if serverInfo.players and showServerInfo then
				local players = getElementsByType( "player" )
				local text = exports.dayzepoch:getLanguageTextClient("scoreboard2")..": " .. tostring( #players ) .. "/" .. serverInfo.players
				local textWidth = dxGetTextWidth( text, fontscale(serverInfoFont, s(1)), serverInfoFont )
				dxDrawText( text, topX+scoreboardDimensions.width-s(5)-textWidth, y-5, topX+scoreboardDimensions.width-s(5), y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ), cServerInfo, fontscale(serverInfoFont, s(1)), serverInfoFont, "left", "top", false, false, drawOverGUI )
			end
			if (serverInfo.server or serverInfo.players) and showServerInfo then y = y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
			if serverInfo.gamemode and showGamemodeInfo then
				dxDrawText( "Gamemode: " .. serverInfo.gamemode, topX+s(5), y, topX+scoreboardDimensions.width-s(10), y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ), cServerInfo, fontscale(serverInfoFont, s(0.75)), serverInfoFont, "left", "top", false, false, drawOverGUI )
			end
			if serverInfo.map and showGamemodeInfo then
				local text = "Map: " .. serverInfo.map
				local textWidth = dxGetTextWidth( text, fontscale(serverInfoFont, s(0.75)), serverInfoFont )
				dxDrawText( text, topX+scoreboardDimensions.width-s(5)-textWidth, y, topX+scoreboardDimensions.width-s(5), y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ), cServerInfo, fontscale(serverInfoFont, s(0.75)), serverInfoFont, "left", "top", false, false, drawOverGUI )
			end
			if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then y = y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
			y = y+s(3)
			
			local textLength = dxGetTextWidth( exports.dayzepoch:getLanguageTextClient("scoreboard3"), fontscale(rmbFont, s(0.75)), rmbFont )
			local textHeight = dxGetFontHeight( fontscale(rmbFont, s(0.75)), rmbFont )
			dxDrawText(exports.dayzepoch:getLanguageTextClient("scoreboard3"), sX/2*0.025, topY+scoreboardDimensions.height-textHeight-s(2)+7, sX/2+(textLength/2), topY+scoreboardDimensions.height-s(2), cWhite, fontscale("default-bold", s(0.775)), "default-bold", "left", "top", false, false, drawOverGUI )

			local x = s(10)
			for key, column in ipairs( scoreboardColumns ) do
				if x ~= s(10) then
					local height = s(5)
					if (serverInfo.server or serverInfo.players) and showServerInfo then height = height+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
					if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then height = height+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
					height = height+s(3)
				end
				local translatedColumnText = exports.dayzepoch:getLanguageTextClient(column.friendlyName);
				if (column.width ~= 140 and column.width ~= 15) then
					column.width = dxGetTextWidth(translatedColumnText,fontscale(columnFont,scoreboardScale),columnFont)
				end
				if sortBy.what == column.name then
					local _, _, _, a = fromcolor( cHeader )
					dxDrawText( translatedColumnText or "-", topX+x+s(1+1), y+s(1), 	topX+x+s(1+column.width), 	y+s(1)+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont ), tocolor( 0, 0, 0, a ), fontscale(columnFont, s(1)), columnFont, "left", "top", true, false, drawOverGUI )
					dxDrawText( translatedColumnText or "-", topX+x+s(1), 	y, 	topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont ), cHeader, fontscale(columnFont, s(1)), columnFont, "left", "top", true, false, drawOverGUI )
				else
					local _, _, _, a = fromcolor( cHeader )
					dxDrawText( translatedColumnText or "-", topX+x+s(1), 	y+s(1), 	topX+x+s(1+column.width), 	y+s(1)+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont ), tocolor( 0, 0, 0, a ), fontscale(columnFont, s(1)), columnFont, "left", "top", true, false, drawOverGUI )
					dxDrawText( translatedColumnText or "-", topX+x, 	y, 	topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont ), cHeader, fontscale(columnFont, s(1)), columnFont, "left", "top", true, false, drawOverGUI )
				end
				x = x + s(column.width + 10)
			end
			
			y = y+s(5)+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont )
			while ( index < firstVisibleIndex+maxPerWindow and scoreboardContent[index] ) do
				local x = s(10)
				local element = scoreboardContent[index]["__SCOREBOARDELEMENT__"]
				local team, player
				
				if element and isElement( element ) and getElementType( element ) == "team" then
					dxDrawRectangle( topX+s(5), y, scoreboardDimensions.width-s(10), dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), cTeam, drawOverGUI )
					
					for key, column in ipairs( scoreboardColumns ) do
						local r, g, b, a = fromcolor( cContent )
						if not useColors then
							r, g, b = 255, 255, 255
						end
						local theX = x
						local content = scoreboardContent[index][column.name]
						if content and column.name == "name" then
							if useColors then
								r, g, b = getTeamColor( element )
							end
							theX = x - s(3)
						end
						local translatedColumnText = exports.dayzepoch:getLanguageTextClient(column.friendlyName);
						if (column.width ~= 140 and column.width ~= 15) then
							column.width = dxGetTextWidth(translatedColumnText,fontscale(columnFont,scoreboardScale),columnFont)
						end
						if content then
							if serverInfo.allowcolorcodes and type( content ) == "table" and column.name == "name" then
								local playerName = content[1]
								local colorCodes = content[2]
								local xPos = topX+theX
								for k, v in ipairs( colorCodes ) do
									local firstCodePos = v[2]
									local secondCodePos = colorCodes[k+1] and colorCodes[k+1][2]-1 or #playerName
									if firstCodePos ~= 1 and k == 1 then
										local secondPos = firstCodePos-1
										local firstPos = 1
										local partOfName = string.sub( playerName, firstPos, secondPos )
										local textLength = dxGetTextWidth( partOfName, fontscale(contentFont, s(1)), contentFont )
										dxDrawText( partOfName, xPos+s(1), 	y+s(1), 	topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
										dxDrawText( partOfName, xPos, 			y, 			topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 	tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
										xPos = xPos + textLength
									end
									if useColors then
										r, g, b = v[1][1], v[1][2], v[1][3]
									end
									local partOfName = string.sub( playerName, firstCodePos, secondCodePos )
									local textLength = dxGetTextWidth( partOfName, fontscale(contentFont, s(1)), contentFont )
									dxDrawText( partOfName, xPos+s(1), 	y+s(1), 	topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
									dxDrawText( partOfName, xPos, 			y, 			topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 	tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
									xPos = xPos + textLength
								end
							elseif type( content ) == "table" and column.name ~= "name" then
								if content.type == "image" and content.src then
									local itemHeight = dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont )
									content.height = content.height or itemHeight
									content.width = content.width or itemHeight
									local itemWidth = content.height/itemHeight * content.width

									content.color = content.color or tocolor(255,255,255,255)
									content.rot = content.rot or 0
									content.rotOffX = content.rotOffX or 0
									content.rotOffY = content.rotOffY or 0
									
									dxDrawImage ( topX+theX, y, itemWidth, itemHeight, content.src, content.rot, content.rotOffX, content.rotOffY, content.color, drawOverGUI )
								end
							else
								dxDrawText( content, topX+theX+s(1), 	y+s(1), 	topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
								dxDrawText( content, topX+theX, 		y, 		topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont ), 			tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(teamHeaderFont, s(1)), teamHeaderFont, "left", "top", true, false, drawOverGUI )
							end
						end
						x = x + s(column.width + 10)
					end
				elseif element and isElement( element ) and getElementType( element ) == "player" then
					-- Highlight the the row on which the cursor lies on
					if checkCursorOverRow( rtPass, topX+s(5), topX+scoreboardDimensions.width-s(5), y, y+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ) ) then
						dxDrawRectangle( topX+s(5), y, scoreboardDimensions.width-s(10), dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), cHighlight, drawOverGUI )
					end
						
					for key, column in ipairs( scoreboardColumns ) do
						local r, g, b, a = fromcolor( cContent )
						if not useColors then
							r, g, b = 255, 255, 255
						end
						local theX = x
						local content = scoreboardContent[index][column.name]
						if content and column.name == "name" then
							if useColors then
								r, g, b = getPlayerNametagColor( element )
							end
							if getPlayerTeam( element ) and (showTeams or (serverInfo.forceshowteams and not serverInfo.forcehideteams)) and not serverInfo.forcehideteams then theX = x + s(12) end
						end
						local translatedColumnText = exports.dayzepoch:getLanguageTextClient(column.friendlyName);
						if (column.width ~= 140 and column.width ~= 15) then
							column.width = dxGetTextWidth(translatedColumnText,fontscale(columnFont,scoreboardScale),columnFont)
						end
						if content then
							if serverInfo.allowcolorcodes and type( content ) == "table" and column.name == "name" then
								local playerName = content[1]
								local colorCodes = content[2]
								local xPos = topX+theX
								for k, v in ipairs( colorCodes ) do
									local firstCodePos = v[2]
									local secondCodePos = colorCodes[k+1] and colorCodes[k+1][2]-1 or #playerName
									if firstCodePos ~= 1 and k == 1 then
										local secondPos = firstCodePos-1
										local firstPos = 1
										local partOfName = string.sub( playerName, firstPos, secondPos )
										local textLength = dxGetTextWidth( partOfName, fontscale(contentFont, s(1)), contentFont )
										dxDrawText( partOfName, xPos+s(1), 	y+s(1), topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
										dxDrawText( partOfName, xPos, 		y, 		topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 			tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
										xPos = xPos + textLength
									end
									if useColors then
										r, g, b = v[1][1], v[1][2], v[1][3]
									end
									local partOfName = string.sub( playerName, firstCodePos, secondCodePos )
									local textLength = dxGetTextWidth( partOfName, fontscale(contentFont, s(1)), contentFont )
									dxDrawText( partOfName, xPos+s(1), 	y+s(1), topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
									dxDrawText( partOfName, xPos, 		y, 		topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 			tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
									xPos = xPos + textLength
								end
							elseif type( content ) == "table" and column.name ~= "name" then
								if content.type == "image" and content.src then
									local itemHeight = dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont )
									content.height = content.height or itemHeight
									content.width = content.width or itemHeight
									local itemWidth = itemHeight/content.height * content.width

									content.color = content.color or tocolor(255,255,255,255)
									content.rot = content.rot or 0
									content.rotOffX = content.rotOffX or 0
									content.rotOffY = content.rotOffY or 0
									
									dxDrawImage ( topX+theX, y, itemWidth, itemHeight, content.src, content.rot, content.rotOffX, content.rotOffY, content.color, drawOverGUI )
								end
							elseif column.name == "country" then
								if (content ~= ":admin/client/images/flags/false.png") then
									dxDrawImage( topX+theX, y+s(2), 16, 11, content, 0, 0, 0, cWhite, drawOverGUI )
								end
							else
								dxDrawText( content, topX+theX+s(1), 	y+s(1), topX+x+s(1+column.width), 	y+s(11)+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 	tocolor( 0, 0, 0, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
								dxDrawText( content, topX+theX, 		y, 		topX+x+s(column.width), 	y+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ), 			tocolor( r or 255, g or 255, b or 255, a or 255 ), fontscale(contentFont, s(1)), contentFont, "left", "top", true, false, drawOverGUI )
							end
						end
						x = x + s(column.width + 10)
					end
				end
				local font = iif( element and isElement( element ) and getElementType( element ) == "team", teamHeaderFont, contentFont )
				y = y + dxGetFontHeight( fontscale(font, scoreboardScale), font )
				index = index + 1
			end
			index = 1
		end
	end
end

-- FUNCTIONS
-- addColumn
function scoreboardAddColumn( name, width, friendlyName, priority, textFunction, fromResource )
	if type( name ) == "string" then
		width = width or 70
		friendlyName = friendlyName or name
		priority = tonumber( priority ) or getNextFreePrioritySlot( scoreboardGetColumnPriority( "name" ) )
		fixPrioritySlot( priority )
		textFunction = textFunction or nil
		fromResource = sourceResource or fromResource or nil
		
		if not (priority > MAX_PRIRORITY_SLOT or priority < 1) then
			for key, value in ipairs( scoreboardColumns ) do
				if name == value.name then
					return false
				end
			end
			table.insert( scoreboardColumns, { ["name"] = name, ["width"] = width, ["friendlyName"] = friendlyName, ["priority"] = priority, ["textFunction"] = textFunction } )
			table.sort( scoreboardColumns, function ( a, b ) return a.priority < b.priority end )
			if fromResource then
				if not resourceColumns[fromResource] then resourceColumns[fromResource] = {} end
				table.insert ( resourceColumns[fromResource], name )
			end
			return true
		end
	end
	return false
end

addEvent( "doScoreboardAddColumn", true )
addEventHandler( "doScoreboardAddColumn", getResourceRootElement(),
	function ( name, width, friendlyName, priority, fromResource )
		scoreboardAddColumn( name, width, friendlyName, priority, nil, fromResource )
	end
)

-- removeColumn
function scoreboardRemoveColumn( name )
	if type( name ) == "string" then
		for key, value in ipairs( scoreboardColumns ) do
			if name == value.name then
				table.remove( scoreboardColumns, key )
				for resource, content in pairs( resourceColumns ) do
					table.removevalue( content, name )
				end
				return true
			end
		end
	end
	return false
end

addEvent( "doScoreboardRemoveColumn", true )
addEventHandler( "doScoreboardRemoveColumn", getResourceRootElement(),
	function ( name )
		scoreboardRemoveColumn( name )
	end
)

-- clearColumns
function scoreboardClearColumns()
	while ( scoreboardColumns[1] ) do
		table.remove( scoreboardColumns, 1 )
		resourceColumns = {}
	end
	return true
end

addEvent( "doScoreboardClearColumns", true )
addEventHandler( "doScoreboardClearColumns", getResourceRootElement(),
	function ()
		scoreboardClearColumns()
	end
)

-- resetColumns
function scoreboardResetColumns( fromServer )
	while ( scoreboardColumns[1] ) do
		table.remove( scoreboardColumns, 1 )
		resourceColumns = {}
	end
	if not fromServer then
		scoreboardAddColumn( "name", 140, "Player" )
		scoreboardAddColumn("murders",50,"Murders");
		scoreboardAddColumn("banditskilled",76,"Bandits Killed");
		scoreboardAddColumn("zombieskilled",84,"Zombies Killed");
		scoreboardAddColumn("alivetime",60,"Alive Time");
		scoreboardAddColumn( "ping", 40, "Ping" )
	end
	return true
end

-- format time
function formatTime(value)
	if value then
		local hours = math.floor(value/60);
		local minutes = tonumber(("%.0f"):format(((value/60)-math.floor(value/60))*100/(100/60)));
		if (minutes < 10) then minutes = "0"..minutes; end
		return hours..":"..minutes;
	end
	return false;
end

addEvent( "doScoreboardResetColumns", true )
addEventHandler( "doScoreboardResetColumns", getResourceRootElement(),
	function ( fromServer )
		scoreboardResetColumns( iif( fromServer == nil, true, fromServer ) )
	end
)

-- setForced
function scoreboardSetForced( forced )
	scoreboardForced = forced
end

addEvent( "doScoreboardSetForced", true )
addEventHandler( "doScoreboardSetForced", getResourceRootElement(),
	function ( forced )
		scoreboardSetForced( forced )
	end
)

--Compability
setScoreboardForced = scoreboardSetForced

--setSortBy
function scoreboardSetSortBy( name, desc )
	if name then
		if type( name ) == "string" then
			local exists = false
			for key, value in ipairs( scoreboardColumns ) do
				if name == value.name then
					exists = true
				end
			end
			if exists then
				desc = iif( type( desc ) == "boolean" and not desc, 1, -1 )
				sortBy.what = name
				sortBy.dir = desc
			end
		end
		return false
	else
		sortBy.what = "__NONE__"
		sortBy.dir = -1
		return true
	end
end

addEvent( "doScoreboardSetSortBy", true )
addEventHandler( "doScoreboardSetSortBy", getResourceRootElement(),
	function ( name, desc )
		scoreboardSetSortBy( name, desc )
	end
)

--getColumnPriority
function scoreboardGetColumnPriority( name )
	if type( name ) == "string" then
		for key, value in ipairs( scoreboardColumns ) do
			if name == value.name then
				return value.priority
			end
		end
	end
	return false
end

--setColumnPriority
function scoreboardSetColumnPriority( name, priority )
	if type( name ) == "string" and type( priority ) == "number" then
		if not (priority > MAX_PRIRORITY_SLOT or priority < 1) then
			local columnIndex = false
			for key, value in ipairs( scoreboardColumns ) do
				if name == value.name then
					columnIndex = key
				end
			end
			if columnIndex then
				scoreboardColumns[columnIndex].priority = -1 -- To empty out the current priority
				fixPrioritySlot( priority )
				scoreboardColumns[columnIndex].priority = priority
				table.sort( scoreboardColumns, function ( a, b ) return a.priority < b.priority end )
				return true
			end
		end
	end
	return false
end

addEvent( "doScoreboardSetColumnPriority", true )
addEventHandler( "doScoreboardSetColumnPriority", getResourceRootElement(),
	function ( name, priority )
		scoreboardSetColumnPriority( name, priority )
	end
)

--getColumnCount
function scoreboardGetColumnCount()
	return #scoreboardColumns
end

--setColumnTextFunction
function scoreboardSetColumnTextFunction( name, func )
	if 	type( name ) == "string" then
		for key, value in ipairs( scoreboardColumns ) do
			if name == value.name then
				scoreboardColumns[key].textFunction = func
				return true
			end
		end
	end
	return false
end

function scoreboardGetTopCornerPosition()
	if scoreboardDrawn then
		local sX, sY = guiGetScreenSize()
		local topX, topY = (sX/2)-(calculateWidth()/2), (sY/2)-(calculateHeight()/2)
		topY = topY - 15		-- Extra 15 pixels for the scroll up button
		return math.floor(topX), math.floor(topY+1)
	end
	return false
end

function scoreboardGetSize()
	if scoreboardDrawn then
		local width, height = calculateWidth(), calculateHeight()
		return width, height
	end
	return false
end

function scoreboardGetSelectedRows()
	local rows = {}
	for k, v in pairs( selectedRows ) do
		table.insert( rows, k )
	end
	return rows
end

-- Other
function calculateWidth()
	local width = 0
	for key, value in ipairs( scoreboardColumns ) do
		width = width + s(value.width + 10)
	end
	return width + s(10)
end

function calculateHeight()
	local sX, sY = guiGetScreenSize()
	local maxPerWindow = getMaxPerWindow()
	local index = firstVisibleIndex
	local height = s(5)
	if (serverInfo.server or serverInfo.players) and showServerInfo then height = height+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
	if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then height = height+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
	height = height+s(3)
	height = height+s(5)+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont )
	height = height+s(5)+dxGetFontHeight( fontscale(rmbFont, s(0.75)), rmbFont )
	height = height+s(2)
	while ( index < firstVisibleIndex+maxPerWindow and scoreboardContent[index] ) do
		local element = scoreboardContent[index]["__SCOREBOARDELEMENT__"]
		if element and isElement( element ) and getElementType( element ) == "team" then
			height = height + dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont )
		else
			height = height + dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont )
		end
		index = index + 1
	end
	return height
end

function showTheCursor( _, state )
	if state == "down" then
		showCursor( true )
	else
		if not (windowSettings and isElement( windowSettings )) then
			showCursor( false )
		end
	end
end

function scrollScoreboard( _, _, upOrDown )
	if isCursorShowing() then
		local index = firstVisibleIndex
		local maxPerWindow = getMaxPerWindow()
		local highestIndex = #scoreboardContent - maxPerWindow + 1
		if index >= 1 and index <= highestIndex then
			local newIndex = math.max(1,math.min(index + upOrDown * serverInfo.scrollStep,highestIndex))
			if index ~= newIndex then
				firstVisibleIndex = newIndex
				bForceUpdate = true
			end
		end
	end
end

function math.clamp( low, value, high )
	return math.max( low, math.min( value, high ) )
end

function fromcolor( color )
	-- Propably not the most efficient way, but only way it works
	local colorCode = string.format( "%x", color )
	local a = string.sub( colorCode, 1, 2 ) or "FF"
	local r = string.sub( colorCode, 3, 4 ) or "FF"
	local g = string.sub( colorCode, 5, 6 ) or "FF"
	local b = string.sub( colorCode, 7, 8 ) or "FF"
	a = tonumber( "0x" .. a )
	r = tonumber( "0x" .. r )
	g = tonumber( "0x" .. g )
	b = tonumber( "0x" .. b )
	return r, g, b, a
end

function scale( value )
	return value*scoreboardScale
end
s = scale

function fontscale( font, value )
	return value*fontScale[font]
end

function scoreboardSortFunction( a, b )
	local firstContent, secondContent
	local sortByA
	if a[sortBy.what] and type( a[sortBy.what] ) == "table" and sortBy.what == "name" then
		sortByA = a[sortBy.what][1]
	else
		sortByA = a[sortBy.what]
	end
	local sortByB
	if b[sortBy.what] and type( b[sortBy.what] ) == "table" and sortBy.what == "name" then
		sortByB = b[sortBy.what][1]
	else
		sortByB = b[sortBy.what]
	end
	if tonumber( sortByA ) then
		firstContent = tonumber( sortByA )
	else
		if sortByA then
			firstContent = string.lower( tostring( sortByA ) )
		else
			firstContent = ""
		end
	end
	if tonumber( sortByB ) then
		secondContent = tonumber( sortByB )
	else
		if sortByB then
			secondContent = string.lower( tostring( sortByB ) )
		else
			secondContent = ""
		end
	end
	if type( sortBy.dir ) == "number" then
		if type( firstContent ) == type( secondContent ) then
		else
			firstContent = string.lower( tostring( firstContent ) )
			secondContent = string.lower( tostring( secondContent ) )
		end
		return iif( sortBy.dir == 1, firstContent > secondContent, firstContent < secondContent )
	end
	return false
end

function getMaxPerWindow()
	local sX, sY = guiGetScreenSize()
	local availableHeight = sY-(seperationSpace*2)-s(5)
	if (serverInfo.server or serverInfo.players) and showServerInfo then availableHeight = availableHeight-dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
	if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then availableHeight = availableHeight-dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
	availableHeight = availableHeight-s(3)
	availableHeight = availableHeight-s(5)-dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont )
	availableHeight = availableHeight-s(5)-dxGetFontHeight( fontscale(rmbFont, s(0.75)), rmbFont )
	availableHeight = availableHeight-s(2)
	
	local index = firstVisibleIndex
	local count = 0
	local height = 0
	while ( scoreboardContent[index] ) do
		local element = scoreboardContent[index]["__SCOREBOARDELEMENT__"]
		if element and isElement( element ) and getElementType( element ) == "team" then
			height = height + dxGetFontHeight( fontscale(teamHeaderFont, scoreboardScale), teamHeaderFont )
		else
			height = height + dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont )
		end
		if height >= availableHeight then
			return count
		end
		index = index + 1
		count = count + 1
	end
	return count
end

function scoreboardClickHandler( button, state, cX, cY )
	if scoreboardDrawn and button == "left" and state == "down" then
		local sX, sY = guiGetScreenSize()
		local topX, topY = (sX/2)-(calculateWidth()/2), (sY/2)-(calculateHeight()/2)
		local xMin, xMax, yMin, yMax = topX, topX+calculateWidth(), topY, topY+calculateHeight()
		local maxPerWindow = getMaxPerWindow()
		local clickedColumn = false  --This var is used if we clicked *anywhere* in the column
		if cX >= xMin and cX <= xMax and cY >= yMin and cY <= yMax then
			local clickedOnColumnHeader = false --This var is used if we clicked on the column header itself
			local x = s(10)
			local y = s(5)+s(3)
			if (serverInfo.server or serverInfo.players) and showServerInfo then y = y + dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
			if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then y = y + dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
			for key, column in ipairs( scoreboardColumns ) do
				local translatedColumnText = exports.dayzepoch:getLanguageTextClient(column.friendlyName);
				if (column.width ~= 140 and column.width ~= 15) then
					column.width = dxGetTextWidth(translatedColumnText,fontscale(columnFont,scoreboardScale),columnFont)
				end
				if cX >= topX+x and cX <= topX+x+s(column.width) then
					clickedColumn = column.name
					if cY >= topY+y and cY <= topY+y+dxGetFontHeight( fontscale(contentFont, scoreboardScale), contentFont ) then
						clickedOnColumnHeader = column.name
					end
				end
				x = x + s(column.width + 10)
			end
				
			
		end
		
		-- Scroll buttons
		if firstVisibleIndex > 1 then
			if cX >= sX/2-8 and cX <= sX/2-8+17 and cY >= topY-15 and cY <=  topY-15+11 then
				scrollScoreboard( nil, nil, -1 )
			end
		end
		if firstVisibleIndex+maxPerWindow <= #scoreboardContent and #scoreboardContent > maxPerWindow then
			if cX >= sX/2-8 and cX <= sX/2-8+17 and cY >= topY+calculateHeight()+4 and cY <= topY+calculateHeight()+4+11 then
				scrollScoreboard( nil, nil, 1 )
			end
		end
		
		-- Player/team click
		local y = topY+s(5)
		if (serverInfo.server or serverInfo.players) and showServerInfo then y = y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
		if (serverInfo.gamemode or serverInfo.map) and showGamemodeInfo then y = y+dxGetFontHeight( fontscale(serverInfoFont, scoreboardScale), serverInfoFont ) end
		y = y+s(3)
		y = y+s(5)+dxGetFontHeight( fontscale(columnFont, scoreboardScale), columnFont )
		if cY >= y and cX then
			local index = firstVisibleIndex
			local maxPerWindow = getMaxPerWindow()
			local topX, topY = (sX/2)-(calculateWidth()/2), (sY/2)-(calculateHeight()/2)
			local width = calculateWidth()
			while ( index < firstVisibleIndex+maxPerWindow and scoreboardContent[index] ) do
				local element = scoreboardContent[index]["__SCOREBOARDELEMENT__"]
				local font = iif( element and isElement( element ) and getElementType( element ) == "team", teamHeaderFont, contentFont )
				if cX >= topX+s(5) and cX <= topX+width-s(5) and cY >= y and cY <= y+dxGetFontHeight( fontscale(font, scoreboardScale), font ) then
					local selected = (not selectedRows[element]) == true
					local triggered = triggerEvent( "onClientPlayerScoreboardClick", element, selected, cX, cY, clickedColumn )
					if triggered then
						selectedRows[element] = not selectedRows[element]
					end
				end
				y = y + dxGetFontHeight( fontscale(font, scoreboardScale), font )
				index = index + 1
			end
		end
	end
end

function removeResourceScoreboardColumns( resource )
	if resourceColumns[resource] then
		while resourceColumns[resource][1] do
			local success = scoreboardRemoveColumn( resourceColumns[resource][1] )
			if not success then break end
		end
		resourceColumns[resource] = nil
	end
end
addEventHandler( "onClientResourceStop", getRootElement(), removeResourceScoreboardColumns )

function scoreboardForceUpdate ()
	bForceUpdate = true
	return true
end