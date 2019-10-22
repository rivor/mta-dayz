--[[
	Code Author: kaasis/rivor2
	Contact Info: http://steamcommunity.com/id/rivor2
]]--

--local prefix = "#DF0101[MTAZ] #999976MISSION:#BBBB99"; -- chat prefix (can be any, doesn't matter much)

local minimum_players = 1; -- how much players needed to start mission (def: 5 players)
local mission_interval = 60000*60; -- how often missions will spawn (def: 1 hour)
local mission_active_interval = 60000*30; -- how long active mission lasts (def: 15 minutes)

local missions = {
	[1] = { --[[ captured supply box mission ]]
		-- example: {x,y,z}
		{14.0390625, 835.4677734375, 36.196266174316},
		{-2053.3740234375, -189.943359375, 35.3203125},
		{-1874.001953125, -2092.6494140625, 58.542930603027},
		{1263.7265625, -1819.734375, 13.392370223999},
		{2417.744140625, 166.0654296875, 25.178684234619},
		{2227.658203125, 2660.3681640625, 10.8203125},
		{40.507,2005.586,17.640},
		{1524.064,1380.934,10.870},
		{1028.129,-342.700,73.992},
		{1374.908,-2002.174,46.713},
		{-1300.584,-2198.182,22.029},
		{-2305.450,-1641.969,483.697},
	},
	[2] = { --[[ captured helicopter mission ]]
		-- example: {id,slots,tires,engine,tankparts,fuel,x,y,z,rx,ry,rz}
		{487,20,0,1,1,1,1,60,12.896484375, 1536.0400390625, 12.75,0,0,0},
		{487,20,0,1,1,1,1,60,-2090.185546875, 213.8671875, 35.138595581055,0,0,0},
		{487,20,0,1,1,1,1,60,-1244.8720703125, -427.6787109375, 14.14396572113,0,0,0},
		{487,20,0,1,1,1,1,60,846.4970703125, -1102.9208984375, 24.303991317749,0,0,0},
		{487,20,0,1,1,1,1,60,2792.666015625, -2543.6337890625, 13.627556800842,0,0,0},
	},
	-- [[ hero supply box mission (only shoots bandits and survivors, heros can just pass peds) ]]
}

local items = {
	{"toolbelt7",10},
	{"toolbelt5",2},
	{"weapon21",10},
	{"weapon23",7},
	{"weapon25",7},
	{"weapon7",6},
	{"weapon20",5.5},
	{"weapon24",4},
	{"weapon22",3},
	{"fooditem9",2},
	{"fooditem7",2},
	{"item10",2},
	{"item5",2},
	{"item11",2},
	{"item12",2},
	{"fooditem6",1},
	{"medicine6",4},
	{"fooditem8",2},
	{"item6",3},
	{"weapon16",4},
	{"weapon15",4},
	{"weapon18",6},
	{"toolbelt3",4},
	{"medicine4",3},
	{"item2",1},
	{"backpack3",4},
	{"toolbelt7",1.5},
	{"medicine8",4},
	{"clothing2",4.5},
	{"clothing3",3},
	{"toolbelt2",3},
	{"toolbelt1",7},
	{"toolbelt4",3},
	{"vehiclepart1",2},
	{"vehiclepart2",2},
	{"vehiclepart3",2},
	{"vehiclepart4",2},
	{"vehiclepart5",2},
	{"item3",4.5},
	{"clothing1",0.5},
	{"clothing7",2},
	{"clothing8",1},
	{"toolbelt6",3},
	{"backpack4",5},
	{"backpack1",2},
	{"backpack5",2},
	{"weapon107",0.5},
	{"weapon4",1},
	{"medicine3",5},
	{"weapon9",2},
	{"weapon8",3},
	{"weapon17",5},
};

function outputAnnouncement(text)
	--outputChatBox(prefix.." "..text,root,0,0,0,true)
	triggerClientEvent(root,"notify",root);
end

function destroy_object(object)
	local col = getElementData(object, "parent");
	if col then destroyElement(col); end
	if object then destroyElement(object); end
end

function math.percentChance(percent, repeatTime)
	local players = #getElementsByType("player");
	if (players >= 20) then players = players-15; end
	local hits = 0;
	for i = 1, repeatTime do
		local number = math.random(0, 200)/2
		if (number <= percent*players) then hits = hits + 1; end
	end
	return hits;
end

function supplybox_mission(data)
	local x,y,z = unpack(data)
	local mapBlip = createBlip(x,y,z,56,1,0,0,0,255,0,99999.0,root)
	local mapArea = createRadarArea(x-125,y-125,250,250,0,255,0,100,root)
	local loot_box = createObject(964,x,y,(z-1),0,0,math.random(360));
	local house = createObject(3644,x,y,(z+1.5),0,0,0);
	setObjectScale(loot_box, 1);
	local boxCol = createColSphere(x,y,z,4);
	attachElements(boxCol,loot_box,0,0,0);
	setElementData(boxCol,"parent",loot_box);
	setElementData(loot_box,"parent",boxCol);
	setElementData(boxCol,"tent",true);
	setElementData(boxCol,"supply_box",true);
	setElementData(boxCol,"MAX_Slots",100);
	for _,v in ipairs(items) do
		local value =  math.percentChance(v[2], math.random(2));
		setElementData(boxCol, v[1], value);
	end
	outputAnnouncement("Bandits captured Supply Box, they'll be around for 15 minutes.")
	setTimer(function()
		if mapArea then destroyElement(mapArea); end
		if mapBlip then destroyElement(mapBlip); end
		if house then destroyElement(house); end
		destroy_object(loot_box);
		--outputAnnouncement("Captured Supply Box ended (next mission in 1 hour)")
		auto_mission_spawner();
	end,mission_active_interval,1)
end

function heli_mission(data)
	local id,slots,tires,engine,rotor,tankparts,scrap,fuel,x,y,z,rx,ry,rz = unpack(data);
	local veh = createVehicle(id,x,y,z,rx,ry,math.random(360));
	local vehCol = createColSphere(x,y,z,2.5);
	local areaCol = createColSphere(x,y,z,25);
	attachElements(vehCol,veh);
	setElementData(vehCol,"parent",veh);
	setElementData(veh,"parent",vehCol);
	setElementData(vehCol,"vehicle",true);
	setElementData(veh,"dayzvehicle",0);
	setElementData(vehCol,"MAX_Slots", tonumber(slots));
	setElementData(vehCol,"Tire_inVehicle",tires);
	setElementData(vehCol,"Engine_inVehicle",engine);
	setElementData(vehCol,"Rotor_inVehicle",rotor);
	setElementData(vehCol,"Parts_inVehicle",tankparts);
	setElementData(vehCol,"Scrap_inVehicle",scrap);
	setElementData(vehCol,"needtires", tires);
	setElementData(vehCol,"needparts", tankparts);
	setElementData(vehCol,"needscrap", scrap);
	setElementData(vehCol,"needrotor", rotor);
	setElementData(vehCol,"needengines", engine);
	setElementData(vehCol,"spawn",{id,x,y,z});
	setElementData(vehCol,"fuel",fuel);
	for _,v in ipairs(items) do
		local value =  math.percentChance(v[2], math.random(2));
		setElementData(vehCol, v[1], value);
	end
	local mapBlip = createBlip(x,y,z,56,1,0,0,0,255,0,99999.0,root)
	local mapArea = createRadarArea(x-125,y-125,250,250,0,255,0,100,root)
	outputAnnouncement("Bandits captured Helicopter, they'll be around for 15 minutes.")
	setTimer(function()
		for i,v in ipairs(getElementsWithinColShape(areaCol,"vehicle")) do
			if (v == veh) then
				if areaCol then destroyElement(areaCol); end
				if mapBlip then destroyElement(mapBlip); end
				if mapArea then destroyElement(mapArea); end
				destroy_object(veh);
				--outputAnnouncement("Bandits got away with helicopter (next mission in 1 hour)")
				auto_mission_spawner();
				return;
			end
		end
		if areaCol then destroyElement(areaCol); end
		--outputAnnouncement("Bandits have been defeated (next mission in 1 hour)")
		auto_mission_spawner();
	end,mission_active_interval,1)
end

function start_mission(source,cmd,execute)
	if (execute == "start") then
		local players = #getElementsByType("player");
		if (players >= minimum_players) then
			local mission_type = 1;
			if (players >= 20) then
				mission_type = 2;
			end
			for i,v in ipairs(missions) do
				if (mission_type == i and mission_type == 1) then
					local location = math.random(#missions[mission_type]);
					for i,v in ipairs(v) do
						if (location == i) then
							supplybox_mission(v);
						end
					end
				elseif (mission_type == i and mission_type == 2) then
					local location = math.random(#missions[mission_type]);
					for i,v in ipairs(v) do
						if (location == i) then
							heli_mission(v);
						end
					end
				end
			end
		else
			--outputAnnouncement("mission couldn't start, needed atleast "..minimum_players.." players.")
		end
	end
end

function auto_mission_spawner()
	setTimer(function()
		start_mission(source,"mission","start");
	end,1000,1)
end
auto_mission_spawner();
--addCommandHandler("mission",start_mission,false,true)