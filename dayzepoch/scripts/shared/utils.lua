-- [[ from wiki.mtasa.com gets current real time ]]
function isLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

function getTimestamp(year, month, day, hour, minute, second)
    -- initiate variables
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second
    
    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second
    
    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end
    
    return timestamp
end
-- [[ from wiki.mtasa.com gets current real time ]]

function showhelp(player,boolean)
    if (boolean == true) then
        setElementData(player,"showhelp",true);
        local timer = setTimer(function()
            setElementData(player,"showhelp",false);
            setElementData(player,"showhelp_timer",nil);
        end,20*1000,1)
        setElementData(player,"showhelp_timer",timer);
    else
        setElementData(player,"showhelp",false);
        if getElementData(player,"showhelp_timer") then killTimer(getElementData(player,"showhelp_timer")) end
    end
end

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

if (localPlayer) then
    local imgSize = 10;
    local imgDir = ":dayzepoch/images/dayzWindowLib/";
    local imgLeftUp = dxCreateTexture(imgDir.."leftup.png","argb",true,"clamp");
    local imgLeftDown = dxCreateTexture(imgDir.."leftdown.png","argb",true,"clamp");
    local imgRightUp = dxCreateTexture(imgDir.."rightup.png","argb",true,"clamp");
    local imgRightDown = dxCreateTexture(imgDir.."rightdown.png","argb",true,"clamp");
    local imgUp = dxCreateTexture(imgDir.."up.png","argb",true,"clamp");
    local imgDown = dxCreateTexture(imgDir.."down.png","argb",true,"clamp");
    local imgLeft = dxCreateTexture(imgDir.."left.png","argb",true,"clamp");
    local imgRight = dxCreateTexture(imgDir.."right.png","argb",true,"clamp");
    local imgMiddle = dxCreateTexture(imgDir.."middle.png","argb",true,"clamp");

    function dxDrawDayzWindow(x,y,w,h,color,postGUI,wtype)
        if (wtype == "right" or wtype == "corner") then
            dxDrawImage(x,y,imgSize,imgSize,imgLeftDown,90,0,0,color,postGUI)
        else
            dxDrawImage(x,y,imgSize,imgSize,imgLeftUp,0,0,0,color,postGUI)
        end
        dxDrawImage(x+imgSize,y,w-(imgSize*2),imgSize,imgUp,0,0,0,color,postGUI)
        if (wtype == "right") then
            dxDrawImage(x+w-imgSize,y,imgSize,imgSize,imgRightDown,-90,0,0,color,postGUI)
        else
            dxDrawImage(x+w-imgSize,y,imgSize,imgSize,imgRightUp,0,0,0,color,postGUI)
        end
        dxDrawImage(x,y+imgSize,imgSize,h-(imgSize*2),imgLeft,0,0,0,color,postGUI)
        dxDrawImage(x+imgSize,y+imgSize,w-(imgSize*2),h-(imgSize*2),imgMiddle,0,0,0,color,postGUI)
        dxDrawImage(x+w-imgSize,y+imgSize,imgSize,h-(imgSize*2),imgRight,0,0,0,color,postGUI)
        if (wtype == "left") then
            dxDrawImage(x,y+h-imgSize,imgSize,imgSize,imgLeftUp,-90,0,0,color,postGUI)
        else
            dxDrawImage(x,y+h-imgSize,imgSize,imgSize,imgLeftDown,0,0,0,color,postGUI)
        end
        dxDrawImage(x+imgSize,y+h-imgSize,w-(imgSize*2),imgSize,imgDown,0,0,0,color,postGUI)
        if (wtype == "left" or wtype == "corner") then
            dxDrawImage(x+w-imgSize,y+h-imgSize,imgSize,imgSize,imgRightUp,90,0,0,color,postGUI)
        else
            dxDrawImage(x+w-imgSize,y+h-imgSize,imgSize,imgSize,imgRightDown,0,0,0,color,postGUI)
        end
    end
end