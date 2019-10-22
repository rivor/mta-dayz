vehicle_name = {
	[487] = "MH6J",
	[497] = "AH6X",
	[528] = "Armored Truck",
	[470] = "HMMWV",
	[422] = "Pickup Truck",
	[468] = "Motorcycle",
	[433] = "Ural Military",
	[473] = "PBX",
	[509] = "Old Bike",
	[471] = "ATV",
	[463] = "Motorbike",
	[490] = "SUV",
	[531] = "Tractor",
	[579] = "UAZ",
	[421] = "Golf IW 211",
	[456] = "Modern Van",
}

configVar = {
	version = "DayZ Epoch (v0.4-r3)";
	globalchat = true;
	lootrate = 2;
	lootrespawn = 90*60000;
	respawntime = 8;
	maxzombies = 5;
}

function getMagazineSize(magazine)
	local itemPlus = 1;
	if (magazine == "mag1") then itemPlus = 15;
	elseif (magazine == "mag2") then itemPlus = 7;
	elseif (magazine == "mag3") then itemPlus = 30;
	elseif (magazine == "mag8") then itemPlus = 5;
	elseif (magazine == "mag10") then itemPlus = 5;
	elseif (magazine == "mag6") then itemPlus = 100;
	elseif (magazine == "mag4") then itemPlus = 30;
	elseif (magazine == "mag5") then itemPlus = 20;
	elseif (magazine == "mag7") then itemPlus = 7;
	elseif (magazine == "mag9") then itemPlus = 1;
	end
	return itemPlus;
end