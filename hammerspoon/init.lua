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
            f.x = max.x 
            f.y = max.y
            f.w = max.w 
            f.h = max.h
        elseif direction == "center" then
            f.x = max.x + (max.w / 6)
            f.y = max.y + (max.h / 6)
            f.w = max.w * 2 / 3
            f.h = max.h * 2 / 3
        else
            hs.alert.show("move_window(): Freaky parameter received " .. direction)
        end
 
        win:setFrame(f, 0)
    end
end
 
local hyper = {"ctrl", "alt"}
hs.hotkey.bind(hyper, "h", move_window("left"))
hs.hotkey.bind(hyper, "l", move_window("right"))
hs.hotkey.bind(hyper, "k", move_window("up"))
hs.hotkey.bind(hyper, "j", move_window("down"))
hs.hotkey.bind(hyper, "m", move_window("max"))
hs.hotkey.bind(hyper, "c", move_window("center"))

-- Search and dictionary
-- Past and copy
-- App quick startup
