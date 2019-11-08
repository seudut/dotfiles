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

---- Right click 
--hs.hotkey.bind({"cmd,", "alt", "ctrl"}, "l", function()
--      hs.eventtap.rightClick(hs.mouse.getAbsolutePosition())
--end)

-- Donw : For firefox vimperator
hs.hotkey.bind({"cmd", "ctrl"}, "n", function()
      hs.eventtap.keyStroke({}, 'down')
end)

-- Up
hs.hotkey.bind({"cmd", "ctrl"}, "p", function()
      hs.eventtap.keyStroke({}, 'up')
end)

hs.hotkey.bind({"ctrl"},"[", function()
    hs.eventtap.keyStroke({}, 'escape' )
end)


-- Window Movement
-- https://andrich.blog/2016/11/20/hammerspoon-an-awesome-tool-to-automate-your-mac/
-- CTRL + ALT + Left - Move current window to the left half of the screen.
-- CTRL + ALT + Right - Move current window to the right half of the screen.
-- CTRL + ALT + Up - Go "fullscreen".
-- CTRL + ALT + Down - Center window, covering 2/3 of screen size.
--
function move_window(direction)
    return function()
        --local win      = hs.window.focusedWindow()
        local win      = hs.window.frontmostWindow()
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



---- Toggle iTerm2
-- https://kalis.me/setup-hyper-key-hammerspoon-macos/
hs.hotkey.bind({"cmd"}, "I", function() 
    hs.osascript.applescriptFromFile("./applescript/iterm2_toggle.applescript")
end)


---- Toggle Emacs
hs.hotkey.bind({"cmd"}, "O", function() 
    hs.osascript.applescriptFromFile("./applescript/emacs_toggle.applescript")
end)

-----
-- Search and dictionary
-- Past and copy
-- App quick startup

-- Use SpoonInstall,
-- http://zzamboni.org/post/using-spoons-in-hammerspoon/
-- https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip
-----if hs.spoons == nil then
-----   hs.spoons=require('hs.spoons')
-----end
-----
-----
hs.loadSpoon ("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
INSTALL = spoon.SpoonInstall
-----
-------------------------------------------------------------------------------------
------- MouseCircle  http://www.hammerspoon.org/Spoons/MouseCircle.html
-----INSTALL:andUse("MouseCircle",
-----                {
-----                   disable = false,
-----                   config = {
-----                      color = hs.drawing.color.x11.rebeccapurple
-----                   },
-----                   hotkeys = {
-----                      show = { {"cmd", "alt", "ctrl"}, "m"}
-----                   }
-----                }
-----)
-----
-------------------------------------------------------------------------------------
-- TextClipboardHistory
INSTALL:andUse("TextClipboardHistory",
               {
                  config = {
                     show_in_menubar = false,
                     hist_size = 300,
                  },
                  hotkeys = {
                     toggle_clipboard = { { "cmd", "shift" }, "v"}
                  },
                  start = true;
               }
)


-------------------------------------------------------------------------------------
------- Seal -- http://www.hammerspoon.org/Spoons/Seal.html
-----INSTALL:andUse("Seal",
-----               {
-----                  hotkeys = { show = { {"cmd", "ctrl", "alt"}, "space" } },
-----                  fn = function(s)
-----                     s:loadPlugins({"apps", "calc", "safari_bookmarks", "screencapture", "useractions"})
-----                     s.plugins.safari_bookmarks.always_open_with_safari = false
-----                     s.plugins.useractions.actions =
-----                        {
-----                           ["Hammerspoon docs webpage"] = {
-----                              url = "http://hammerspoon.org/docs/",
-----                              icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
-----                              -- hotkey = { hyper, "h" }
-----                           },
-----                           ["Leave corpnet"] = {
-----                              fn = function()
-----                                 spoon.WiFiTransitions:processTransition('foo', 'corpnet01')
-----                              end,
-----                              icon = swisscom_logo,
-----                           },
-----                           ["Arrive in corpnet"] = {
-----                              fn = function()
-----                                 spoon.WiFiTransitions:processTransition('corpnet01', 'foo')
-----                              end,
-----                              icon = swisscom_logo,
-----                           },
-----                           ["Translate using Leo"] = {
-----                              url = "http://dict.leo.org/ende/index_de.html#/search=${query}",
-----                              icon = 'favicon',
-----                              keyword = "leo",
-----                           },
-----                           ["Tell me something"] = {
-----                              keyword = "tellme",
-----                              fn = function(str) hs.alert.show(str) end,
-----                           }
-----                        }
-----                     s:refreshAllCommands()
-----                  end,
-----                  start = true,
-----               }
-----)
--------------------------------------------------------------------------------
--
--
---- -- Focus the last used window.
---- local function focusLastFocused()
----     local wf = hs.window.filter
----     local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
----     if #lastFocused > 0 then lastFocused[1]:focus() end
---- end
---- 
---- -- Create the chooser.
---- -- On selection, copy the emoji and type it into the focused application.
---- local chooser = hs.chooser.new(function(choice)
----     if not choice then focusLastFocused(); return end
----     hs.pasteboard.setContents(choice["chars"])
----     focusLastFocused()
----     hs.eventtap.keyStrokes(hs.pasteboard.getContents())
---- end)
---- 
---- chooser:searchSubText(true)
---- chooser:choices(choices)
---- 
---- chooser:rows(5)
---- chooser:bgDark(true)
---- hs.hotkey.bind({"cmd", "alt"}, "E", function() chooser:show() end)

----require("remap_alt_ctrl_2_escape")
require("remap_alt_2_escape")

--- remapp, as in vimum shift-space now working when space is mapped
--mapSpaceShift = hs.hotkey.new({"shift"}, 'space', "mm", function()
--    hs.alert.show("hah");
--    hs.eventtap.keyStroke({}, 'PageUp')
--end, nil, nil)
--
--- remapp, as in vimum shift-space now working when space is mapped
mapSpaceShift = hs.hotkey.new({"shift"}, 'space', function()
    hs.eventtap.keyStroke({}, 'PageUp')
end, nil, nil)

function applicationWatcher(appName, eventType, appObject)
    if (appName == "Google Chrome" and eventType == hs.application.watcher.activated) then
        mapSpaceShift:enable()
    elseif (appName == "Google Chrome" and eventType == hs.application.watcher.deactivated) then
        mapSpaceShift:disable()
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

hs.window.filter.ignoreAlways['Mail'] = true
hs.window.filter.ignoreAlways['AppCenter'] = true
hs.window.filter.ignoreAlways['Image Viewer'] = true
hs.window.filter.ignoreAlways['LarkWindowApp'] = true
hs.window.filter.ignoreAlways['Calendar'] = true
hs.window.filter.ignoreAlways['网易有道词典'] = true
hs.window.filter.ignoreAlways['IM'] = true
hs.window.filter.ignoreAlways['Space'] = true
hs.window.filter.ignoreAlways['Sourcetree Networking'] = true
hs.window.filter.ignoreAlways['Xcode'] = true
hs.window.filter.ignoreAlways['SDK'] = true

--mapSpaceShift = hs.hotkey.new({"shift"}, 'space', nil, function()
--    hs.eventtap.keyStroke({}, 'PageUp')
--end)
--
--hs.window.filter.new('Google Chrome')
--    :subscribe(hs.window.filter.windowFocused,function() mapSpaceShift:enable() end)
--    :subscribe(hs.window.filter.windowUnfocused,function() mapSpaceShift:disable() end)
