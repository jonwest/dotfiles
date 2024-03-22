--[[
 _                                                                      
| |__   __ _ _ __ ___  _ __ ___   ___ _ __ ___ _ __   ___   ___  _ __   
| '_ \ / _` | '_ ` _ \| '_ ` _ \ / _ \ '__/ __| '_ \ / _ \ / _ \| '_ \  
| | | | (_| | | | | | | | | | | |  __/ |  \__ \ |_) | (_) | (_) | | | | 
|_| |_|\__,_|_| |_| |_|_| |_| |_|\___|_|  |___/ .__/ \___/ \___/|_| |_| 
                                              |_|                      
--]]

hs.console.clearConsole()

local hotkey = { "alt", "shift" }
local hotKeyMod = { "alt", "cmd", "shift" }

function focusOrHide(appName)
    if (hs.application.frontmostApplication():name():upper() == appName:upper()) then
        hs.application.frontmostApplication():hide()
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Kitty Hide/Show
hs.hotkey.bind({ "cmd" }, '`', function() focusOrHide('kitty') end)
