script_serverside = true;
local data_sent = {};

addEvent("boneAttach_requestAttachmentData", true);
addEventHandler("boneAttach_requestAttachmentData", root, function()
	if (data_sent[client]) then return; end
	triggerClientEvent(client, "boneAttach_sendAttachmentData", root, attPed, attBone, attX, attY, attZ, attRX, attRY, attRZ);
	data_sent[client] = true;
end);

addEventHandler("onPlayerQuit", root, function()
	data_sent[source] = nil;
end);