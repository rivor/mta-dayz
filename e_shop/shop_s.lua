--[[
	Code Author: kaasis/rivor2
	Contact Info: http://steamcommunity.com/id/rivor2
]]--

-- give item if all went success
function onClientSuccessBuysItem(target,item,currency,amount,price)
	setElementData(target,item,getElementData(target,item)+amount)
	setElementData(target,currency,getElementData(target,currency)-price)
end
addEvent("MTAZeu:onClientSuccessBuysItem",true)
addEventHandler("MTAZeu:onClientSuccessBuysItem",getRootElement(),onClientSuccessBuysItem)

-- spawn vehicle if all went success
function onClientSuccessBuysVehicle(target,currency,price,x,y,z,rx,ry,rz,id,engine,rotor,tires,tankparts,scrap,slots,fuel)
	if getElementData(target,currency) < price then return; end
	local veh = createVehicle(id,x,y,z,rx,ry,rz);
	local vehCol = createColSphere(x,y,z,2.5);
	if (id == 528) then setVehicleDamageProof(veh,true); end
	attachElements(vehCol,veh);
	setElementData(vehCol,"parent",veh);
	setElementData(veh,"parent",vehCol);
	setElementData(vehCol,"vehicle",true);
	setElementData(veh,"dayzvehicle",0);
	setElementData(vehCol,"MAX_Slots",tonumber(slots));
	setElementData(vehCol,"Engine_inVehicle",engine);
	setElementData(vehCol,"Rotor_inVehicle",rotor);
	setElementData(vehCol,"Tire_inVehicle",tires);
	setElementData(vehCol,"Parts_inVehicle",tankparts);
	setElementData(vehCol,"Scrap_inVehicle",scrap);
	setElementData(vehCol,"needtires", tires);
	setElementData(vehCol,"needparts", tankparts);
	setElementData(vehCol,"needscrap", scrap);
	setElementData(vehCol,"needrotor", rotor);
	setElementData(vehCol,"needengines", engine);
	setElementData(vehCol,"spawn",{id,x,y,z});
	setElementData(vehCol,"fuel",fuel);
	setElementData(target,currency,getElementData(target,currency)-price)
end
addEvent("MTAZeu:onClientSuccessBuysVehicle",true)
addEventHandler("MTAZeu:onClientSuccessBuysVehicle",getRootElement(),onClientSuccessBuysVehicle)

addEventHandler("onPlayerLogin",root,function()
	triggerClientEvent(source,"load_shop",source);
end);