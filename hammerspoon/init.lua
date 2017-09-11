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


-- Sample - Drawing on the screen - http://www.hammerspoon.org/go/#simplereload
mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)


-- window movement
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

---- multi-window layout
local laptopScreen = "Color LCD"
local windowLayout = {
    {"Safari",  nil,          laptopScreen, hs.layout.left50,    nil, nil},
    {"Mail",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
    {"iTunes",  "iTunes",     laptopScreen, hs.layout.maximized, nil, nil},
    {"iTunes",  "MiniPlayer", laptopScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
}
hs.layout.apply(windowLayout)

---- Creating a simple menubar item
--caffeine = hs.menubar.new()
--function setCaffeineDisplay(state)
--    if state then
--        caffeine:setTitle("AWAKE")
--    else
--        caffeine:setTitle("SLEEPY")
--    end
--end
--
--function caffeineClicked()
--    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
--end
--
--if caffeine then
--    caffeine:setClickCallback(caffeineClicked)
--    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
--end

-- Reacting to application events 
-- wheny active the Finder applications, all of its windows
-- will be brought to the front of the display.
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
