-- Sample Hello World 
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
--  hs.alert.show("Hello World!")
end)

-- Reload configuration
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- Reacting to application events
-- Move all Finder in front
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()


-- Window Movement
-- https://andrich.blog/2016/11/20/hammerspoon-an-awesome-tool-to-automate-your-mac/
-- CTRL + ALT + Left - Move current window to the left half of the screen.
-- CTRL + ALT + Right - Move current window to the right half of the screen.
-- CTRL + ALT + Up - Go "fullscreen".
-- CTRL + ALT + Down - Center window, covering 2/3 of screen size.
--
 
function move_window(direction)
    return function()
        local win      = hs.window.focusedWindow()
        local app      = win:application()
        local app_name = app:name()
        local f        = win:frame()
        local screen   = win:screen()
        local max      = screen:frame()
 
        if direction == "left" then
	    f.x = max.x
            f.y = max.y
	    f.w = max.w / 2
            f.h = max.h
        elseif direction == "right" then
            f.x = max.x + (max.w / 2)
            f.y = max.y
            f.w = max.w / 2
            f.h = max.h
        elseif direction == "up" then
            f.x = max.x
            f.y = max.y 
            f.w = max.w
            f.h = max.h / 2
        elseif direction == "down" then
            f.x = max.x 
            f.y = max.y + (max.h / 2)
            f.w = max.w 
            f.h = max.h / 2
        elseif direction == "max" then
           if f.w > (max.w * 3/4) and f.h > (max.h * 3/4) then
                f.x = max.x + (max.w / 6)
                f.y = max.y + (max.h / 6)
                f.w = max.w * 2 / 3
                f.h = max.h * 2 / 3
           else
                f.x = max.x 
                f.y = max.y
                f.w = max.w 
                f.h = max.h
           end
        else
            hs.alert.show("move_window(): Freaky parameter received " .. direction)
        end
 
        win:setFrame(f, 0)
    end
end
 
local hyper = {"ctrl", "cmd"}
hs.hotkey.bind(hyper, "h", move_window("left"))
hs.hotkey.bind(hyper, "l", move_window("right"))
hs.hotkey.bind(hyper, "k", move_window("up"))
hs.hotkey.bind(hyper, "j", move_window("down"))
hs.hotkey.bind(hyper, "m", move_window("max"))

-- Search and dictionary
-- Past and copy
-- App quick startup

-- Use SpoonInstall,
-- http://zzamboni.org/post/using-spoons-in-hammerspoon/
-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
if hs.spoons == nil then
   hs.spoons=require('hs.spoons')
end


hs.loadSpoon ("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
INSTALL = spoon.SpoonInstall

--------------------------------------------------------------------------------
-- MouseCircle  http://www.hammerspoon.org/Spoons/MouseCircle.html
INSTALL:andUse("MouseCircle",
                {
                   disable = false,
                   config = {
                      color = hs.drawing.color.x11.rebeccapurple
                   },
                   hotkeys = {
                      show = { {"cmd", "alt", "ctrl"}, "m"}
                   }
                }
)

--------------------------------------------------------------------------------
-- TextClipboardHistory
INSTALL:andUse("TextClipboardHistory",
               {
                  config = {
                     show_in_menubar = false,
                     hist_size = 500,
                  },
                  hotkeys = {
                     toggle_clipboard = { { "cmd", "shift" }, "v"}
                  },
                  start = true;
               }
)


--------------------------------------------------------------------------------
-- Seal -- http://www.hammerspoon.org/Spoons/Seal.html
INSTALL:andUse("Seal",
               {
                  hotkeys = { show = { {"cmd", "ctrl", "alt"}, "space" } },
                  fn = function(s)
                     s:loadPlugins({"apps", "calc", "safari_bookmarks", "screencapture", "useractions"})
                     s.plugins.safari_bookmarks.always_open_with_safari = false
                     s.plugins.useractions.actions =
                        {
                           ["Hammerspoon docs webpage"] = {
                              url = "http://hammerspoon.org/docs/",
                              icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
                              -- hotkey = { hyper, "h" }
                           },
                           ["Leave corpnet"] = {
                              fn = function()
                                 spoon.WiFiTransitions:processTransition('foo', 'corpnet01')
                              end,
                              icon = swisscom_logo,
                           },
                           ["Arrive in corpnet"] = {
                              fn = function()
                                 spoon.WiFiTransitions:processTransition('corpnet01', 'foo')
                              end,
                              icon = swisscom_logo,
                           },
                           ["Translate using Leo"] = {
                              url = "http://dict.leo.org/ende/index_de.html#/search=${query}",
                              icon = 'favicon',
                              keyword = "leo",
                           },
                           ["Tell me something"] = {
                              keyword = "tellme",
                              fn = function(str) hs.alert.show(str) end,
                           }
                        }
                     s:refreshAllCommands()
                  end,
                  start = true,
               }
)
