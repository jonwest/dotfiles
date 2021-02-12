--[[
 _                                                                      
| |__   __ _ _ __ ___  _ __ ___   ___ _ __ ___ _ __   ___   ___  _ __   
| '_ \ / _` | '_ ` _ \| '_ ` _ \ / _ \ '__/ __| '_ \ / _ \ / _ \| '_ \  
| | | | (_| | | | | | | | | | | |  __/ |  \__ \ |_) | (_) | (_) | | | | 
|_| |_|\__,_|_| |_| |_|_| |_| |_|\___|_|  |___/ .__/ \___/ \___/|_| |_| 
                                              |_|                      
--]]

hs.console.clearConsole()

-- Launch or Focus Alacritty ("Quake" mode)
hs.hotkey.bind({"cmd"}, "`", function()
  local app = hs.application.get("Alacritty")

  if app then
    if app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  else
    hs.application.launchOrFocus("Alacritty")
    app = hs.application.get("Alacritty")
  end
end)
