txd1 = engineLoadTXD ( "objects/parachute.txd" )
engineImportTXD ( txd1, 2903 )
dff1 = engineLoadDFF ( "objects/parachute.dff" )
engineReplaceModel ( dff1, 2903 )
txd2 = engineLoadTXD ( "objects/landmine.txd" )
engineImportTXD ( txd2, 1510 )
dff2 = engineLoadDFF ( "objects/landmine.dff" )
engineReplaceModel ( dff2, 1510 )

txd3 = engineLoadTXD ( "objects/safe.txd" )
engineImportTXD ( txd3, 2332 )
dff3 = engineLoadDFF ( "objects/safe.dff" )
engineReplaceModel ( dff3, 2332 )
col3 = engineLoadCOL("objects/safe.col");
engineReplaceCOL(col3, 2332);

txd4 = engineLoadTXD ( "objects/safe.txd" )
engineImportTXD ( txd4, 1829 )
dff4 = engineLoadDFF ( "objects/safe_destroyed.dff" )
engineReplaceModel ( dff4, 1829 )
col4 = engineLoadCOL("objects/safe.col");
engineReplaceCOL(col4, 1829);

local mapobjects = {
  {"ang",2296},
  {"baguilok",2297},
  {"bigsandbags",2298},
  {"baraquement",2299},
  {"controltower",2300},
  {"fire",2301},
  {"fires",2302},
  {"medictent",2303},
  {"tents",2304},
  {"tents2",2305},
  {"torre",2306},
  {"wall",2309},
}

addEventHandler("onClientResourceStart",resourceRoot,function()
  for i,v in pairs(mapobjects) do
    local col11 = engineLoadCOL("objects/map/"..v[1]..".col")
    engineReplaceCOL(col11,v[2]);
    local txd11 = engineLoadTXD("objects/map/"..v[1]..".txd");
    engineImportTXD (txd11,v[2]);
    local dff11 = engineLoadDFF("objects/map/"..v[1]..".dff");
    engineReplaceModel(dff11,v[2]);
    engineSetModelLODDistance(v[2], 1000);
  end
end);

--[[local objects = {
  --{"modelname","colname",modelid}
  {"cardboardbox","cardboardbox",1558},
  --{"firestation","firestation",2009},
  --{"generalstore","generalstore",2010},
  --{"wall","wall",2011},
  --{"wallgate","wallgate",2012},
  --{"tower","tower",2013},
  --{"shop","shop",2014},
}
]]

local vehicles = {
  {"maverick",487,false},
  {"pmaverick",497,false},
  {"hmmwv",470,false},
  {"pickup",422,false},
  {"motorcycle",468,false},
  {"ural",433,false},
  {"pbx",473,false},
  {"bike",509,false},
  {"atv",471,false},
  {"motorbike",463,false},
  {"suv",490,false},
  {"tractor",531,false},
  {"uaz",579,false},
  {"sedan",421,false},
  {"modernvan",456,false},
  {"armoredveh",528,false},
}

local admskin_txd = engineLoadTXD ("skins/admin.txd")
engineImportTXD(admskin_txd, 290)
local admskin_dff = engineLoadDFF ("skins/admin.dff", 290)
engineReplaceModel(admskin_dff, 290)

setTimer(function()
	local x, y, z = getElementPosition(localPlayer)
	local models = getElementsByType("vehicle");
	if #models ~= 0 then
		for i,v in pairs(models) do
			local model = v;
			for i,v in pairs(vehicles) do
				if getElementModel(model) == v[2] then
					local ex, ey, ez = getElementPosition(model)
					local elementdistance = getDistanceBetweenPoints2D ( x, y, ex, ey )
					if elementdistance <= 100 and v[3] == false then
						downloadFile("vehicles/"..v[1]..".txd")
						downloadFile("vehicles/"..v[1]..".dff")
					end
				end
			end
		end
	end
end, 500, 0);

function checkFile(filepath)
	if (filepath) then
		if fileExists(filepath) then
			return true;
		end
		return false;
	end
end

function onDownloadFinish(file,success)
	if ( source == resourceRoot ) then
		for _,v in pairs(vehicles) do
			if (success) then
				if (file == "vehicles/"..v[1]..".txd") then
					local vehtxd = engineLoadTXD ("vehicles/"..v[1]..".txd")
					engineImportTXD (vehtxd, v[2])
					v[3] = true;
				elseif (file == "vehicles/"..v[1]..".dff") then
					local vehdff = engineLoadDFF ("vehicles/"..v[1]..".dff", v[2])
					engineReplaceModel (vehdff, v[2])
					v[3] = true;
				end
			else
				if (file == "vehicles/"..v[1]..".txd") then
					outputChatBox (v[1]..".txd failed to download");
				elseif (file == "vehicles/"..v[1]..".dff") then
					outputChatBox (v[1]..".dff failed to download");
				end
			end
		end
	end
end
addEventHandler("onClientFileDownloadComplete",root,onDownloadFinish)