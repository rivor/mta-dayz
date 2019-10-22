local inventoryItems = {
	[1] = {
		{"weapon11", 3,"images/inventory/weapons/m4a1holo.png"},
		{"weapon12", 6,"images/inventory/weapons/mk48.png"},
		{"weapon13", 5,"images/inventory/weapons/rpk.png"},
		{"weapon10", 3,"images/inventory/weapons/ak107.png"},
		{"weapon6", 3,"images/inventory/weapons/aksgold.png"},
		{"weapon14", 3,"images/inventory/weapons/sa58.png"},
		{"weapon7", 3,"images/inventory/weapons/winchester1866.png"},
		{"weapon15", 3,"images/inventory/weapons/saiga12k.png"},
		{"weapon9", 3,"images/inventory/weapons/aks74u.png"},
		{"weapon8", 3,"images/inventory/weapons/crossbow.png"},
		{"weapon2", 3,"images/inventory/weapons/dmr.png"},
		{"weapon3", 3,"images/inventory/weapons/cz550.png"},
		{"weapon5", 3,"images/inventory/weapons/m24.png"},
		{"weapon1", 3,"images/inventory/weapons/vks.png"},
		{"weapon4", 3,"images/inventory/weapons/svdcamo.png"}
	},
	[2] = {
		{"weapon21", 2,"images/inventory/weapons/m1911.png"},
		{"weapon23", 2,"images/inventory/weapons/m9sd.png"},
		{"weapon25", 2,"images/inventory/weapons/g17.png"},
		{"weapon20", 2,"images/inventory/weapons/microuzi.png"},
		{"weapon18", 3,"images/inventory/weapons/mp5a5.png"},
		{"weapon19", 2,"images/inventory/weapons/revolver.png"},
		{"weapon24", 2,"images/inventory/weapons/huntingknife.png"},
		{"weapon22", 2,"images/inventory/weapons/hatchet.png"},
		{"weapon26", 2,"images/inventory/weapons/bat.png"},
		{"weapon27", 2,"images/inventory/weapons/shovel.png"},
		{"weapon17", 2,"images/inventory/weapons/machete.png"}
	},
	[3] = {
		{"weapon16", 1,"images/inventory/weapons/grenade.png"},
		{"weapon28", 1,"images/inventory/weapons/binoculars.png", "inventorydescription6"}
	},
	[4] = {
		{"mag1", 0.0666666666666667,"images/inventory/mags/pistol.png","mag1description"},
		{"mag2", 0.1428571428571429,"images/inventory/mags/revolver.png","mag2description"},
		{"mag3", 0.0666666666666667,"images/inventory/mags/semirifle.png","mag3description"},
		{"mag4", 0.0666666666666667,"images/inventory/mags/rifle.png","mag4description"},
		{"mag7", 0.1428571428571429,"images/inventory/mags/shotgun.png","mag7description"},
		{"mag5", 0.05,"images/inventory/mags/m4rifle.png","mag5description"},
		{"mag6", 0.03,"images/inventory/mags/heavy.png","mag6description"},
		{"mag8", 0.1,"images/inventory/mags/sniper.png","mag8description"},
		{"mag9", 1,"images/inventory/mags/bolt.png","mag9description"},
		{"mag10", 0.1,"images/inventory/mags/sniper2.png","mag10description"}
	},
	[5] = {
		{"fooditem1", 1,"images/inventory/waterbottle.png","inventorydescription8"},
		{"fooditem3", 1,"images/inventory/pasta.png","inventorydescription9"},
		{"fooditem4", 1,"images/inventory/beans.png","inventorydescription10"},
		{"fooditem5", 1,"images/inventory/burger.png","inventorydescription10"},
		{"fooditem9", 1,"images/inventory/pizza.png","inventorydescription10"},
		{"fooditem7", 1,"images/inventory/soda.png","inventorydescription11"},
		{"fooditem6", 1,"images/inventory/milk.png","inventorydescription12"},
		{"fooditem10", 1,"images/inventory/cookedmeat.png","inventorydescription13"}
	},
	[6] = {
		{"medicine5", 1,"images/inventory/bandage.png", "inventorydescription15", "inventoryactiontext9"},
		{"medicine1", 4,"images/inventory/medicaments/medickit.png","inventorydescription19", "inventoryactiontext11"},
		{"medicine2", 2,"images/inventory/medicaments/medickit.png","inventorydescription19", "inventoryactiontext11"},
		{"medicine3", 1,"images/inventory/medicaments/smallmedickit.png","inventorydescription19", "inventoryactiontext11"},
		{"medicine4", 1,"images/inventory/heatpack.png","inventorydescription20", "inventoryactiontext11"},
		{"medicine6", 1,"images/inventory/painkiller.png", "inventorydescription21", "inventoryactiontext11"},
		{"medicine8", 1,"images/inventory/medicaments/morphine.png", "inventorydescription22", "inventoryactiontext11"},
		{"medicine7", 1,"images/inventory/medicaments/bloodbag.png","inventorydescription23"},
	},
	[7] = {
		{"item1", 2,"images/inventory/woodpile.png","inventorydescription14"},
		{"item5", 1,"images/inventory/roadflarered.png", "inventorydescription16", "inventoryactiontext10"},
		{"item11", 1,"images/inventory/roadflaregreen.png", "inventorydescription16", "inventoryactiontext10"},
		{"item12", 1,"images/inventory/roadflareblue.png", "inventorydescription16", "inventoryactiontext10"},
		{"item10", 2,"images/inventory/emptycanister.png","inventorydescription17"},
		{"item9", 2,"images/inventory/fullcanister.png","inventorydescription18"},
		{"item2", 1,"images/inventory/wirefence.png", "inventorydescription24", "inventoryactiontext12"},
		{"item13", 1,"images/inventory/mine.png", "inventorydescription25", "inventoryactiontext10"},
		{"item14", 1,"images/inventory/key.png", "inventorydescription25"},
		{"fooditem11", 1,"images/inventory/rawmeat.png","inventorydescription26"},
		{"vehiclepart3", 2,"images/inventory/tire.png", "inventorydescription27"},
		{"vehiclepart4", 2,"images/inventory/tankpart.png", "inventorydescription27"},
		{"vehiclepart5", 2,"images/inventory/scrapmetal.png", "inventorydescription27"},
		{"vehiclepart2", 5,"images/inventory/rotor.png", "inventorydescription27"},
		{"vehiclepart1", 5,"images/inventory/engine.png", "inventorydescription27"},
		{"item3", 3,"images/inventory/tent.png", "inventorydescription28", "inventoryactiontext13"},
		{"item4", 10,"images/inventory/safe.png", "inventorydescription29", "inventoryactiontext14"},
		{"fooditem2", 1,"images/inventory/emptybottle.png", "inventorydescription31", "inventoryactiontext16"}, 
		{"fooditem8", 1,"images/inventory/emptysoda.png", "inventorydescription32"},
		{"item6", 1,"images/inventory/trash.png", "inventorydescription33"},
		--{"currency1", 0,"images/inventory/briefcase.png", "inventorydescription34"},
		--{"currency2", 0,"images/inventory/briefcase.png", "inventorydescription35"},
		--{"currency3", 0,"images/inventory/briefcase.png", "inventorydescription36"},
		{"item7", 1,"images/inventory/c4.png", "inventorydescription37"},
		{"item8", 1,"images/inventory/supplysignal.png","inventorydescription38","inventoryactiontext17"},
	},
	[8] = {
		{"clothing2", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing3", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing4", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing5", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing6", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing9", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing1", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing7", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"clothing8", 1,"images/inventory/clothing.png", "inventorydescription30", "inventoryactiontext15"},
		{"backpack5", 1,"images/inventory/equipment/drybag.png", "inventorydescription51", "inventoryactiontext18"},
		{"backpack4", 1,"images/inventory/equipment/leathersack.png", "inventorydescription39", "inventoryactiontext18"},
		{"backpack6", 1,"images/inventory/equipment/tortillabackpack.png", "inventorydescription65", "inventoryactiontext18"},
		{"backpack7", 1,"images/inventory/equipment/alicebackpack.png", "inventorydescription66", "inventoryactiontext18"},
		{"backpack3", 1,"images/inventory/equipment/huntingbackpack.png", "inventorydescription40", "inventoryactiontext18"},
		{"backpack2", 1,"images/inventory/equipment/boulderbackpack.png", "inventorydescription41", "inventoryactiontext18"},
		{"backpack1", 1,"images/inventory/equipment/coyotebackpack.png", "inventorydescription42", "inventoryactiontext18"},
		{"helmet1", 1,"images/inventory/equipment/specialforceshelmet.png", "inventorydescription68", "inventoryactiontext22"},
		{"helmet2", 1,"images/inventory/equipment/militaryhelmet.png", "inventorydescription68", "inventoryactiontext22"},
		{"helmet3", 1,"images/inventory/equipment/motorcyclehelmet.png", "inventorydescription68", "inventoryactiontext22"},
		{"helmet4", 1,"images/inventory/equipment/swathelmet.png", "inventorydescription68", "inventoryactiontext22"},
		{"helmet5", 1,"images/inventory/equipment/welderhelmet.png", "inventorydescription68", "inventoryactiontext22"},
		{"helmet6", 1,"images/inventory/equipment/cap.png", "inventorydescription70", "inventoryactiontext22"},
		{"helmet7", 1,"images/inventory/equipment/ushanka.png", "inventorydescription70", "inventoryactiontext22"},
		{"vest1", 1,"images/inventory/equipment/policevest.png", "inventorydescription69", "inventoryactiontext23"},
		{"vest2", 1,"images/inventory/equipment/militaryvest.png", "inventorydescription69", "inventoryactiontext23"},
	},
	[9] = {
		{"toolbelt7", 0,"images/inventory/nvgoggles.png", "inventorydescription43"},
		{"toolbelt6", 0,"images/inventory/infgoggles.png", "inventorydescription44"},
		{"toolbelt1", 0,"images/inventory/map.png","inventorydescription45"},
		{"toolbelt5", 0,"images/inventory/boxofmatches.png", "inventorydescription46", "inventoryactiontext19"},
		{"toolbelt3", 0,"images/inventory/watch.png", "inventorydescription47"},
		{"toolbelt2", 0,"images/inventory/gps.png", "inventorydescription45", "inventoryactiontext20"},
		{"toolbelt4", 0,"images/inventory/toolbox.png", "inventorydescription48"},
		{"toolbelt9", 0,"images/inventory/toolbox.png", "inventorydescription49"},
		{"toolbelt8", 0,"images/inventory/radiodevice.png", "inventorydescription50", "inventoryactiontext21"}
	}
}

local keyTable = {
	[1] = "inventorycolumntext1",
	[2] = "inventorycolumntext2",
	[3] = "inventorycolumntext3",
	[4] = "inventorycolumntext4",
	[5] = "inventorycolumntext5",
	[6] = "inventorycolumntext6",
	[7] = "inventorycolumntext7",
	[8] = "inventorycolumntext8",
	[9] = "inventorycolumntext9"
};

local vehicleAddonsInfo = {
	{422, 4, 1, 1, 1, 0, 25},
	{470, 4, 1, 1, 1, 0, 50},
	{471, 4, 1, 1, 1, 0, 8},
	{468, 2, 1, 1, 1, 0, 10},
	{433, 6, 1, 1, 1, 0, 150},
	{509, 0, 0, 0, 0, 0, 0},
	{487, 0, 1, 1, 1, 1, 20},
	{497, 0, 1, 1, 1, 1, 20},
	{473, 0, 1, 1, 1, 0, 35},

	--[[
	{492, 4, 1, 1, 32},
	{463, 2, 1, 1, 15},
	{505, 4, 1, 1, 40},
	{560, 4, 1, 1, 33},
	{593, 3, 1, 1, 20},
	]]--

	{579, 4, 1, 1, 1, 0, 35},
	{463, 2, 1, 1, 1, 0, 10},
	{490, 4, 1, 1, 1, 0, 50},
	{531, 4, 1, 1, 1, 0, 0},
	{421, 4, 1, 1, 1, 0, 12},
	{456, 4, 1, 1, 1, 0, 86},

	{528, 4, 1, 1, 1, 0, 50},
};

local vehicleFuelTable = {
	{422, 80},
	{470, 100},
	{471, 30},
	{468, 30},
	{433, 140},
	{509, 0},
	{487, 60},
	{497, 60},
	{473, 60},

	--[[
	{492, 80},
	{463, 40},
	{505, 80},
	{560, 60},
	{593, 40},
	{568, 100}
	]]--

	{579, 45},
	{463, 35},
	{490, 75},
	{531, 45},
	{421, 50},
	{456, 120},

	{528, 80},
};

local weaponAmmoTable = {
	["Weapons"] ={
		{"mag1", "weapon21", 23},
		{"mag1", "weapon23", 23},
		{"mag1", "weapon25", 23},
		{"mag2", "weapon19", 24},
		{"mag3", "weapon20", 29},
		{"mag3", "weapon18", 29},
		{"mag4", "weapon9", 31},
		{"mag4", "weapon10", 31},
		{"mag4", "weapon6", 31},
		{"mag4", "weapon14", 31},
		{"mag5", "weapon11", 31},
		{"mag6", "weapon12", 30},
		{"mag6", "weapon13", 30},
		{"mag7", "weapon7", 25},
		{"mag7", "weapon15", 27},
		{"mag10", "weapon2", 34},
		{"mag8", "weapon3", 34},
		{"mag8", "weapon5", 34},
		{"mag10", "weapon1", 34},
		{"mag8", "weapon4", 34},
		{"mag9", "weapon8", 33}
	},
	["others"] = {
		{"weapon16", 16},
		{"weapon24", 4},
		{"weapon22", 8},
		{"weapon28", 43},
		{"weapon26", 5},
		{"weapon27", 6},
		{"weapon17", 2}
	}
};

local helmetDamageReduction = {
	--["helmet"] = reduce by,
	["helmet5"] = 2.5,
	["helmet1"] = 2,
	["helmet2"] = 1.8,
	["helmet4"] = 1.5,
	["helmet3"] = 1.3,
	["helmet6"] = 1, -- 1 means no reduction
	["helmet7"] = 1, -- 1 means no reduction
};

local vestDamageReduction = {
	--["vest"] = reduce by,
	["vest2"] = 2,
	["vest1"] = 1.5,
};

local inv_bp = {parent={},scrollpane={},button={},label={},column={},staticimage={}};
local inv_loot = {parent={},scrollpane={},button={},label={},column={},staticimage={}};
local headline = {};
local gridlistItems = {};
local buttonItems = {};
local playerFire = {};
local fireCounter = 0;
local rwindow = {channel={},safe={}};
local Type = "";
local safeColTarget = nil;
local loadRotation = 0;

addEvent("hideInventoryManual", true);
addEvent("hideInventoryManual2", true);
addEvent("refreshInventoryManual", true);
addEvent("refreshLootManual", true);
addEvent("onPlayerMoveItemOutOFInventory", true);
addEvent("onPlayerMoveItemInInventory", true);

local sW,sH = guiGetScreenSize();
local inv_w,inv_h = 450,500;

inv_bp.parent[1] = guiCreateStaticImage(sW/2-inv_w/2,sH/2-inv_h/2, inv_w, inv_h,"images/empty.png",false);
guiSetVisible(inv_bp.parent[1],false);
inv_bp.scrollpane[1] = guiCreateScrollPane(45, 15+48+5, inv_w-60, inv_h-40-48-5, false, inv_bp.parent[1]);
inv_bp.button[1] = guiCreateButton(10, 10, 30, inv_h-30, "<<", false, inv_bp.parent[1])
inv_bp.label[1] = guiCreateLabel(0,inv_h-20,inv_w-15,15,"",false,inv_bp.parent[1]);
guiLabelSetHorizontalAlign(inv_bp.label[1],"right")
guiSetFont(inv_bp.label[1],"default-bold-small")
inv_bp.label[2] = guiCreateLabel(0,0,0,0,"",false);
guiSetProperty(inv_bp.label[2],"AlwaysOnTop","True");
guiSetAlpha(inv_bp.button[1],0)
guiSetAlpha(inv_bp.label[2],0);
guiSetEnabled(inv_bp.label[2],false);

local loot_w = 328;

inv_loot.parent[1] = guiCreateStaticImage(sW/2-loot_w/2,sH/2-inv_h/2, loot_w, inv_h,"images/empty.png",false);
guiSetVisible(inv_loot.parent[1],false);
inv_loot.scrollpane[1] = guiCreateScrollPane(15, 15+48+5, loot_w-60, inv_h-40-48-5, false, inv_loot.parent[1]);
inv_loot.button[1] = guiCreateButton(loot_w-40, 10, 30, inv_h-30, ">>", false, inv_loot.parent[1])
inv_loot.label[1] = guiCreateLabel(15,inv_h-20,loot_w-15,15,"",false,inv_loot.parent[1]);
guiLabelSetHorizontalAlign(inv_bp.label[1],"right")
guiSetFont(inv_loot.label[1],"default-bold-small")
inv_loot.label[2] = guiCreateLabel(0,0,0,0,"",false);
guiSetProperty(inv_loot.label[2],"AlwaysOnTop","True");
guiSetAlpha(inv_loot.button[1],0)
guiSetAlpha(inv_loot.label[2],0);
guiSetEnabled(inv_loot.label[2],false);

function createInventoryItems()
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		local label = guiCreateLabel(0,0,300,15,"",false,inv_bp.scrollpane[1]);
		guiSetFont(label,"default-bold-small")
		guiSetVisible(label,false)
		setElementData(localPlayer,"show_".._,true);
		table.insert(inv_bp.column,label);
		for i,item in ipairs(inventoryItems[v]) do
			local image_type = guiCreateStaticImage(0,0,0,0,item[3],false,inv_bp.scrollpane[1]);
			local native_x = guiStaticImageGetNativeSize(image_type);
			local x, y = 0, 0
			local nextY = 0
			if (native_x == 234) then
				local item1 = guiCreateStaticImage(x, y, 117, 57, "images/inventory/acons/117.png", false, inv_bp.scrollpane[1])
				setElementCallPropagationEnabled(item1, false)
				guiSetProperty (item1, "ImageColours", "tl:FF8e6d4b tr:FF8e6d4b bl:FF8e6d4b br:FF8e6d4b")
				local item2 = guiCreateStaticImage(0, 0, 1, 1, item[3], true, item1)
				setElementCallPropagationEnabled(item2, false)
				local item3 = guiCreateStaticImage(0, 0, 1, 1, "images/empty.png", true, item1)
				local itemcount = guiCreateLabel(0, 0, 0.96, 0.91,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				guiLabelSetColor(itemcount,0,0,0)
				local itemcount = guiCreateLabel(0, 0, 0.95, 0.9,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				local eqitem = guiCreateLabel(0.07, 0.07, 1, 1,"",true,item1);
				guiSetFont(eqitem,"default-bold-small")
				guiSetEnabled(eqitem,false)
				guiLabelSetColor(eqitem,0,0,0)
				local eqitem = guiCreateLabel(0.06, 0.06, 1, 1,"",true,item1);
				guiSetFont(eqitem,"default-bold-small")
				guiSetEnabled(eqitem,false)
				guiLabelSetColor(eqitem,255,255,255)
				setElementData(item1,"data",item[1]);
				table.insert(inv_bp.staticimage,item1);
				guiSetVisible(item1,false);
			elseif (native_x == 114) then
				local item1 = guiCreateStaticImage(x, y, 57, 57, "images/inventory/acons/57.png", false, inv_bp.scrollpane[1])
				setElementCallPropagationEnabled(item1, false)
				guiSetProperty (item1, "ImageColours", "tl:FF8e6d4b tr:FF8e6d4b bl:FF8e6d4b br:FF8e6d4b")
				local item2 = guiCreateStaticImage(0, 0, 1, 1, item[3], true, item1)
				setElementCallPropagationEnabled(item2, false)
				local item3 = guiCreateStaticImage(0, 0, 1, 1, "images/empty.png", true, item1)
				local itemcount = guiCreateLabel(0, 0, 0.91, 0.91,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				guiLabelSetColor(itemcount,0,0,0)
				local itemcount = guiCreateLabel(0, 0, 0.9, 0.9,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				local eqitem = guiCreateLabel(0.13, 0.07, 1, 1,"",true,item1);
				guiSetFont(eqitem,"default-bold-small")
				guiSetEnabled(eqitem,false)
				guiLabelSetColor(eqitem,0,0,0)
				local eqitem = guiCreateLabel(0.12, 0.06, 1, 1,"",true,item1);
				guiSetFont(eqitem,"default-bold-small")
				guiSetEnabled(eqitem,false)
				guiLabelSetColor(eqitem,255,255,255)
				setElementData(item1,"data",item[1]);
				table.insert(inv_bp.staticimage,item1);
				guiSetVisible(item1,false);
			end
		end
	end
end
createInventoryItems()

function createLootItems()
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		for i,item in ipairs(inventoryItems[v]) do
			local image_type = guiCreateStaticImage(0,0,0,0,item[3],false,inv_loot.scrollpane[1]);
			local native_x = guiStaticImageGetNativeSize(image_type);
			local x, y = 0, 0
			local nextY = 0
			if (native_x == 234) then
				local item1 = guiCreateStaticImage(x, y, 117, 57, "images/inventory/acons/117.png", false, inv_loot.scrollpane[1])
				setElementCallPropagationEnabled(item1, false)
				guiSetProperty (item1, "ImageColours", "tl:FF8e6d4b tr:FF8e6d4b bl:FF8e6d4b br:FF8e6d4b")
				local item2 = guiCreateStaticImage(0, 0, 1, 1, item[3], true, item1)
				setElementCallPropagationEnabled(item2, false)
				local item3 = guiCreateStaticImage(0, 0, 1, 1, "images/empty.png", true, item1)
				local itemcount = guiCreateLabel(0, 0, 0.96, 0.91,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				guiLabelSetColor(itemcount,0,0,0)
				local itemcount = guiCreateLabel(0, 0, 0.95, 0.9,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				setElementData(item1,"data",item[1]);
				table.insert(inv_loot.staticimage,item1);
				guiSetVisible(item1,false);
			elseif (native_x == 114) then
				local item1 = guiCreateStaticImage(x, y, 57, 57, "images/inventory/acons/57.png", false, inv_loot.scrollpane[1])
				setElementCallPropagationEnabled(item1, false)
				guiSetProperty (item1, "ImageColours", "tl:FF8e6d4b tr:FF8e6d4b bl:FF8e6d4b br:FF8e6d4b")
				local item2 = guiCreateStaticImage(0, 0, 1, 1, item[3], true, item1)
				setElementCallPropagationEnabled(item2, false)
				local item3 = guiCreateStaticImage(0, 0, 1, 1, "images/empty.png", true, item1)
				local itemcount = guiCreateLabel(0, 0, 0.91, 0.91,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				guiLabelSetColor(itemcount,0,0,0)
				local itemcount = guiCreateLabel(0, 0, 0.9, 0.9,"",true,item1);
				guiSetFont(itemcount,"default-bold-small")
				guiLabelSetHorizontalAlign(itemcount,"right",false);
				guiLabelSetVerticalAlign(itemcount,"bottom");
				guiSetEnabled(itemcount,false)
				setElementData(item1,"data",item[1]);
				table.insert(inv_loot.staticimage,item1);
				guiSetVisible(item1,false);
			end
		end
	end
end
createLootItems()

bindKey("j", "down", function(key, keyState)
	if getElementData(localPlayer, "logedin") then
		if (getElementData(localPlayer,"isDead")) then return end
		if (keyState == "down") then
			if not (isPlayerInLoot()) then
				if (not guiGetVisible(inv_bp.parent[1])) then
					onClientOpenInventoryStopMenu();
					if (guiGetVisible(inv_loot.parent[1])) then guiSetVisible(inv_loot.parent[1],false); end
					guiSetPosition(inv_bp.parent[1],sW/2-inv_w/2,sH/2-inv_h/2,false)
					guiSetVisible(inv_bp.parent[1],true);
					refreshInventory();
					showCursor(true);
				else
					if (guiGetVisible(inv_loot.parent[1])) then guiSetVisible(inv_loot.parent[1],false); end
					guiSetVisible(inv_bp.parent[1],false);
					showCursor(false);
					removeDescription()
					removeInfoBox()
				end
			else
				if (not guiGetVisible(inv_bp.parent[1]) and not guiGetVisible(inv_loot.parent[1])) then
					onClientOpenInventoryStopMenu();
					guiSetPosition(inv_bp.parent[1],sW/2-inv_w/2+(loot_w/2),sH/2-inv_h/2,false)
					guiSetPosition(inv_loot.parent[1],sW/2-loot_w/2-(inv_w/2),sH/2-inv_h/2,false)
					guiSetVisible(inv_bp.parent[1],true);
					guiSetVisible(inv_loot.parent[1],true);
					refreshInventory();
					refreshLoot();
					refreshLoot(getElementData(localPlayer, "currentCol"), getElementData(localPlayer, "lootname"));
					showCursor(true);
				else
					guiSetVisible(inv_bp.parent[1],false);
					guiSetVisible(inv_loot.parent[1],false);
					showCursor(false);
					removeDescription()
					removeInfoBox()
				end
			end
		end
	end 
end);

function getWeaponAmmoType(weapon)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (weapon == v[2]) then return v[1], v[3]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (weapon == v[1]) then return v[1], v[2]; end
	end
	return false, false;
end

function getWeaponIDFromDayZName(weapon)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (weapon == v[2]) then return v[3]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (weapon == v[1]) then return v[2]; end
	end
	return false;
end

function getItemDescription(item)
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		for i,v in ipairs(inventoryItems[v]) do
			if (item == v[1]) then
				return v[4];
			end
		end
	end
	return false;
end

function getItemCapacity(item)
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		for i,v in ipairs(inventoryItems[v]) do
			if (item == v[1]) then
				return v[2];
			end
		end
	end
	return false;
end

function showInventoryManual()
	if (getElementData(localPlayer,"isDead")) then return end
	guiSetPosition(inv_bp.parent[1],sW/2-inv_w/2,sH/2-inv_h/2,false)
	guiSetVisible(inv_bp.parent[1],true);
	if isPlayerInLoot() then
		guiSetPosition(inv_bp.parent[1],sW/2-inv_w/2+(loot_w/2),sH/2-inv_h/2,false)
		guiSetPosition(inv_loot.parent[1],sW/2-loot_w/2-(inv_w/2),sH/2-inv_h/2,false)
		guiSetVisible(inv_bp.parent[1],true);
		guiSetVisible(inv_loot.parent[1],true);
	end
	refreshInventory();
	showCursor(true);
	if (guiGetVisible(inv_bp.parent[1])) then
		onClientOpenInventoryStopMenu();
	end
end

function hideInventoryManual()
	if (guiGetVisible(inv_bp.parent[1])) then
		guiSetVisible(inv_bp.parent[1],false);
		if isPlayerInLoot() then
			guiSetVisible(inv_loot.parent[1],false);
		end
		showCursor(false);
		removeDescription();
		removeInfoBox();
	end
end
addEventHandler("hideInventoryManual", localPlayer, hideInventoryManual);

function hideInventoryManual2()
	guiSetPosition(inv_bp.parent[1],sW/2-inv_w/2,sH/2-inv_h/2,false)
	guiSetVisible(inv_loot.parent[1],false);
	removeDescription();
	removeInfoBox();
end
addEventHandler("hideInventoryManual2", localPlayer, hideInventoryManual2);

function refreshInventoryManual()
	refreshInventory();
end
addEventHandler("refreshInventoryManual", localPlayer, refreshInventoryManual);

function refreshLootManual(loot)
	refreshLoot(loot);
end
addEventHandler("refreshLootManual", localPlayer, refreshLootManual);


addEventHandler("onClientGUIDoubleClick",root,function()
	for i,v in pairs(inv_bp.column) do
		if (source == v) then
			setElementData(localPlayer,"show_"..i,not getElementData(localPlayer,"show_"..i))
			refreshInventory()
		end
	end
end);


function refreshInventory()
	--if (inv_bp.col[1]) then
	local x, y = 0, 0
	local nextY = 0
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		local index = _
		local category = v;
		local categoryName = nil
		for _,v in pairs(inv_bp.column) do
			if index == _ then
				categoryName = v;
				guiSetPosition(v,0,y,false);
				guiSetVisible(v,false)
			end
		end
		if getElementData(localPlayer,"show_"..category) == false then
			nextY = nextY+15;
		end
		y = y + 18;
		for i,item in ipairs(inventoryItems[v]) do
			for _,v in pairs(inv_bp.staticimage) do
				if (getElementData(v,"data") == item[1]) then
					if (getElementData(localPlayer, item[1]) > 0) then
						local text = "[+] "..getLanguageTextClient(keyTable[category]);
						local newtext = string.gsub(text,":","");
						guiSetText(categoryName,newtext)
						guiSetSize(categoryName,dxGetTextWidth(newtext,1,"default-bold")+10,15,false);
						guiSetVisible(categoryName,true)
						guiSetVisible(v,false)
						local native_x = guiStaticImageGetNativeSize(v);
						if getElementData(localPlayer,"show_"..category) then
							text = "[-] "..getLanguageTextClient(keyTable[category]);
							guiSetText(categoryName,text)
							guiSetSize(categoryName,dxGetTextWidth(text,1,"default-bold")+10,15,false);
							if (native_x == 234) then
								if x + 117 >= inv_w-55 then
									x = 0
									y = nextY
								end
								if (getElementChild(v,2) and getElementChild(v,3)) then
									guiSetText(getElementChild(v,2),"x"..getElementData(localPlayer,item[1]))
									guiSetText(getElementChild(v,3),"x"..getElementData(localPlayer,item[1]))
									if (string.find(guiGetText(getElementChild(v,4)),"EQ")) then
										guiSetText(getElementChild(v,4),"")
										guiSetText(getElementChild(v,5),"")
									end
									for i=1,3 do
										if (getElementData(localPlayer,"currentweapon_"..tostring(i)) == item[1]) then
											guiSetText(getElementChild(v,4),"EQ")
											guiSetText(getElementChild(v,5),"EQ")
										end
									end
								end
								guiSetVisible(v,true)
								guiSetPosition(v,x,y,false)
								if nextY <= y then
									nextY = y + 57 + 5;
								end
								x = x + 117 + 5;
							elseif (native_x == 114) then
								if x + 57 >= inv_w-55 then
									x = 0
									y = nextY
								end
								if (getElementChild(v,2) and getElementChild(v,3)) then
									guiSetText(getElementChild(v,2),"x"..getElementData(localPlayer,item[1]))
									guiSetText(getElementChild(v,3),"x"..getElementData(localPlayer,item[1]))
									if (string.find(guiGetText(getElementChild(v,4)),"EQ")) then
										guiSetText(getElementChild(v,4),"")
										guiSetText(getElementChild(v,5),"")
									end
									for i=1,3 do
										if (getElementData(localPlayer,"currentweapon_"..tostring(i)) == item[1]) then
											guiSetText(getElementChild(v,4),"EQ")
											guiSetText(getElementChild(v,5),"EQ")
										end
									end
								end
								guiSetPosition(v,x,y,false)
								guiSetVisible(v,true)
								if nextY <= y then
									nextY = y + 57 + 5;
								end
								x = x + 57 + 5;
							end
						end
					else
						guiSetPosition(v,0,0,false)
						guiSetVisible(v,false)
					end
				end
			end
		end
		x = 0;
		y = nextY+1;
	end
	guiSetText(inv_bp.label[1], getLanguageTextClient("inventorytext1")..": "..getElementCurrentSlots(localPlayer).."/"..getElementMaxSlots(localPlayer));
	--end
end

function refreshLoot(loot, gearName)
	if not loot then
		return false;
	end
	local x, y = 0, 0
	local nextY = 0
	for _,v in pairs({1,2,3,4,5,6,7,8,9}) do
		for i,item in ipairs(inventoryItems[v]) do
			for _,v in pairs(inv_loot.staticimage) do
				if (getElementData(v,"data") == item[1]) then
					if ((getElementData(loot, item[1]) or 0) >= 1) then
						local native_x = guiStaticImageGetNativeSize(v);
						if (native_x == 234) then
							if x + 117 >= loot_w-55 then
								x = 0
								y = nextY
							end
							if (getElementChild(v,2) and getElementChild(v,3)) then
								guiSetText(getElementChild(v,2),"x"..getElementData(loot,item[1]))
								guiSetText(getElementChild(v,3),"x"..getElementData(loot,item[1]))
							end
							guiSetVisible(v,true)
							guiSetPosition(v,x,y,false)
							if nextY <= y then
								nextY = y + 57 + 5;
							end
							x = x + 117 + 5;
						elseif (native_x == 114) then
							if x + 57 >= loot_w-55 then
								x = 0
								y = nextY
							end
							if (getElementChild(v,2) and getElementChild(v,3)) then
								guiSetText(getElementChild(v,2),"x"..getElementData(loot,item[1]))
								guiSetText(getElementChild(v,3),"x"..getElementData(loot,item[1]))
							end
							guiSetPosition(v,x,y,false)
							guiSetVisible(v,true)
							if nextY <= y then
								nextY = y + 57 + 5;
							end
							x = x + 57 + 5;
						end
					else
						guiSetPosition(v,0,0,false)
						guiSetVisible(v,false)
					end
				end
			end
		end
	end
	guiSetText(inv_loot.label[1], getLanguageTextClient("inventorytext1")..": "..getElementCurrentSlots(loot).."/"..getElementMaxSlots(loot));
end

addEventHandler("onClientElementDataChange",localPlayer,function(dataName)
	if (dataName == "setting.servertheme") then
		if (getElementData(localPlayer,"setting.servertheme") == 1) then
			for _,v in pairs(inv_bp.staticimage) do
				local hex = "8e6d4b";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
			for _,v in pairs(inv_loot.staticimage) do
				local hex = "8e6d4b";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
		elseif (getElementData(localPlayer,"setting.servertheme") == 2) then
			for _,v in pairs(inv_bp.staticimage) do
				local hex = "5487b1";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
			for _,v in pairs(inv_loot.staticimage) do
				local hex = "5487b1";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
		elseif (getElementData(localPlayer,"setting.servertheme") == 3) then
			for _,v in pairs(inv_bp.staticimage) do
				local hex = "a0d15c";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
			for _,v in pairs(inv_loot.staticimage) do
				local hex = "a0d15c";
				guiSetProperty(v,"ImageColours","tl:FF"..hex.." tr:FF"..hex.." bl:FF"..hex.." br:FF"..hex.."");
			end
		end
	end
end);

function getElementMaxSlots(element)
	return getElementData(element, "MAX_Slots") or 0;
end

function getElementCurrentSlots(element)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			local data = getElementData(element, v[1]);
			if (data and data >= 1) then
				current_SLOTS = current_SLOTS+v[2]*data;
			end
		end
	end
	return math.floor(current_SLOTS);
end

function getItemSlots(itemn)
	local current_SLOTS = 0;
	for _,k in pairs({1,2,3,4,5,6,7,8,9}) do
		for _,v in ipairs(inventoryItems[k]) do
			if (itemn == v[1]) then return v[2]; end
		end
	end
	return false;
end

function isToolbeltItem(itemn)
	--if (string.find(itemn,"currency")) then return true; end
	for _,v in ipairs(inventoryItems[9]) do
		if (itemn == v[1]) then return true; end
	end
	return false;
end

function getVehicleAddonInfos (id)
	for _,v in ipairs(vehicleAddonsInfo) do
		if (v[1] == id) then return v[2], v[3], v[4], v[5], v[6], v[7]; end
	end
end

function getVehicleMaxFuel(loot)
	for _,v in ipairs(vehicleFuelTable) do
		if (getElementModel(getElementData(loot, "parent")) == v[1]) then return v[2]; end
	end
	return false;
end

function fillgas(veh)
	if ((getElementData(veh, "fuel")+20) < getVehicleMaxFuel(veh)) then
		addingfuel = 20;
	elseif ((getElementData(veh, "fuel")+20) > (getVehicleMaxFuel(veh) + 15)) then
		startRollMessage("clientinfotext13", 160, 40, 40);
		return;
	else
		addingfuel = getVehicleMaxFuel(veh)-getElementData(veh, "fuel");
	end
	triggerServerEvent("setPlayerUseAnimation",localPlayer);
	setTimer(function()
		setElementData(veh, "fuel", getElementData(veh, "fuel")+addingfuel);
		setElementData(localPlayer, "item9", getElementData(localPlayer, "item9") - 1);
		setElementData(localPlayer, "item10", getElementData(localPlayer, "item10") + 1);
		refreshInventory();
		startRollMessage("clientinfotext14", 40, 160, 40);
	end,2000,1);
	local sound = playSound("sounds/refuel.ogg",false);
	setElementData(localPlayer,"isInAction",true);
	setTimer(function()
		setElementData(localPlayer,"isInAction",false);
		stopSound(sound);
	end, 3000, 1);
end
addEvent("onClientFillGas",true);
addEventHandler("onClientFillGas", root, fillgas);

function moveInventoryItemOut()
	if (getElementData(localPlayer,"isInAction")) then return; end
	if (not getInventorySelectedItem() or getElementData(localPlayer, getInventorySelectedItem()) <= 0) then return end
	local realdoubleclick = false;
	if getElementType(source) == "gui-staticimage" then
		if source == getInventorySelectedGUI() then
			realdoubleclick = true;
		end
	end
	if getElementType(source) ~= "gui-button" and realdoubleclick == false then return; end
	local itemName = getInventorySelectedItem();
	if (getElementData(localPlayer, itemName) and getElementData(localPlayer, itemName) >= 1) then
		if isPlayerInLoot() then
			if isToolbeltItem(itemName) then
				triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
				removeInfoBox()
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end, 700, 1);
			elseif getElementCurrentSlots(getElementData(localPlayer, "currentCol")) + getItemSlots(itemName) <= getElementMaxSlots(isPlayerInLoot()) then
				triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot());
				removeInfoBox()
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end, 700, 1);
			else
				startRollMessage("clientinfotext15", 160, 40, 40);
				return;
			end 
		else
			triggerEvent("onPlayerMoveItemOutOFInventory", localPlayer, itemName, isPlayerInLoot())
			removeInfoBox()
			setElementData(localPlayer,"isInAction",true);
			setTimer(function()
				setElementData(localPlayer,"isInAction",false);
			end, 700, 1);
		end 
	end
	local col = getElementData(localPlayer, "currentCol");
	setTimer(refreshInventory, 200, 2);
	if isPlayerInLoot() then
		setTimer(refreshLoot, 200, 2, col);
	end
end
addEventHandler("onClientGUIClick", inv_bp.button[1], moveInventoryItemOut,false);
addEventHandler("onClientGUIDoubleClick", inv_bp.scrollpane[1], moveInventoryItemOut);

addEventHandler("onPlayerMoveItemOutOFInventory", root, function(itemName, loot)
	local itemPlus = 1;
	if (getMagazineSize(itemName)) then itemPlus = getMagazineSize(itemName); end
	local itemName2 = itemName;
	if (itemName == "Tire_inVehicle") then itemName2 = "vehiclepart3"; end
	if (itemName == "Engine_inVehicle") then itemName2 = "vehiclepart1"; end
	if (itemName == "Parts_inVehicle") then itemName2 = "vehiclepart4"; end
	if (itemName == "Scrap_inVehicle") then itemName2 = "vehiclepart5"; end
	if (itemName == "Rotor_inVehicle") then itemName2 = "vehiclepart2"; end
	if ((getElementData(localPlayer, itemName2)/itemPlus) < 1) then
		itemPlus = getElementData(localPlayer, itemName2);
	end
	for i=1,3 do
		if (itemName == getElementData(localPlayer,"currentweapon_"..tostring(i))) then
			triggerServerEvent("removeBackWeaponOnDrop", localPlayer, true, i);
		end
	end
	if loot then
		setElementData(loot, itemName, (getElementData(loot, itemName) or 0) + itemPlus);
		if (#getElementsWithinColShape(loot, "player") > 1) then
			triggerServerEvent("onPlayerChangeLoot", root, loot);
		end
	else
		triggerServerEvent("playerDropAItem", localPlayer, itemName, itemPlus);
	end
	if (itemName == "Tire_inVehicle") then itemName = "vehiclepart3"; end
	if (itemName == "Engine_inVehicle") then itemName = "vehiclepart1"; end
	if (itemName == "Parts_inVehicle") then itemName = "vehiclepart4"; end
	if (itemName == "Scrap_inVehicle") then itemName = "vehiclepart5"; end
	if (itemName == "Rotor_inVehicle") then itemName = "vehiclepart2"; end
	setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) - itemPlus);
	if (loot and getElementData(loot, "itemloot")) then
		triggerServerEvent("refreshItemLoot", root, loot, getElementData(loot, "parent"));
	end
end);

function moveLootItemOut()
	if (getElementData(localPlayer,"isInAction")) then return; end
	if (not getLootSelectedItem() or getElementData(isPlayerInLoot(), getLootSelectedItem()) <= 0) then return end
	local realdoubleclick = false;
	if getElementType(source) == "gui-staticimage" then
		if source == getLootSelectedGUI() then
			realdoubleclick = true;
		end
	end
	if getElementType(source) ~= "gui-button" and realdoubleclick == false then return; end
	local itemName = getLootSelectedItem()
	if isPlayerInLoot() and itemName then
		if (getElementData(isPlayerInLoot(), itemName) and getElementData(isPlayerInLoot(), itemName) >= 1) then
			if not isToolbeltItem(itemName) then
				if (getElementCurrentSlots(localPlayer)+getItemSlots(itemName) <= getElementMaxSlots(localPlayer)) then
					triggerEvent("onPlayerMoveItemInInventory", localPlayer, itemName, isPlayerInLoot());
					removeInfoBox()
					setElementData(localPlayer,"isInAction",true);
					setTimer(function()
						setElementData(localPlayer,"isInAction",false);
					end, 700, 1);
				else
					startRollMessage("clientinfotext16", 160, 40, 40);
					return;
				end
			else
				removeInfoBox()
				setElementData(localPlayer,"isInAction",true);
				setTimer(function()
					setElementData(localPlayer,"isInAction",false);
				end, 700, 1);
				triggerEvent("onPlayerMoveItemInInventory", localPlayer, itemName, isPlayerInLoot());
			end
		end
		if isPlayerInLoot() then
			setTimer(refreshInventory, 200, 2);
			setTimer(refreshLoot, 200, 2, getElementData(localPlayer, "currentCol"));
		end
	end
end
addEventHandler("onClientGUIClick", inv_loot.button[1], moveLootItemOut,false);
addEventHandler("onClientGUIDoubleClick", inv_loot.scrollpane[1], moveLootItemOut);

addEventHandler("onPlayerMoveItemInInventory", root, function(itemName, loot)
	local itemPlus = 1;
	if (getMagazineSize(itemName)) then itemPlus = getMagazineSize(itemName); end
	if ((getElementData(loot, itemName)/itemPlus) < 1) then
		itemPlus = getElementData(loot, itemName);
	end
	if loot then
		setElementData(localPlayer, itemName, getElementData(localPlayer, itemName) + itemPlus);
		if (itemPlus ~= 0) then
			setElementData(loot, itemName, getElementData(loot, itemName) - itemPlus);
		end
		if (#getElementsWithinColShape(loot, "player") > 1) then triggerServerEvent("onPlayerChangeLoot", root, loot); end
	end
	if getElementData(loot, "itemloot") then
		triggerServerEvent("refreshItemLoot", root, loot, getElementData(loot, "parent"));
	end
end);

function onClientOpenInventoryStopMenu()
	triggerEvent("disableMenu", localPlayer);
end

function isPlayerInLoot()
	if getElementData(localPlayer, "loot") then
		return getElementData(localPlayer, "currentCol");
	end
	return false;
end

function getInventoryInfosForRightClickMenu(itemName)
	for _,v in ipairs(inventoryItems[1]) do
		if (getElementData(localPlayer,"currentweapon_1") == itemName) then
			if (itemName == v[1]) then return itemName, "inventoryactiontext2"; end
		else
			if (itemName == v[1]) then return itemName, "inventoryactiontext1"; end
		end
	end
	for _,v in ipairs(inventoryItems[2]) do
		if (getElementData(localPlayer,"currentweapon_2") == itemName) then
			if (itemName == v[1]) then return itemName, "inventoryactiontext4"; end
		else
			if (itemName == v[1]) then return itemName, "inventoryactiontext3"; end
		end
	end
	for _,v in ipairs(inventoryItems[3]) do
		if (getElementData(localPlayer,"currentweapon_3") == itemName) then
			if (itemName == v[1]) then return itemName, "inventoryactiontext6"; end
		else
			if (itemName == v[1]) then return itemName, "inventoryactiontext5"; end
		end
	end
	for _,v in ipairs(inventoryItems[4]) do
		if (itemName == v[1]) then return itemName, false; end 
	end
	for _,v in ipairs(inventoryItems[5]) do
		if (itemName == v[1]) then
			if (v[1] == "fooditem1" or v[1] == "fooditem6" or v[1] == "fooditem7") then
				info = "inventoryactiontext7";
			else
				info = "inventoryactiontext8";
			end
			return itemName, info;
		end
	end
	for _,category in ipairs({6,7,8,9}) do
		for _,v in ipairs(inventoryItems[category]) do
			if (itemName == v[1]) then return itemName, v[5] or false; end
		end
	end
end

-- [[ NEW INVENTORY FUNCTIONS *REQUIRED* ]]
addEventHandler("onClientRender", root, function()
	if (guiGetVisible(inv_loot.parent[1])) then
		local x,y = guiGetPosition(inv_loot.parent[1],false);
		local w,h = guiGetSize(inv_loot.parent[1],false);
		local text = ">>";
		local tWidth = dxGetTextWidth(text);
		local tHeight = dxGetFontHeight(1,"default");
		local isInAction = getElementData(localPlayer,"isInAction");
		dxDrawDayzWindow(x, y, w, h, dxServerTheme, false, "corner");
		dxDrawDayzWindow(x+w-40, y+10, 30, h-30, dxServerTheme, false, "right");
		dxDrawText(text,(x+w-40)+(tWidth*0.4),(y+h/2)-tHeight);
		dxDrawRectangle(x+10, y+10, w-50, 48, tocolor(0, 0, 0, 100));
		dxDrawText(getLanguageTextClient("inventorytext2"),x+10+5+1, y+10,x+50+1, y+10+48+1,tocolor(0,0,0),0.8,"default-bold","left","center");
		dxDrawText(getLanguageTextClient("inventorytext2"),x+10+5, y+10,x+50, y+10+48,tocolor(255,255,255),0.8,"default-bold","left","center");
		dxDrawRectangle(x+10, y+10+48+5, w-50, h-30-48-5, tocolor(0, 0, 0, 100));
		if (not isInAction and isCursorOnElement(x+w-40, y+10, 30, h-30)) then
			dxDrawDayzWindow(x+w-40, y+10, 30, h-30, tocolor(0, 0, 0, 20), false, "right");
		end
		if (isInAction) then
			dxDrawDayzWindow(x+w-40, y+10, 30, h-30, tocolor(0, 0, 0, 100), false, "right");
		end
	end
	if (guiGetVisible(inv_bp.parent[1])) then
		local x,y = guiGetPosition(inv_bp.parent[1],false);
		local w,h = guiGetSize(inv_bp.parent[1],false);
		local text = "<<";
		local tWidth = dxGetTextWidth(text);
		local tHeight = dxGetFontHeight(1,"default");
		local isInAction = getElementData(localPlayer,"isInAction");
		local helmet = getElementData(localPlayer,"helmet");
		local vest = getElementData(localPlayer,"vest");
		local hdr;
		local alphaH = 200;
		local vdr;
		local alphaV = 200;
		if helmet ~= "" and helmet ~= "helmet6" and helmet ~= "helmet7" then
			hdr = (helmetDamageReduction[helmet]*100)-100;
		else
			hdr = 0;
		end
		if vest ~= "" then
			vdr = (vestDamageReduction[vest]*100)-100;
		else
			vdr = 0;
		end
		if (hdr == 0) then alphaH = 150; end
		if (vdr == 0) then alphaV = 150; end
		dxDrawDayzWindow(x, y, w, h, dxServerTheme, false, "corner");
		dxDrawDayzWindow(x+10, y+10, 30, h-30, dxServerTheme, false, "left");
		dxDrawText(text,x+10+(tWidth*0.4),(y+h/2)-tHeight);
		dxDrawRectangle(x+40, y+10, w-50, 48, tocolor(0, 0, 0, 100));
		dxDrawImage(x+50-5, y+11.5, 48, 48, "images/armor.png",0,0,0,tocolor(255,255,255,alphaV));
		dxDrawText(vdr.."%",x+50-5+1, y+11.5+30+1,x+50-5+48+1, y+11.5+30+1,tocolor(0,0,0),1,"default-bold","center","top");
		dxDrawText(vdr.."%",x+50-5, y+11.5+30,x+50-5+48, y+11.5+30,tocolor(255,255,255),1,"default-bold","center","top");
		dxDrawImage(x+50+5+48-5, y+11.5, 48, 48, "images/helmet.png",0,0,0,tocolor(255,255,255,alphaH));
		dxDrawText(hdr.."%",x+50+5+48-5+1, y+11.5+30+1,x+50+5+48-5+48+1, y+11.5+30+1,tocolor(0,0,0),1,"default-bold","center","top");
		dxDrawText(hdr.."%",x+50+5+48-5, y+11.5+30,x+50+5+48-5+48, y+11.5+30,tocolor(255,255,255),1,"default-bold","center","top");
		dxDrawRectangle(x+40, y+10+48+5, w-50, h-30-48-5, tocolor(0, 0, 0, 100));
		if (not isInAction and isCursorOnElement(x+10, y+10, 30, h-30)) then
			dxDrawDayzWindow(x+10, y+10, 30, h-30, tocolor(0, 0, 0, 20), false, "left");
		end
		if (isInAction) then
			dxDrawDayzWindow(x+10, y+10, 30, h-30, tocolor(0, 0, 0, 100), false, "left");
		end
	end
end);

function drawInfoBox(itemName,itemInfo,mX,mY)
	removeDescription()
	local tWidth = dxGetTextWidth(getLanguageTextClient(itemInfo),1,"default");
	local tHeight = dxGetFontHeight(1,"default");
	function onClientRenderInfoBox()
		local color = tocolor(255,255,255,255)
		if (isCursorOnElement(mX+5, mY+5, tWidth+20, tHeight+12)) then
			color = tocolor(220,220,220,220)
		end
		dxDrawDayzWindow(mX+5, mY+5, tWidth+20, tHeight+12, dxServerTheme, true);
		dxDrawText(getLanguageTextClient(itemInfo), mX+15, mY+10, tWidth+20, tHeight+12, color,1,"default","left","top",false,false,true);
	end
	addEventHandler("onClientRender",root,onClientRenderInfoBox);
	guiSetText(inv_bp.label[2],itemInfo);
	guiSetSize(inv_bp.label[2],tWidth+20, tHeight+12,false);
	guiSetPosition(inv_bp.label[2],mX+5, mY+5,false);
	guiSetEnabled(inv_bp.label[2],true);
	setElementData(inv_bp.label[2],"iteminfo",{itemName,itemInfo})
end

function drawDescription(element)
	function onClientRenderDescription()
		if guiGetEnabled(inv_bp.label[2]) or not isCursorShowing() then return end
		local mX,mY = getCursorPosition();
		mX,mY =  sW * mX, sH * mY;
		local name = getElementData(element,"data");
		local name2 = getLanguageTextClient(name);
		local text = name2;
		local text2 = "";
		if (getItemDescription(name)) then
			text = text.."\n#202020"..getItemCapacity(name).." "..getLanguageTextClient("inventorydescription52");
			text2 = getLanguageTextClient(getItemDescription(name));
		end
		if (getWeaponDamageFromName(name)) then
			text = text.."\n#202020"..getItemCapacity(name).." "..getLanguageTextClient("inventorydescription52");
			text2 = getLanguageTextClient("inventorydescription60").."\n  "..getLanguageTextClient("inventorydescription1")..": "..getWeaponDamageFromName(name).."\n  "..getLanguageTextClient("inventorydescription53")..": "..getWeaponVehicleDamageFromName(name).."\n  "..getLanguageTextClient("inventorydescription54")..": "..fireRateToText(getWeaponFireRateFromName(name)).."\n  "..getLanguageTextClient("inventorydescription61")..": "..getWeaponNoiseName(name);
		end
		local lineCount = select(2, text:gsub('\n', '\n')) + select(2, text2:gsub('\n', '\n'));
		local tWidth;
		if (dxGetTextWidth(text,1,"default",true) >= dxGetTextWidth(text2,1,"default",true)) then
			tWidth = dxGetTextWidth(text,1,"default",true)
		else
			tWidth = dxGetTextWidth(text2,1,"default",true)
		end
		local tHeight = dxGetFontHeight(1,"default")*(lineCount+1);
		dxDrawDayzWindow(mX+5, mY+5, tWidth+20, tHeight+44, dxServerTheme, true);
		dxDrawText(text, mX+15, mY+18, 0, 0, tocolor(255,255,255,255),1,"default","left","top",false,false,true,true);
		dxDrawText(text2, mX+15, mY+53, 0, 0, tocolor(255,255,255,255),1,"default","left","top",false,false,true,true);
	end
	addEventHandler("onClientRender",root,onClientRenderDescription);
end

addEventHandler("onClientRender",root,function()
	if (isCursorShowing() and guiGetVisible(inv_bp.parent[1]) and getElementData(localPlayer,"isInAction")) then
		local mX,mY = getCursorPosition();
		mX,mY =  sW * mX, sH * mY;
		loadRotation = loadRotation+10;
		dxDrawImage(mX-10,mY-9,28,28,"images/loader.png",loadRotation,0,0,tocolor(255,255,255,255),true);
	end
end);

addEventHandler("onClientMouseWheel",inv_bp.scrollpane[1],function(up_down)
	if (up_down == 1) then
		guiScrollPaneSetVerticalScrollPosition(inv_bp.scrollpane[1],guiScrollPaneGetVerticalScrollPosition(inv_bp.scrollpane[1])-4)
	elseif (up_down == -1) then
		guiScrollPaneSetVerticalScrollPosition(inv_bp.scrollpane[1],guiScrollPaneGetVerticalScrollPosition(inv_bp.scrollpane[1])+4)
	end
end);

addEventHandler("onClientMouseWheel",inv_loot.scrollpane[1],function(up_down)
	if (up_down == 1) then
		guiScrollPaneSetVerticalScrollPosition(inv_loot.scrollpane[1],guiScrollPaneGetVerticalScrollPosition(inv_loot.scrollpane[1])-4)
	elseif (up_down == -1) then
		guiScrollPaneSetVerticalScrollPosition(inv_loot.scrollpane[1],guiScrollPaneGetVerticalScrollPosition(inv_loot.scrollpane[1])+4)
	end
end);

addEventHandler("onClientMouseEnter",resourceRoot,function()
	if (getElementData(source,"data")) then
		drawDescription(source);
	end
end);

addEventHandler("onClientMouseLeave",resourceRoot,function()
	removeDescription()
end);

addEventHandler("onClientGUIClick",root,function()
	if (source == inv_bp.label[2]) then
		if (getElementData(localPlayer,"isInAction")) then
			startRollMessage("clientinfotext17", 160, 40, 40);
			removeInfoBox()
			return;
		end
		local itemName,itemInfo = unpack(getElementData(inv_bp.label[2], "iteminfo"));
		playerUseItem(itemName, itemInfo);
		removeInfoBox()
	end
end);

addEventHandler("onClientGUIClick",inv_bp.scrollpane[1],function(button)
	removeInfoBox()
	if (getElementData(source,"data")) then
		local mX,mY = getCursorPosition();
		mX,mY =  sW * mX, sH * mY;
		clearInventorySelectedItems()
		setInventoryItemSelected(source,true);
		if (button == "right") then
			if (isCursorShowing() and guiGetVisible(inv_bp.parent[1])) then
				local itemName,itemInfo = getInventoryInfosForRightClickMenu(getInventorySelectedItem());
				if (itemName == false or itemInfo == false) then return; end
				if (itemName == "toolbelt5") then if (getElementData(localPlayer, "item1") == 0) then return; end
				elseif (itemName == "medicine5") then if (getElementData(localPlayer, "bleeding") == 0) then return; end
				elseif (itemName == "medicine1") then if (getElementData(localPlayer, "blood") > 9000) then return; end
				elseif (itemName == "medicine2") then if (getElementData(localPlayer, "blood") > 10500) then return; end
				elseif (itemName == "medicine3") then if (getElementData(localPlayer, "blood") > 11500) then return; end
				elseif (itemName == "medicine4") then if (getElementData(localPlayer, "temperature") > 36.50) then return; end
				elseif (itemName == "medicine6") then if not getElementData(localPlayer, "pain") then return; end
				elseif (itemName == "medicine8") then if not getElementData(localPlayer, "brokenbone") then return; end end
				drawInfoBox(itemName,itemInfo,mX,mY);
			end
		end
	end
end);

addEventHandler("onClientGUIClick",inv_loot.scrollpane[1],function(button)
	removeInfoBox()
	if (getElementData(source,"data")) then
		clearLootSelectedItems()
		setLootItemSelected(source,true);
	end
end);

function removeDescription()
	if isEventHandlerAdded("onClientRender",root,onClientRenderDescription) then
		removeEventHandler("onClientRender",root,onClientRenderDescription);
	end
end

function removeInfoBox()
	if isEventHandlerAdded("onClientRender",root,onClientRenderInfoBox) then
		removeEventHandler("onClientRender",root,onClientRenderInfoBox);
		guiSetEnabled(inv_bp.label[2],false);
		guiSetText(inv_bp.label[2],"");
	end
end

function table.empty(a)
    if type(a) ~= "table" then
        return false
    end
    return next(a) == nil
end

function clearInventorySelectedItems()
	local element = getElementChildren(inv_bp.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (isElement(getElementChild(v,1)) and getElementData(getElementChild(v,1),"selected")) then
			guiStaticImageLoadImage(getElementChild(v,1),"images/empty.png");
			setElementData(getElementChild(v,1),"selected",false)
		end
	end
end

function setInventoryItemSelected(item,boolean)
	local element = getElementChildren(inv_bp.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (item == getElementChild(v,1)) then
			local native_x = guiStaticImageGetNativeSize(getElementChild(v,0));
			if (native_x == 234) then
				guiStaticImageLoadImage(item,"images/inventory/acons/117_BP.png");
				setElementData(item,"selected",boolean)
			elseif (native_x == 114) then
				guiStaticImageLoadImage(item,"images/inventory/acons/57_BP.png");
				setElementData(item,"selected",boolean)
			end
		end
	end
end

function getInventorySelectedItem()
	local element = getElementChildren(inv_bp.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (getElementChild(v,1) and getElementData(getElementChild(v,1),"selected")) then
			return getElementData(getElementChild(v,1),"data");
		end
	end
end

function getInventorySelectedGUI()
	local element = getElementChildren(inv_bp.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (getElementChild(v,1) and getElementData(getElementChild(v,1),"selected")) then
			return getElementChild(v,1)
		end
	end
end

function clearLootSelectedItems()
	local element = getElementChildren(inv_loot.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (isElement(getElementChild(v,1)) and getElementData(getElementChild(v,1),"selected")) then
			guiStaticImageLoadImage(getElementChild(v,1),"images/empty.png");
			setElementData(getElementChild(v,1),"selected",false)
		end
	end
end

function setLootItemSelected(item,boolean)
	local element = getElementChildren(inv_loot.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (item == getElementChild(v,1)) then
			local native_x = guiStaticImageGetNativeSize(getElementChild(v,0));
			if (native_x == 234) then
				guiStaticImageLoadImage(item,"images/inventory/acons/117_LT.png");
				setElementData(item,"selected",boolean)
			elseif (native_x == 114) then
				guiStaticImageLoadImage(item,"images/inventory/acons/57_LT.png");
				setElementData(item,"selected",boolean)
			end
		end
	end
end

function getLootSelectedItem()
	local element = getElementChildren(inv_loot.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (getElementChild(v,1) and getElementData(getElementChild(v,1),"selected")) then
			return getElementData(getElementChild(v,1),"data");
		end
	end
end

function getLootSelectedGUI()
	local element = getElementChildren(inv_loot.scrollpane[1],getElementByID("gui-staticimage"))
	for _,v in ipairs(element) do
		if (getElementChild(v,1) and getElementData(getElementChild(v,1),"selected")) then
			return getElementChild(v,1)
		end
	end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
    local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                return true
                end
            end
        end
    end
    return false
end

function isCursorOnElement(x,y,w,h)
	if (not isCursorShowing()) then return; end
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end
-- [[ NEW INVENTORY FUNCTIONS *REQUIRED* ]]

function showChannelEdit(cType)
	local sW,sH = guiGetScreenSize();
	rwindow.channel[1] = guiCreateWindow((sW-96)/2, (sH-89)/2, 96, 89, getLanguageTextClient(cType), false);
	if (cType == "toolbelt2") then
		rwindow.channel[2] = guiCreateEdit(10, 24, 76, 26, tostring(getElementData(localPlayer, "gpschannel")), false, rwindow.channel[1]);
	elseif (cType == "toolbelt8") then
		rwindow.channel[2] = guiCreateEdit(10, 24, 76, 26, tostring(getElementData(localPlayer, "radiochannel")), false, rwindow.channel[1]);
	end
	rwindow.channel[3] = guiCreateButton(10, 54, 44, 27, "ok", false, rwindow.channel[1]);
	rwindow.channel[4] = guiCreateButton(57, 54, 29, 27, "x", false, rwindow.channel[1]);
	guiSetProperty(rwindow.channel[1], "AlwaysOnTop", "True")
	guiSetInputMode("no_binds_when_editing");
	guiWindowSetMovable(rwindow.channel[1], false);
	guiWindowSetSizable(rwindow.channel[1], false);
	guiEditSetMaxLength(rwindow.channel[2], 5);
	Type = cType;
	addEventHandler("onClientGUIChanged",rwindow.channel[2],function()
		local currText = guiGetText(source)
	  	local newText = string.gsub(currText,'[^0-9]','')
		if newText ~= currText then
			guiSetText(source,newText)
		end
	end,false)
end

function showCodeEdit(ctype,col)
	triggerEvent("hideInventoryManual",localPlayer)
	local sW,sH = guiGetScreenSize();
	rwindow.safe[1] = guiCreateWindow((sW-96)/2, (sH-89)/2, 96, 89, "", false);
	rwindow.safe[2] = guiCreateEdit(10, 24, 76, 26, "", false, rwindow.safe[1]);
	rwindow.safe[3] = guiCreateButton(10, 54, 44, 27, "ok", false, rwindow.safe[1]);
	rwindow.safe[4] = guiCreateButton(57, 54, 29, 27, "x", false, rwindow.safe[1]);
	guiSetProperty(rwindow.safe[1], "AlwaysOnTop", "True")
	if (ctype == "create") then guiSetText(rwindow.safe[1],"create code") end;
	if (ctype == "enter") then guiSetText(rwindow.safe[1],"enter code") end;
	if (ctype == "change") then guiSetText(rwindow.safe[1],"change code") end;
	guiEditSetMasked(rwindow.safe[2], true)
	guiSetInputMode("no_binds_when_editing");
	guiWindowSetMovable(rwindow.safe[1], false);
	guiWindowSetSizable(rwindow.safe[1], false);
	guiEditSetMaxLength(rwindow.safe[2], 4);
	Type = ctype;
	safeColTarget = col
	showCursor(true);
	addEventHandler("onClientGUIChanged",rwindow.safe[2],function()
		local currText = guiGetText(source)
	  	local newText = string.gsub(currText,'[^0-9]','')
		if newText ~= currText then
			guiSetText(source,newText)
		end
	end,false)
end

addEventHandler("onClientGUIClick", resourceRoot, function()
	if (source == rwindow.channel[3]) then
		guiSetInputMode("allow_binds");
		local channel = guiGetText(rwindow.channel[2]);
		outputChatBox(Type.." channel was set to #ffffff"..channel, 0, 255, 0, true);
		setElementData(localPlayer, Type:lower().."channel", channel);
		destroyElement(rwindow.channel[1]);
		Type = "";
	elseif (source == rwindow.channel[4]) then
		guiSetInputMode("allow_binds");
		destroyElement(rwindow.channel[1]);
		Type = "";
	elseif (source == rwindow.safe[3]) then
		guiSetInputMode("allow_binds");
		if (Type == "create") then
			local code = guiGetText(rwindow.safe[2]);
			local itemName = "item4";
			if (code ~= "" and #code == 4) then
				triggerServerEvent("onPlayerBuildASafe", localPlayer, itemName, code);
				destroyElement(rwindow.safe[1]);
				showCursor(false)
				Type = "";
				safeColTarget = nil;
			end
		elseif (Type == "enter") then
			local code = guiGetText(rwindow.safe[2]);
			if (code ~= "" and #code == 4) then
				triggerServerEvent("onPlayerEnterSafeCode", localPlayer, code, safeColTarget);
				destroyElement(rwindow.safe[1]);
				showCursor(false)
				Type = "";
				safeColTarget = nil;
			end
		elseif (Type == "change") then
			local code = guiGetText(rwindow.safe[2]);
			if (code ~= "" and #code == 4) then
				triggerServerEvent("onPlayerChangeSafeCode", localPlayer, code, safeColTarget);
				destroyElement(rwindow.safe[1]);
				showCursor(false)
				Type = "";
				safeColTarget = nil;
			end
		end
	elseif (source == rwindow.safe[4]) then
		guiSetInputMode("allow_binds");
		destroyElement(rwindow.safe[1]);
		showCursor(false)
		Type = "";
		safeColTarget = nil;
	end
end);

function playerUseItem(itemName, itemInfo)
	if (getElementData(localPlayer,itemName) < 1) then startRollMessage("menuclienttext38", 160, 40, 40); return; end
	if (itemInfo == "inventoryactiontext7") then triggerServerEvent("onPlayerRequestChangingStats", localPlayer, itemName, itemInfo, "thirst");
	elseif (itemInfo == "inventoryactiontext8") then triggerServerEvent("onPlayerRequestChangingStats", localPlayer, itemName, itemInfo, "food");   
	elseif (itemInfo == "inventoryactiontext15") then triggerServerEvent("onPlayerChangeSkin", localPlayer, itemName);
	elseif (itemName == "fooditem2") then triggerServerEvent("onPlayerRefillWaterBottle", localPlayer, itemName);     
	elseif (itemName == "item3") then triggerServerEvent("onPlayerPitchATent", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext12") then triggerServerEvent("onPlayerBuildAWireFence", localPlayer, itemName);
	elseif (itemName == "item5") then triggerServerEvent("onPlayerPlaceRoadflare", localPlayer, itemName, 255, 0, 0);
	elseif (itemName == "item11") then triggerServerEvent("onPlayerPlaceRoadflare", localPlayer, itemName, 0, 255, 0);
	elseif (itemName == "item12") then triggerServerEvent("onPlayerPlaceRoadflare", localPlayer, itemName, 0, 0, 255);
	elseif (itemName == "item13") then triggerServerEvent("onPlayerPlaceMine", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext19") then triggerServerEvent("onPlayerMakeAFire", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext11") then triggerServerEvent("onPlayerUseMedicObject", localPlayer, itemName);
	elseif (itemName == "medicine5") then triggerServerEvent("onPlayerUseMedicObject", localPlayer, itemName);
	elseif (itemInfo == "Use Googles") then triggerServerEvent("onPlayerChangeView", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext1") then triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 1);
	elseif (itemInfo == "inventoryactiontext3") then triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 2);
	elseif (itemInfo == "inventoryactiontext5") then triggerServerEvent("onPlayerRearmWeapon", localPlayer, itemName, 3);
	elseif (itemInfo == "inventoryactiontext21") then showChannelEdit("toolbelt8");
	elseif (itemInfo == "inventoryactiontext20") then showChannelEdit("toolbelt2");
	elseif (itemName == "item4") then showCodeEdit("create");
	elseif (itemInfo == "inventoryactiontext17") then triggerServerEvent("onPlayerCallAirdrop", localPlayer);
	elseif (itemInfo == "inventoryactiontext18") then triggerServerEvent("onPlayerEquipBackpack", localPlayer, itemName, getElementCurrentSlots(localPlayer));
	elseif (itemInfo == "inventoryactiontext22") then triggerServerEvent("onPlayerEquipHelmet", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext23") then triggerServerEvent("onPlayerEquipVest", localPlayer, itemName);
	elseif (itemInfo == "inventoryactiontext2") then
		triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 1);
	elseif (itemInfo == "inventoryactiontext4") then
		triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 2);
	elseif (itemInfo == "inventoryactiontext6") then
		triggerServerEvent("onPlayerUnequipWeapon", localPlayer, itemName, 3);
	end
end

function getWeaponAmmoType(weapon)
	for _,v in ipairs(weaponAmmoTable["Weapons"]) do
		if (weapon == v[2]) then return v[1], v[3]; end
	end
	for _,v in ipairs(weaponAmmoTable["others"]) do
		if (weapon == v[1]) then return v[1], v[2]; end
	end
	return false, false;
end

addEventHandler("onClientPlayerWeaponFire", localPlayer, function(weapon, ammor)
	local slot = getSlotFromWeapon(weapon);
	if (slot == 3 or slot == 5 or slot == 6 or slot == 7) then
		local ammo,_ = getWeaponAmmoType(getElementData(localPlayer, "currentweapon_1"));
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
		end
	elseif (slot == 2 or slot == 4) then
		local ammo,_ = getWeaponAmmoType(getElementData(localPlayer, "currentweapon_2"));
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
		end
	else
		local weap = getElementData(localPlayer, "currentweapon_3");
		local ammo,_ = getWeaponAmmoType(weap);
		if (getElementData(localPlayer, ammo) > 0) then
			setElementData(localPlayer, ammo, getElementData(localPlayer, ammo) - 1);
		end
	end
end);