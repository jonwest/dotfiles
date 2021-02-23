--[[
 _                                                                      
| |__   __ _ _ __ ___  _ __ ___   ___ _ __ ___ _ __   ___   ___  _ __   
| '_ \ / _` | '_ ` _ \| '_ ` _ \ / _ \ '__/ __| '_ \ / _ \ / _ \| '_ \  
| | | | (_| | | | | | | | | | | |  __/ |  \__ \ |_) | (_) | (_) | | | | 
|_| |_|\__,_|_| |_| |_|_| |_| |_|\___|_|  |___/ .__/ \___/ \___/|_| |_| 
                                              |_|                      
--]]

hs.console.clearConsole()

hs.loadSpoon("SpoonInstall")

local logger = hs.logger.new('logger', 'debug')
local hotkey = { "alt", "shift" }
local hotKeyMod = { "alt", "cmd", "shift" }

function focusOrHide(appName)
    if (hs.application.frontmostApplication():name():upper() == appName:upper()) then
        hs.application.frontmostApplication():hide()
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Alacritty Hide/Show
hs.hotkey.bind({ "cmd" }, '`', function() focusOrHide('Alacritty') end)

-- Open Obsidian to Today's Note for Quick Note taking
hs.hotkey.bind({ "cmd", "shift" }, 'O', function() focusOrHide('Obsidian') end)
